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

    // 2. Tampilkan Grafik Spider Chart & Laporan
    public function show($prodi_id)
    {
        $prodi = Prodi::findOrFail($prodi_id);

        if (!$prodi->accreditation_model_id) {
            return back()->with('error', 'Prodi belum disetting Instrumen Akreditasi.');
        }

        $model = $prodi->accreditationModel;

        // Ambil Klaster beserta Indikatornya
        $clusters = $model->clusters()->with('indicators')->orderBy('order_index', 'asc')->get();

        // Siapkan Array Data
        $labels = [];
        $scores = [];         // Rata-rata Skor (0-4)
        $clusterCounts = [];  // Jumlah Indikator
        $weightedScores = []; // [BARU] Total Skor Terbobot per Klaster

        foreach ($clusters as $cluster) {
            // A. Label
            $shortName = Str::limit($cluster->name, 25);
            $labels[] = $cluster->code ? $cluster->code . ' ' . $shortName : $shortName;

            // B. Data Indikator
            $indicatorIds = $cluster->indicators->pluck('id');
            $totalIndicators = $indicatorIds->count();
            $clusterCounts[] = $totalIndicators;

            // C. Hitung Statistik
            if ($totalIndicators > 0) {
                // 1. Rata-rata Skor (Untuk Grafik Radar)
                $sumScore = AssessmentScore::where('prodi_id', $prodi->id)
                    ->whereIn('indicator_id', $indicatorIds)
                    ->sum('final_score');

                $avg = $sumScore / $totalIndicators;
                $scores[] = round($avg, 2);

                // 2. [BARU] Total Skor Terbobot (Untuk Tabel Laporan)
                // Mengambil dari kolom 'weighted_score' yang sudah kita buat
                $sumWeighted = AssessmentScore::where('prodi_id', $prodi->id)
                    ->whereIn('indicator_id', $indicatorIds)
                    ->sum('weighted_score');

                $weightedScores[] = round($sumWeighted, 2);
            } else {
                $scores[] = 0;
                $weightedScores[] = 0;
            }
        }

        return view('diagram.show', compact('prodi', 'model', 'labels', 'scores', 'clusterCounts', 'weightedScores'));
    }
}
