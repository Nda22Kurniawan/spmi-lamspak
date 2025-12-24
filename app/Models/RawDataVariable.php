<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RawDataVariable extends Model
{
    protected $guarded = ['id'];

    // Variable ini dipakai oleh indikator mana saja?
    public function indicators()
    {
        return $this->belongsToMany(Indicator::class, 'indicator_variables', 'variable_id', 'indicator_id');
    }

    protected $fillable = [
        'model_id',
        'code',
        'name',
        'description',
        'type',
        'calculation_formula' // <--- Tambahkan ini
    ];
}
