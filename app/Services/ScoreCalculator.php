<?php

namespace App\Services;

use App\Models\Indicator;
use App\Models\ProdiRawValue;

class ScoreCalculator
{
    /**
     * Hitung skor berdasarkan Indikator dan Data Prodi
     */
    public function calculate(Indicator $indicator, $prodiId)
    {
        // 1. Cek apakah ini indikator Kuantitatif yang punya rumus?
        if ($indicator->type !== 'QUANTITATIVE' || empty($indicator->calculation_code)) {
            return 0; // Atau throw error
        }

        // 2. Switch Logic berdasarkan Kode Rumus
        switch ($indicator->calculation_code) {
            case 'CALC_RASIO_DOSEN':
                return $this->hitungRasioDosen($indicator, $prodiId);
            
            // Tambahkan case lain di sini (misal: Waktu Tunggu, IPK, dll)
            // case 'CALC_WAKTU_TUNGGU': 
            //      return $this->hitungWaktuTunggu(...);

            default:
                return 0;
        }
    }

    /**
     * Rumus LAM-INFOKOM: Rasio Dosen Tetap (DTPS) terhadap Mahasiswa
     * Aturan (Contoh): 
     * - Jika 15 <= Rasio <= 35, Skor = 4
     * - Jika Rasio < 15 atau > 35, Skor turun proporsional (Contoh logika sederhana)
     */
    private function hitungRasioDosen($indicator, $prodiId)
    {
        // A. Ambil Data Mentah dari Database
        // Kita butuh variabel 'DTPS_JML' dan 'MHS_AKTIF_JML' (sesuai kode di Seeder tadi)
        
        $jmlDosen = $this->getRawValue($prodiId, 'DTPS_JML');
        $jmlMhs   = $this->getRawValue($prodiId, 'MHS_AKTIF_JML');

        // B. Validasi division by zero
        if ($jmlDosen <= 0) return 0;

        // C. Hitung Rasio
        $rasio = $jmlMhs / $jmlDosen;

        // D. Terapkan Logika Penilaian (Sesuai Matriks LAM-INFOKOM)
        // Jika 15 <= R <= 35 --> Skor 4
        if ($rasio >= 15 && $rasio <= 35) {
            return 4.0;
        }
        
        // Jika Rasio > 35 (Kelebihan mahasiswa), skor turun
        // Rumus contoh: Skor = 4 - ((Rasio - 35) * 0.1)
        if ($rasio > 35) {
            $skor = 4 - (($rasio - 35) * 0.1); 
            return max(0, $skor); // Jangan sampai minus
        }

        // Jika Rasio < 15 (Kelebihan dosen), skor turun
        if ($rasio < 15) {
            $skor = 4 - ((15 - $rasio) * 0.1);
            return max(0, $skor);
        }

        return 0;
    }

    /**
     * Helper untuk mengambil nilai raw terakhir
     */
    private function getRawValue($prodiId, $variableCode)
    {
        // Cari ID variable berdasarkan Code
        $var = \App\Models\RawDataVariable::where('code', $variableCode)->first();
        
        if (!$var) return 0;

        // Ambil nilai tahun terakhir (TS)
        $data = ProdiRawValue::where('prodi_id', $prodiId)
                    ->where('variable_id', $var->id)
                    ->orderBy('year', 'desc') // Asumsi tahun terbesar adalah TS
                    ->first();

        return $data ? $data->value : 0;
    }
}