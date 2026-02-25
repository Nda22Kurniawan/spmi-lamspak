<?php

namespace App\Services;

use App\Models\Indicator;
use App\Models\ProdiRawValue;
use App\Models\RawDataVariable;
use Symfony\Component\ExpressionLanguage\ExpressionLanguage;

class ScoreCalculator
{
    public function calculate(Indicator $indicator, $prodiId, $year = null)
    {
        if ($indicator->type !== 'QUANTITATIVE') {
            return 0;
        }

        if (empty($indicator->custom_formula)) {
            return 0;
        }

        $year = $year ?? date('Y');

        $variables = $this->getVariablesForProdi($prodiId, $year);

        $language = new ExpressionLanguage();

        try {
            $score = $language->evaluate($indicator->custom_formula, $variables);

            return max(0, min(4, $score));
        } catch (\Exception $e) {
            return 0;
        }
    }

    private function getVariablesForProdi($prodiId, $year)
    {
        $allVars = \App\Models\RawDataVariable::all();

        $result = [];

        foreach ($allVars as $var) {
            if ($var->type == 'static') {
                $data = \App\Models\ProdiRawValue::where('prodi_id', $prodiId)
                    ->where('variable_id', $var->id)
                    ->where('year', $year)
                    ->first();
                $result[$var->code] = $data ? (float) $data->value : 0.0;
            }
        }
        $language = new ExpressionLanguage();

        foreach ($allVars as $var) {
            if ($var->type == 'formula' && !empty($var->calculation_formula)) {
                try {
                    foreach ($result as $key => $val) {
                        if (is_null($val)) $result[$key] = 0.0;
                    }

                    $calculatedValue = $language->evaluate($var->calculation_formula, $result);
                    $result[$var->code] = (float) $calculatedValue;
                } catch (\Exception $e) {
                    $result[$var->code] = 0.0;
                } catch (\Exception $e) {
                    $result[$var->code] = 0.0;
                }
            }
        }

        return $result;
    }
}
