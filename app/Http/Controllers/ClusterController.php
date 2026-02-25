<?php

namespace App\Http\Controllers;

use App\Models\AccreditationModel;
use App\Models\AssessmentCluster;
use Illuminate\Http\Request;

class ClusterController extends Controller
{
    public function index(Request $request)
    {
        $lams = AccreditationModel::all();
        
        $selectedLamId = $request->get('lam_id', $lams->first()->id ?? null);
        
        $clusters = [];
        if ($selectedLamId) {
            $clusters = AssessmentCluster::where('model_id', $selectedLamId)
                        ->orderBy('order_index', 'asc')
                        ->get();
        }

        return view('master.cluster.index', compact('lams', 'selectedLamId', 'clusters'));
    }

    public function create(Request $request)
    {
        $lams = AccreditationModel::all();
        $selectedLamId = $request->get('lam_id');

        return view('master.cluster.create', compact('lams', 'selectedLamId'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'model_id' => 'required|exists:accreditation_models,id',
            'name' => 'required|string',
            'code' => 'nullable|string|max:10',
            // 'weight' => 'required', // <--- HAPUS INI
            'order_index' => 'required|integer'
        ]);

        AssessmentCluster::create($request->all());

        return redirect()->route('cluster.index', ['lam_id' => $request->model_id])
            ->with('success', 'Klaster berhasil ditambahkan.');
    }

    public function edit($id)
    {
        $cluster = AssessmentCluster::findOrFail($id);
        $lams = AccreditationModel::all();
        return view('master.cluster.edit', compact('cluster', 'lams'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'model_id' => 'required|exists:accreditation_models,id',
            'name' => 'required|string',
            'code' => 'nullable|string|max:10',
            // 'weight' => 'required', // <--- HAPUS INI
            'order_index' => 'required|integer'
        ]);

        $cluster = AssessmentCluster::findOrFail($id);
        $cluster->update($request->all());

        return redirect()->route('cluster.index', ['lam_id' => $request->model_id])
            ->with('success', 'Klaster berhasil diperbarui.');
    }

    public function destroy($id)
    {
        $cluster = AssessmentCluster::findOrFail($id);
        $lamId = $cluster->model_id;
        
        if($cluster->indicators()->count() > 0) {
            return back()->with('error', 'Gagal hapus! Klaster ini memiliki indikator penilaian.');
        }

        $cluster->delete();

        return redirect()->route('cluster.index', ['lam_id' => $lamId])
            ->with('success', 'Klaster berhasil dihapus.');
    }
}