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
    public function indexRawData()
    {
        // Ambil semua variabel data mentah yang ada di database
        $variables = RawDataVariable::all();

        // Ambil data yang sudah pernah diisi oleh Prodi yang sedang login (jika ada)
        // Asumsi: User login punya relasi ke Prodi, atau kita ambil dari session
        // Jika user admin, mungkin butuh pilih prodi. Di sini kita simplifikasi ambil prodi user login.

        $user = Auth::user();
        // Pastikan user punya method prodi() atau property prodi_id
        // $prodiId = $user->prodi_id; 

        // Untuk sementara hardcode atau ambil dari request jika admin
        $prodiId = request('prodi_id') ?? 1; // Default 1 untuk testing

        $existingValues = ProdiRawValue::where('prodi_id', $prodiId)
            ->get()
            ->mapWithKeys(function ($item) {
                return [$item->variable_id => $item->value];
            });

        return view('assessment.raw_data', compact('variables', 'existingValues', 'prodiId'));
    }

    public function storeRawData(Request $request)
    {
        $request->validate([
            'prodi_id' => 'required|exists:prodis,id',
            'year'     => 'required|integer',
            'data'     => 'required|array'
        ]);

        foreach ($request->data as $code => $value) {
            $variable = RawDataVariable::where('code', $code)->first();
            if ($variable) {
                ProdiRawValue::updateOrCreate(
                    [
                        'prodi_id'    => $request->prodi_id,
                        'variable_id' => $variable->id,
                        'year'        => $request->year
                    ],
                    ['value' => $value]
                );
            }
        }

        return redirect()->back()->with('success', 'Data statistik berhasil disimpan.');
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
            'proof_link'   => 'nullable|url'
        ]);

        $indicator = Indicator::find($request->indicator_id);
        $finalScore = 0;
        $selectedRubricId = null;

        // A. Kuantitatif (Hitung Rumus)
        if ($indicator->type === 'QUANTITATIVE') {
            $finalScore = $this->calculator->calculate($indicator, $request->prodi_id);
        }
        // B. Kualitatif (Pilih Rubrik)
        else {
            if (!$request->rubric_id) {
                return response()->json(['error' => 'Pilih rubrik penilaian.'], 400);
            }
            $rubric = IndicatorRubric::find($request->rubric_id);
            $finalScore = $rubric->score_value;
            $selectedRubricId = $rubric->id;
        }

        // Simpan
        $score = AssessmentScore::updateOrCreate(
            [
                'prodi_id'     => $request->prodi_id,
                'indicator_id' => $indicator->id,
            ],
            [
                'selected_rubric_id' => $selectedRubricId,
                'final_score'        => $finalScore,
                'proof_link'         => $request->proof_link,
                'notes'              => $request->notes,
                'status'             => 'DRAFT'
            ]
        );

        return response()->json([
            'message' => 'Tersimpan',
            'score'   => $finalScore,
            'color'   => $finalScore >= 3.0 ? 'success' : ($finalScore >= 2.0 ? 'warning' : 'danger')
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
        // 1. Ambil Data Prodi
        $prodi = Prodi::findOrFail($prodi_id);

        // 2. Cek apakah Prodi ini sudah disetting LAM-nya?
        if (!$prodi->accreditation_model_id) {
            return redirect()->route('assessment.pilih_prodi')
                ->with('error', 'Prodi ' . $prodi->name . ' belum disetting menggunakan Instrumen Akreditasi apapun.');
        }

        // 3. Ambil Model LAM dengan SORTING / URUTAN yang Benar
        $model = AccreditationModel::with([
            'clusters' => function ($query) {
                // Urutkan Klaster berdasarkan 'order_index' (No. Urut) dari kecil ke besar
                $query->orderBy('order_index', 'asc');
            },
            'clusters.indicators' => function ($query) {
                // Urutkan Indikator berdasarkan ID (atau bisa ganti 'code' jika mau urut abjad kode)
                $query->orderBy('id', 'asc');
            },
            'clusters.indicators.rubrics' => function ($query) {
                // Urutkan Rubrik dari skor terbesar (4) ke terkecil (0)
                $query->orderBy('score_value', 'desc');
            }
        ])->findOrFail($prodi->accreditation_model_id);

        // 4. Ambil Skor EKSISTING khusus untuk Prodi ini
        $scores = AssessmentScore::where('prodi_id', $prodi->id)
            ->get()
            ->keyBy('indicator_id');

        // Kirim data ke View
        return view('assessment.index', [
            'model' => $model,
            'prodi' => $prodi,
            'scores' => $scores,
            'prodiId' => $prodi->id
        ]);
    }
}
