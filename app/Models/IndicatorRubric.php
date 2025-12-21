<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class IndicatorRubric extends Model
{
    protected $guarded = ['id'];

    public function indicator()
    {
        return $this->belongsTo(Indicator::class, 'indicator_id');
    }
}