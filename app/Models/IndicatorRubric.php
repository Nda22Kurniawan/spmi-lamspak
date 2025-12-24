<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class IndicatorRubric extends Model
{
    protected $table = 'indicator_rubrics'; // Sesuai nama tabel di screenshot
    protected $guarded = ['id'];

    // Relasi ke tabel indicators
    public function indicator()
    {
        return $this->belongsTo(Indicator::class, 'indicator_id');
    }
}