<?php

namespace App\Http\Controllers;

use App\Models\Score;

class ScoreController extends Controller
{
    public function index($num)
    {
        $data = Score::where('indikator_id', $num)->get();
        dd($data);
    }
}
