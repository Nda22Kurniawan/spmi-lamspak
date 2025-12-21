<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AccreditationModel extends Model
{
    protected $guarded = ['id'];

    public function clusters()
    {
        return $this->hasMany(AssessmentCluster::class, 'model_id');
    }
}