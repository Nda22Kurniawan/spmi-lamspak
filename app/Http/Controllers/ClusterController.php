<?php

namespace App\Http\Controllers;

use App\Models\AccreditationModel;
use App\Models\AssessmentCluster;
use Illuminate\Http\Request;

class ClusterController extends Controller
{
    // 1. Tampilkan Daftar Klaster (dengan Filter LAM)
    public function index(Request $request)
    {
        // Ambil daftar LAM untuk dropdown filter
        $lams = AccreditationModel::all();
        
        // Ambil lam_id dari request, atau default ke LAM pertama
        $selectedLamId = $request->get('lam_id', $lams->first()->id ?? null);
        
        $clusters = [];
        if ($selectedLamId) {
            $clusters = AssessmentCluster::where('model_id', $selectedLamId)
                        ->orderBy('order_index', 'asc')
                        ->get();
        }

        return view('master.cluster.index', compact('lams', 'selectedLamId', 'clusters'));
    }

    // 2. Form Tambah
    public function create(Request $request)
    {
        $lams = AccreditationModel::all();
        $selectedLamId = $request->get('lam_id'); // Auto select jika dari halaman index

        return view('master.cluster.create', compact('lams', 'selectedLamId'));
    }

    // 3. Simpan Data
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

    // 4. Form Edit
    public function edit($id)
    {
        $cluster = AssessmentCluster::findOrFail($id);
        $lams = AccreditationModel::all();
        return view('master.cluster.edit', compact('cluster', 'lams'));
    }

    // 5. Update Data
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

    // 6. Hapus Data
    public function destroy($id)
    {
        $cluster = AssessmentCluster::findOrFail($id);
        $lamId = $cluster->model_id; // Simpan ID untuk redirect
        
        // Cek apakah sudah ada indikator di dalamnya (Opsional: Cegah hapus jika ada isi)
        if($cluster->indicators()->count() > 0) {
            return back()->with('error', 'Gagal hapus! Klaster ini memiliki indikator penilaian.');
        }

        $cluster->delete();

        return redirect()->route('cluster.index', ['lam_id' => $lamId])
            ->with('success', 'Klaster berhasil dihapus.');
    }
}