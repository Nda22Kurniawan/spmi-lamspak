<?php

namespace App\Http\Controllers;

use App\Models\Indicator;
use App\Models\AccreditationModel; // Model LAM Anda
use App\Models\IndicatorRubric;
use Illuminate\Http\Request;

class RubricController extends Controller
{
    public function index(Request $request)
    {
        // 1. Ambil Semua Data LAM (AccreditationModel)
        $lams = AccreditationModel::all();

        // 2. Ambil ID LAM yang dipilih dari URL, atau default ke LAM pertama jika kosong
        $selectedLamId = $request->get('lam_id', $lams->first()->id ?? null);

        // 3. Query Utama: Indikator Tipe KUALITATIF (yang butuh rubrik manual)
        // Kita Eager Load 'rubrics' agar bisa ditampilkan nested
        $query = Indicator::with(['rubrics' => function($q) {
            $q->orderBy('score_value', 'desc'); // Urutkan skor 4, 3, 2, 1, 0
        }])->where('type', 'QUALITATIVE');

        // 4. Terapkan Filter LAM (Via Relasi Cluster)
        // Logika: Indikator -> punya Cluster -> punya model_id (LAM)
        if ($selectedLamId) {
            $query->whereHas('cluster', function ($q) use ($selectedLamId) {
                $q->where('model_id', $selectedLamId);
            });
        }

        // 5. Pagination & Appends (Agar filter tidak hilang saat ganti halaman)
        $indicators = $query->paginate(10)->appends(['lam_id' => $selectedLamId]);

        return view('rubrics.index', compact('indicators', 'lams', 'selectedLamId'));
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