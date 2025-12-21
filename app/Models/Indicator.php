<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Indicator extends Model
{
    protected $guarded = ['id'];

    public function cluster()
    {
        return $this->belongsTo(AssessmentCluster::class, 'cluster_id');
    }

    // Pilihan jawaban (untuk LAM-SPAK / Kualitatif)
    public function rubrics()
    {
        return $this->hasMany(IndicatorRubric::class, 'indicator_id')->orderBy('score_value', 'desc');
    }

    // Variabel data mentah yang dibutuhkan butir ini (untuk LAM-INFOKOM)
    public function variables()
    {
        return $this->belongsToMany(RawDataVariable::class, 'indicator_variables', 'indicator_id', 'variable_id');
    }
}