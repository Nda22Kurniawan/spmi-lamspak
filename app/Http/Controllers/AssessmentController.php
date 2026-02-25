<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Indicator;
use App\Models\ProdiRawValue;
use App\Models\RawDataVariable;
use App\Models\AssessmentScore;
use App\Models\IndicatorRubric;
use App\Models\AccreditationModel;
use App\Models\AssessmentCluster;
use App\Models\Prodi;
use App\Services\ScoreCalculator;
use Illuminate\Support\Facades\Auth;

class AssessmentController extends Controller
{
    protected $calculator;

    public function __construct(ScoreCalculator $calculator)
    {
        $this->calculator = $calculator;
    }

    public function indexRawData(Request $request)
    {
        $user = Auth::user();
        $prodiId = null;

        // 1. Penentuan ID Prodi berdasarkan Role
        if (in_array($user->role, ['Ketua Program Studi', 'Sekretaris Program Studi'])) {
            // Karena user menyimpan prodi_kode, kita cari ID prodi-nya dulu di tabel prodis
            $userProdi = Prodi::where('kode', $user->prodi_kode)->first();
            $prodiId = $userProdi ? $userProdi->id : null;
        } else {
            // Jika Admin / role lain, ambil dari dropdown
            $prodiId = $request->get('prodi_id');
            if (!$prodiId) {
                $firstProdi = Prodi::first();
                $prodiId = $firstProdi ? $firstProdi->id : null;
            }
        }

        // 2. Pencegahan Error 404
        if (!$prodiId) {
            return redirect()->route('dashboard')->with('error', 'Akses ditolak: Kode Prodi (' . $user->prodi_kode . ') pada akun Anda tidak ditemukan di master data Prodi.');
        }

        $prodi = Prodi::find($prodiId);

        if (!$prodi) {
            return redirect()->route('dashboard')->with('error', 'Prodi tidak ditemukan di database.');
        }

        $allProdis = Prodi::all();

        if (!$prodi->accreditation_model_id) {
            return redirect()->back()->with('error', 'Prodi ini belum disetting LAM-nya.');
        }

        $variables = RawDataVariable::where('model_id', $prodi->accreditation_model_id)->get();

        $year = $request->get('year', date('Y'));
        $existingValues = ProdiRawValue::where('prodi_id', $prodiId)
            ->where('year', $year)
            ->pluck('value', 'variable_id');

        return view('assessment.raw_data', compact('prodi', 'variables', 'existingValues', 'year', 'allProdis'));
    }

    public function storeRawData(Request $request)
    {
        $request->validate([
            'prodi_id' => 'required',
            'year' => 'required',
            'values' => 'array',
        ]);

        foreach ($request->values as $variableId => $value) {
            ProdiRawValue::updateOrCreate(
                [
                    'prodi_id' => $request->prodi_id,
                    'variable_id' => $variableId,
                    'year' => $request->year
                ],
                ['value' => $value]
            );
        }

        return back()->with('success', 'Data statistik berhasil disimpan.');
    }
    public function indexAssessment($model_id)
    {
        $model = AccreditationModel::with(['clusters.indicators.rubrics'])->findOrFail($model_id);

        // 2. Cek Hak Akses Prodi (Validasi Sederhana)
        // Anda bisa aktifkan ini jika User Login sudah benar-benar jalan
        /*
        $userProdi = Auth::user()->prodi->name; // Misal: "Teknik Informatika"
        
        // Logika Mapping Prodi -> LAM
        $allowed = false;
        if (str_contains($model->name, 'INFOKOM') && in_array($userProdi, ['Teknik Informatika', 'Sistem Informasi'])) $allowed = true;
        if (str_contains($model->name, 'SPAK') && $userProdi == 'Ilmu Komunikasi') $allowed = true;
        if (str_contains($model->name, 'WISATA') && $userProdi == 'Pariwisata') $allowed = true;
        
        if (!$allowed && !Auth::user()->isAdmin()) {
             return abort(403, 'Prodi Anda tidak berhak mengakses instrumen ini.');
        }
        */

        // 3. Ambil Nilai yang sudah tersimpan (agar form terisi)
        // Hardcode prodi_id = 1 dulu untuk testing, nanti ganti Auth::user()->prodi_id
        $prodiId = request('prodi_id') ?? 1;

        $scores = AssessmentScore::where('prodi_id', $prodiId)
            ->whereHas('indicator', function ($q) use ($model_id) {
                $q->whereHas('cluster', function ($sq) use ($model_id) {
                    $sq->where('model_id', $model_id);
                });
            })
            ->get()
            ->keyBy('indicator_id');

        return view('assessment.index', compact('model', 'scores', 'prodiId'));
    }

