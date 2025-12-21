<?php

namespace Database\Seeders;

use App\Models\AccreditationModel;
use App\Models\AssessmentCluster;
use App\Models\Indicator;
use App\Models\IndicatorRubric;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LamInfokomSeeder extends Seeder
{
    public function run()
    {
        DB::transaction(function () {
            // 1. Buat Model Akreditasi
            $model = AccreditationModel::firstOrCreate(
                ['name' => 'LAM-INFOKOM'],
                ['max_score' => 4]
            );

            // 2. Buat Klaster "C. Pendidikan" (Kriteria 2)
            $cluster = AssessmentCluster::create([
                'model_id' => $model->id,
                'name' => 'C. Pendidikan (Relevansi Pendidikan)',
                'code' => 'C',
                'order_index' => 3,
                'weight' => 0.30 // Bobot 30% sesuai dokumen
            ]);

            // 3. Masukkan Contoh Indikator: STD-PEND-2.1.A
            // (Data diambil dari file "LAMInfokom New_Evaluasi Butir.xlsx - Pendidikan.csv")
            
            $indicator = Indicator::create([
                'cluster_id' => $cluster->id,
                'code' => 'STD-PEND-2.1.A',
                'description' => 'Dekan bertanggungjawab memastikan Sistem penerimaan mahasiswa baru dan pengelolaan DTPR berfungsi efektif untuk menjamin perluasan akses, keragaman, dan pemenuhan rasio yang ideal.',
                'type' => 'QUALITATIVE', // Karena penilaian pakai rubrik 0-4
                'weight' => 5.00
            ]);

            // 4. Masukkan Rubrik Penilaian (Sangat Baik s/d Kurang)
            $rubrics = [
                4 => 'Tersedianya Kebijakan, standar dan indikator terkait DTPR, penerimaan mahasiswa baru disertai bukti-bukti yang sahih dan sangat lengkap.',
                3 => 'Tersedianya Kebijakan, standar dan indikator terkait DTPR, penerimaan mahasiswa baru disertai bukti-bukti yang sahih dan lengkap.',
                2 => 'Tersedianya Kebijakan, standar dan indikator terkait DTPR, penerimaan mahasiswa baru disertai bukti-bukti yang sahih dan cukup lengkap.',
                1 => 'Tersedianya Kebijakan, standar dan indikator terkait DTPR, penerimaan mahasiswa baru disertai bukti-bukti yang sahih dan kurang lengkap.',
                0 => 'Tidak tersedia kebijakan atau bukti sahih.'
            ];

            foreach ($rubrics as $score => $desc) {
                IndicatorRubric::create([
                    'indicator_id' => $indicator->id,
                    'score_value' => $score,
                    'description' => $desc
                ]);
            }

            // --- CONTOH 2: Indikator Kuantitatif (Rasio Dosen) ---
            // Ini contoh indikator yang pakai Rumus (bukan pilih rubrik)
            
            // a. Definisikan Variabel Data Mentah dulu
            // Pastikan variable sudah ada atau create baru
            $varDosen = \App\Models\RawDataVariable::firstOrCreate(
                ['code' => 'DTPS_JML'], 
                ['name' => 'Jumlah Dosen Tetap PS']
            );
            $varMhs = \App\Models\RawDataVariable::firstOrCreate(
                ['code' => 'MHS_AKTIF_JML'], 
                ['name' => 'Jumlah Mahasiswa Aktif']
            );

            // b. Buat Indikator
            $indRasio = Indicator::create([
                'cluster_id' => $cluster->id,
                'code' => 'STD-PEND-RASIO', 
                'description' => 'Rasio Dosen Tetap (DTPS) terhadap Mahasiswa. (Jika 15 <= Rasio <= 35, Skor = 4)',
                'type' => 'QUANTITATIVE',
                'calculation_code' => 'CALC_RASIO_DOSEN', // Nanti dipakai di Controller
                'weight' => 4.00
            ]);

            // c. Hubungkan Indikator dengan Variabel yang dibutuhkan
            $indRasio->variables()->attach([$varDosen->id, $varMhs->id]);
        });
    }
}