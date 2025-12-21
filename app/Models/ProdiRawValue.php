<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProdiRawValue extends Model
{
    protected $guarded = ['id'];

    // Pastikan nama model Prodi Anda sesuai (misal: Prodi atau ProgramStudy)
    public function prodi()
    {
        return $this->belongsTo(Prodi::class, 'prodi_id');
    }

    public function variable()
    {
        return $this->belongsTo(RawDataVariable::class, 'variable_id');
    }
}