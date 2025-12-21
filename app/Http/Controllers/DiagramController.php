<?php

namespace App\Http\Controllers;

use App\Models\Prodi;
use App\Models\AssessmentScore;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class DiagramController extends Controller
{
    // 1. Halaman Pilih Prodi (Entry Point)
    public function index()
    {
        // Tampilkan daftar prodi untuk dipilih
        $prodis = Prodi::with('accreditationModel')->get();
        return view('diagram.pilih_prodi', compact('prodis'));
    }

    // 2. Tampilkan Grafik Spider Chart
    public function show($prodi_id)
    {
        $prodi = Prodi::findOrFail($prodi_id);

        // Validasi: Prodi harus sudah punya LAM
        if (!$prodi->accreditation_model_id) {
            return back()->with('error', 'Prodi ini belum disetting menggunakan Instrumen LAM.');
        }

        $model = $prodi->accreditationModel;
        
        // Ambil Klaster (Kriteria)
        $clusters = $model->clusters()->orderBy('order_index', 'asc')->get();

        // Siapkan Array untuk Chart.js
        $labels = [];
        $scores = [];
        $maxScores = [];

        foreach ($clusters as $cluster) {
            // A. Label Grafik (Contoh: "C.1 Visi Misi")
            // Kita potong nama klaster biar tidak kepanjangan di grafik
            $shortName = Str::limit($cluster->name, 20); 
            $labels[] = $cluster->code ? $cluster->code . ' - ' . $shortName : $shortName;

            // B. Hitung Rata-rata Skor per Klaster
            // Ambil semua ID indikator dalam klaster ini
            $indicatorIds = $cluster->indicators->pluck('id');

            // Ambil skor yang sudah dinilai untuk prodi ini
            // Logic: Jumlah Skor / Jumlah Indikator (Average)
            // Note: Indikator yang belum dinilai dianggap 0 atau tidak dihitung (tergantung kebijakan).
            // Di sini kita pakai AVG dari database, yg null tidak dihitung.
            
            $avgScore = AssessmentScore::where('prodi_id', $prodi->id)
                        ->whereIn('indicator_id', $indicatorIds)
                        ->avg('final_score');

            $scores[] = round($avgScore ?? 0, 2); // Pembulatan 2 desimal
            $maxScores[] = $model->max_score; // Garis batas luar (Target)
        }

        return view('diagram.show', compact('prodi', 'model', 'labels', 'scores', 'maxScores'));
    }
}