<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AssessmentCluster extends Model
{
    protected $guarded = ['id'];

    public function model()
    {
        return $this->belongsTo(AccreditationModel::class, 'model_id');
    }

    public function indicators()
    {
        return $this->hasMany(Indicator::class, 'cluster_id')->orderBy('id');
    }
}