<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AssessmentScore extends Model
{
    protected $guarded = ['id'];

    public function prodi()
    {
        return $this->belongsTo(Prodi::class, 'prodi_id');
    }

    public function indicator()
    {
        return $this->belongsTo(Indicator::class, 'indicator_id');
    }

    // Jika penilaian kualitatif, ambil detail rubrik yang dipilih
    public function selectedRubric()
    {
        return $this->belongsTo(IndicatorRubric::class, 'selected_rubric_id');
    }
}