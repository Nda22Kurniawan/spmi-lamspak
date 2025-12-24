<?php

namespace App\Services;

use App\Models\Indicator;
use App\Models\ProdiRawValue;
use App\Models\RawDataVariable;
use Symfony\Component\ExpressionLanguage\ExpressionLanguage;

class ScoreCalculator
{
    // Tambahkan parameter $year (default null agar tidak error jika lupa isi)
    public function calculate(Indicator $indicator, $prodiId, $year = null)
    {
        if ($indicator->type !== 'QUANTITATIVE') {
            return 0;
        }

        if (empty($indicator->custom_formula)) {
            return 0;
        }

        // Default tahun ini jika tidak dikirim
        $year = $year ?? date('Y');

        // Kirim tahun ke fungsi pengambilan variabel
        $variables = $this->getVariablesForProdi($prodiId, $year);

        // --- UNTUK DEBUGGING (Cek apakah angka masuk) ---
        // Hapus tanda // di bawah ini jika hasil masih 0
        // dd($variables); 
        // ------------------------------------------------

        $language = new ExpressionLanguage();

        try {
            $score = $language->evaluate($indicator->custom_formula, $variables);

            // PENTING: Jika rumus Anda menghasilkan 5, tapi disini di-limit min(4),
            // maka hasilnya akan mentok di 4.
            // Jika ingin nilai 5 muncul, ganti 4 jadi 5, atau hapus min().
            return max(0, min(4, $score));
        } catch (\Exception $e) {
            return 0;
        }
    }

    private function getVariablesForProdi($prodiId, $year)
    {
        // 1. Ambil Semua Definisi Variabel
        $allVars = \App\Models\RawDataVariable::all();

        // 2. Ambil Data Mentah dari Database (Hanya yang static/inputan)
        $result = [];

        // Step A: Masukkan data Static (Input Manual) dulu
        foreach ($allVars as $var) {
            if ($var->type == 'static') {
                $data = \App\Models\ProdiRawValue::where('prodi_id', $prodiId)
                    ->where('variable_id', $var->id)
                    ->where('year', $year)
                    ->first();
                $result[$var->code] = $data ? (float) $data->value : 0.0;
            }
        }

        // Step B: Hitung data Formula (Variable Turunan)
        // Kita pakai ExpressionLanguage juga disini
        $language = new ExpressionLanguage();

        foreach ($allVars as $var) {
            if ($var->type == 'formula' && !empty($var->calculation_formula)) {
                try {
                    // Pastikan semua variabel di $result yang bernilai null diubah jadi 0
                    foreach ($result as $key => $val) {
                        if (is_null($val)) $result[$key] = 0.0;
                    }

                    $calculatedValue = $language->evaluate($var->calculation_formula, $result);
                    $result[$var->code] = (float) $calculatedValue;
                } catch (\Exception $e) {
                    $result[$var->code] = 0.0;
                } catch (\Exception $e) {
                    // Jika error (misal dibagi 0), set 0
                    $result[$var->code] = 0.0;
                }
            }
        }

        return $result;
    }
}
