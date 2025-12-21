<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Score extends Model
{
    protected $fillable = ['name','value','indikator_id'];
    public $timestamps = false;
}
