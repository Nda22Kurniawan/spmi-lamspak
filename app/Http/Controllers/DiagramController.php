<?php

namespace App\Http\Controllers;

use App\Models\Prodi;
use App\Models\AssessmentScore;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class DiagramController extends Controller
{
    public function index()
    {
        $prodis = Prodi::with('accreditationModel')->get();
        return view('diagram.pilih_prodi', compact('prodis'));
    }

    public function show($prodi_id)
    {
        $prodi = Prodi::findOrFail($prodi_id);

        if (!$prodi->accreditation_model_id) {
            return back()->with('error', 'Prodi belum disetting Instrumen Akreditasi.');
        }

        $model = $prodi->accreditationModel;

        $clusters = $model->clusters()->with('indicators')->orderBy('order_index', 'asc')->get();
        
        $model->setRelation('clusters', $clusters);

        $labels = [];
        $scores = [];         
        $clusterCounts = [];  
        $weightedScores = []; 

        foreach ($clusters as $cluster) {
            $shortName = Str::limit($cluster->name, 25);
            $labels[] = $cluster->code ? $cluster->code . ' ' . $shortName : $shortName;

            $indicatorIds = $cluster->indicators->pluck('id');
            $totalIndicators = $indicatorIds->count();
            $clusterCounts[] = $totalIndicators;

            if ($totalIndicators > 0) {
                $sumScore = AssessmentScore::where('prodi_id', $prodi->id)
                    ->whereIn('indicator_id', $indicatorIds)
                    ->sum('final_score');

                $avg = $sumScore / $totalIndicators;
                $scores[] = round($avg, 2);
                
                $sumWeighted = AssessmentScore::where('prodi_id', $prodi->id)
                    ->whereIn('indicator_id', $indicatorIds)
                    ->sum('weighted_score');

                $weightedScores[] = round($sumWeighted, 2);
            } else {
                $scores[] = 0;
                $weightedScores[] = 0;
            }
        }

        $detailScores = AssessmentScore::where('prodi_id', $prodi->id)
            ->get()
            ->keyBy('indicator_id');

        return view('diagram.show', compact('prodi', 'model', 'labels', 'scores', 'clusterCounts', 'weightedScores', 'detailScores'));
    }

    public function pencapaian()
    {
        $prodis = Prodi::all();
        
        $daftarProdi = [];
        $skorTotalProdi = [];
        $linkProdi = [];

        foreach ($prodis as $prodi) {
            $daftarProdi[] = $prodi->name;

            $linkProdi[] = url('/diagram/' . $prodi->id); 
            
            $totalSkor = AssessmentScore::where('prodi_id', $prodi->id)
                                        ->sum('weighted_score');
                                        
            $skorTotalProdi[] = round($totalSkor, 2);
        }

        return view('home.diagram.index', compact('daftarProdi', 'skorTotalProdi', 'linkProdi'));
    }
}