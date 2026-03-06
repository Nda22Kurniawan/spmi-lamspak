<?php

namespace App\Http\Controllers;

use App\Models\Indicator;
use App\Models\AccreditationModel; 
use App\Models\IndicatorRubric;
use Illuminate\Http\Request;

class RubricController extends Controller
{
    public function index(Request $request)
    {
        $lams = AccreditationModel::all();
        $selectedLamId = $request->get('lam_id', $lams->first()->id ?? null);
        
        // Menangkap input pencarian
        $search = $request->get('search');

        // ====================================================================
        // 1. QUERY UNTUK TABEL UTAMA (DENGAN PAGINATION & SEARCH)
        // ====================================================================
        $query = Indicator::with(['rubrics' => function($q) {
            $q->orderBy('score_value', 'desc'); // Urutkan skor 4, 3, 2, 1, 0
        }])->where('type', 'QUALITATIVE');

        // Filter berdasarkan LAM (melalui relasi cluster)
        if ($selectedLamId) {
            $query->whereHas('cluster', function ($q) use ($selectedLamId) {
                $q->where('model_id', $selectedLamId);
            });
        }

        if ($search) {
            $query->where(function($q) use ($search) {
                $q->where('code', 'like', '%' . $search . '%')
                  ->orWhere('description', 'like', '%' . $search . '%');
            });
        }

        $indicators = $query->paginate(10)->appends([
            'lam_id' => $selectedLamId,
            'search' => $search
        ]);

        $allIndicatorsQuery = Indicator::where('type', 'QUALITATIVE');
        
        if ($selectedLamId) {
            $allIndicatorsQuery->whereHas('cluster', function ($q) use ($selectedLamId) {
                $q->where('model_id', $selectedLamId);
            });
        }
        
        $all_indicators = $allIndicatorsQuery->get();

        return view('rubrics.index', compact('indicators', 'lams', 'selectedLamId', 'all_indicators'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'indicator_id' => 'required|exists:indicators,id',
            'score_value'  => 'required|integer|min:0|max:4',
            'description'  => 'required|string',
        ]);

        IndicatorRubric::create($request->all());

        return back()->with('success', 'Rubrik berhasil ditambahkan!');
    }

    public function update(Request $request, $id)
    {
        $rubric = IndicatorRubric::findOrFail($id);
        
        $request->validate([
            'score_value'  => 'required|integer',
            'description'  => 'required|string',
        ]);

        $rubric->update($request->all());

        return back()->with('success', 'Rubrik berhasil diperbarui!');
    }

    public function destroy($id)
    {
        IndicatorRubric::destroy($id);
        return back()->with('success', 'Rubrik dihapus.');
    }
}