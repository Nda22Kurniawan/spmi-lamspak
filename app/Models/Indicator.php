<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Indicator extends Model
{
    use HasFactory;

    protected $fillable = [
        'cluster_id',
        'code',
        'description',
        'weight',
        'type',
        'classification',   // QUALITATIVE / QUANTITATIVE
        'calculation_code', // (Legacy/Lama, boleh dibiarkan)
        'custom_formula', 
    ];
    protected $guarded = ['id'];

    public function cluster()
    {
        return $this->belongsTo(AssessmentCluster::class, 'cluster_id');
    }

    public function rubrics()
    {
        return $this->hasMany(IndicatorRubric::class, 'indicator_id')->orderBy('score_value', 'desc');
    }

    public function variables()
    {
        return $this->belongsToMany(RawDataVariable::class, 'indicator_variables', 'indicator_id', 'variable_id');
    }
}