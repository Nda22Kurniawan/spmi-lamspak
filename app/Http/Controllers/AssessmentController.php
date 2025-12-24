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

    // =========================================================================
    // 1. HALAMAN DATA STATISTIK (Input Data Mentah)
    // =========================================================================
    public function indexRawData(Request $request)
    {
        // 1. Ambil ID Prodi (Bisa dari parameter URL atau Default User)
        // Simulasi: Ambil dari request ?prodi_id=1 atau default prodi pertama
        $prodiId = $request->get('prodi_id');
        // Jika null, ambil prodi user atau prodi pertama
        if (!$prodiId) {
            $firstProdi = Prodi::first();
            $prodiId = $firstProdi->id;
        }

        $prodi = Prodi::findOrFail($prodiId);

        // --- TAMBAHKAN BARIS INI (Ambil Semua Prodi untuk Dropdown) ---
        $allProdis = Prodi::all();
        // 2. Validasi LAM
        if (!$prodi->accreditation_model_id) {
            return redirect()->back()->with('error', 'Prodi ini belum disetting LAM-nya.');
        }

        // 3. Ambil Variabel DKPS
        $variables = RawDataVariable::where('model_id', $prodi->accreditation_model_id)->get();

        // 4. Ambil Data Existing (Tahun ini)
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

    // =========================================================================
    // 2. HALAMAN ASESMEN (Lembar Penilaian) -- YANG MISSING TADI
    // =========================================================================
    public function indexAssessment($model_id)
    {
        // 1. Ambil Model Akreditasi (INFOKOM, SPAK, atau WISATA)
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

    // Proses Simpan/Hitung Skor
    public function assess(Request $request)
    {
        $request->validate([
            'prodi_id'     => 'required|exists:prodis,id',
            'indicator_id' => 'required|exists:indicators,id',
            'rubric_id'    => 'nullable|exists:indicator_rubrics,id',
            'proof_link'   => 'nullable|url',
            'notes'        => 'nullable|string' // Sesuai nama kolom di DB
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

        // Hitung Skor Akhir (Weighted Score)
        $weightedScore = $finalScore * ($indicator->weight ?? 0);

        // Simpan ke kolom 'notes' yang sudah ada
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
                'notes'              => $request->notes, // Menggunakan kolom notes
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

    // =========================================================================
    // 3. HALAMAN LAPORAN (Report)
    // =========================================================================
    public function report()
    {
        // Contoh sederhana ambil semua skor
        $prodiId = request('prodi_id') ?? 1;
        $scores = AssessmentScore::with(['indicator.cluster', 'prodi'])
            ->where('prodi_id', $prodiId)
            ->get();

        // Hitung rata-rata per klaster bisa dilakukan di sini

        return view('assessment.report', compact('scores'));
    }

    public function pilihProdi()
    {
        // Jika user adalah Admin/LPM, tampilkan semua Prodi
        // Jika user adalah Kaprodi, tampilkan prodi dia saja (sesuaikan logic ini nanti)
        $prodis = Prodi::with('accreditationModel')->get();

        return view('assessment.pilih_prodi', compact('prodis'));
    }

    // B. Tampilkan Form Asesmen Spesifik Prodi
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

        // --- PERBAIKAN 1: Update simpanan Weighted Score untuk Kuantitatif ---
        foreach ($model->clusters as $cluster) {
            foreach ($cluster->indicators as $indicator) {
                if ($indicator->type === 'QUANTITATIVE') {
                    $scoreValue = $this->calculator->calculate($indicator, $prodi->id, $year);

                    // Hitung Skor Akhir (Nilai x Bobot)
                    $weightedValue = $scoreValue * ($indicator->weight ?? 0);

                    AssessmentScore::updateOrCreate(
                        ['prodi_id' => $prodi->id, 'indicator_id' => $indicator->id],
                        [
                            'final_score' => $scoreValue,
                            'weighted_score' => $weightedValue // Simpan ke kolom baru
                        ]
                    );
                }
            }
        }

        $scores = AssessmentScore::where('prodi_id', $prodi->id)->get()->keyBy('indicator_id');

        // --- PERBAIKAN 2: Sederhanakan Perhitungan Total Skor ---
        // Karena kita sudah punya kolom weighted_score, kita tidak perlu JOIN atau DB::raw lagi
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