    public function assess(Request $request)
    {
        $request->validate([
            'prodi_id'     => 'required|exists:prodis,id',
            'indicator_id' => 'required|exists:indicators,id',
            'rubric_id'    => 'nullable|exists:indicator_rubrics,id',
            'proof_link'   => 'nullable|url',
            'notes'        => 'nullable|string'
        ]);

        $indicator = Indicator::findOrFail($request->indicator_id);
        $finalScore = 0;
        $selectedRubricId = null;

        if ($indicator->type === 'QUANTITATIVE') {
            $finalScore = $this->calculator->calculate($indicator, $request->prodi_id);
        } else {
            $rubric = IndicatorRubric::findOrFail($request->rubric_id);
            $finalScore = $rubric->score_value;
            $selectedRubricId = $rubric->id;
        }

        $weightedScore = $finalScore * ($indicator->weight ?? 0);

        $score = AssessmentScore::updateOrCreate(
            [
                'prodi_id'     => $request->prodi_id,
                'indicator_id' => $indicator->id,
            ],
            [
                'selected_rubric_id' => $selectedRubricId,
                'final_score'        => $finalScore,
                'weighted_score'     => $weightedScore,
                'proof_link'         => $request->proof_link,
                'notes'              => $request->notes,
                'status'             => 'DRAFT'
            ]
        );

        $totalOverall = AssessmentScore::where('prodi_id', $request->prodi_id)->sum('weighted_score');

        return response()->json([
            'message'             => 'Tersimpan',
            'score'               => number_format($finalScore, 2),
            'weighted_score'      => number_format($weightedScore, 2),
            'total_overall_score' => number_format($totalOverall, 2),
        ]);
    }
    public function report()
    {
        $prodiId = request('prodi_id') ?? 1;
        $scores = AssessmentScore::with(['indicator.cluster', 'prodi'])
            ->where('prodi_id', $prodiId)
            ->get();

        return view('assessment.report', compact('scores'));
    }

    public function pilihProdi()
    {
        $prodis = Prodi::with('accreditationModel')->get();

        return view('assessment.pilih_prodi', compact('prodis'));
    }

    public function formAsesmen($prodi_id)
    {
        $prodi = Prodi::findOrFail($prodi_id);

        if (!$prodi->accreditation_model_id) {
            return redirect()->route('assessment.pilih_prodi')
                ->with('error', 'Prodi belum disetting Instrumen Akreditasi.');
        }

        $model = AccreditationModel::with([
            'clusters' => fn($q) => $q->orderBy('order_index', 'asc'),
            'clusters.indicators' => fn($q) => $q->orderBy('id', 'asc'),
            'clusters.indicators.rubrics' => fn($q) => $q->orderBy('score_value', 'desc')
        ])->findOrFail($prodi->accreditation_model_id);

        $year = request('year', date('Y'));

        foreach ($model->clusters as $cluster) {
            foreach ($cluster->indicators as $indicator) {
                if ($indicator->type === 'QUANTITATIVE') {
                    $scoreValue = $this->calculator->calculate($indicator, $prodi->id, $year);

                    $weightedValue = $scoreValue * ($indicator->weight ?? 0);

                    AssessmentScore::updateOrCreate(
                        ['prodi_id' => $prodi->id, 'indicator_id' => $indicator->id],
                        [
                            'final_score' => $scoreValue,
                            'weighted_score' => $weightedValue
                        ]
                    );
                }
            }
        }

        $scores = AssessmentScore::where('prodi_id', $prodi->id)->get()->keyBy('indicator_id');
        $totalScore = AssessmentScore::where('prodi_id', $prodi->id)->sum('weighted_score');

        return view('assessment.index', [
            'model'      => $model,
            'prodi'      => $prodi,
            'scores'     => $scores,
            'prodiId'    => $prodi->id,
            'year'       => $year,
            'totalScore' => $totalScore
        ]);
    }
}
