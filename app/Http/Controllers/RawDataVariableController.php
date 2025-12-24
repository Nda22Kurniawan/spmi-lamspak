<?php

namespace App\Http\Controllers;

use App\Models\AccreditationModel;
use App\Models\RawDataVariable;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class RawDataVariableController extends Controller
{
    /**
     * 1. Tampilkan Daftar Variabel & Form (Create/Edit)
     */
    public function index(Request $request)
    {
        $lams = AccreditationModel::orderBy('name', 'asc')->get();

        // Ambil LAM yang sedang dipilih (Filter), default ke yang pertama
        $selectedLamId = $request->get('lam_id', $lams->first()->id ?? null);

        // Ambil Data Variabel berdasarkan LAM
        $variables = [];
        if ($selectedLamId) {
            $variables = RawDataVariable::where('model_id', $selectedLamId)
                ->orderBy('created_at', 'desc') // Data terbaru di atas
                ->get();
        }

        // LOGIKA EDIT: Cek apakah user sedang mengklik tombol Edit?
        $editVariable = null;
        if ($request->has('edit_id')) {
            $editVariable = RawDataVariable::find($request->edit_id);

            // Jika sedang edit, paksa selectedLamId pindah ke LAM milik variabel tersebut
            // Ini mencegah tampilan error jika user edit variabel dari tab LAM yang salah
            if ($editVariable) {
                $selectedLamId = $editVariable->model_id;
            }
        }

        return view('master.variable.index', compact('lams', 'selectedLamId', 'variables', 'editVariable'));
    }

    /**
     * 2. Simpan Variabel Baru
     */
    public function store(Request $request)
    {
        $request->validate([
            'model_id' => 'required|exists:accreditation_models,id',
            // PERBAIKAN VALIDASI: Unik hanya jika dalam model_id (LAM) yang sama
            'code' => [
                'required',
                'alpha_dash',
                Rule::unique('raw_data_variables')->where(function ($query) use ($request) {
                    return $query->where('model_id', $request->model_id);
                })
            ],
            'name'                => 'required|string|max:255',
            'type'                => 'required|in:static,formula',
            'calculation_formula' => 'nullable|string',
            'description'         => 'nullable|string'
        ]);

        RawDataVariable::create($request->all());

        return redirect()->route('variable.index', ['lam_id' => $request->model_id])
            ->with('success', 'Variabel DKPS berhasil ditambahkan.');
    }

    public function update(Request $request, $id)
    {
        $variable = RawDataVariable::findOrFail($id);

        $request->validate([
            'model_id' => 'required|exists:accreditation_models,id',
            // PERBAIKAN VALIDASI UPDATE: Unik di LAM sama, tapi abaikan ID diri sendiri
            'code' => [
                'required',
                'alpha_dash',
                Rule::unique('raw_data_variables')->where(function ($query) use ($request) {
                    return $query->where('model_id', $request->model_id);
                })->ignore($variable->id)
            ],
            'name'                => 'required|string|max:255',
            'type'                => 'required|in:static,formula',
            'calculation_formula' => 'nullable|string',
            'description'         => 'nullable|string'
        ]);

        $variable->update($request->all());

        return redirect()->route('variable.index', ['lam_id' => $request->model_id])
            ->with('success', 'Variabel DKPS berhasil diperbarui.');
    }

    /**
     * 4. Hapus Variabel
     */
    public function destroy($id)
    {
        $variable = RawDataVariable::findOrFail($id);
        $lamId = $variable->model_id; // Simpan ID LAM dulu sebelum dihapus

        $variable->delete();

        // Redirect kembali ke Tab LAM yang sama
        return redirect()->route('variable.index', ['lam_id' => $lamId])
            ->with('success', 'Variabel berhasil dihapus.');
    }

    /**
     * 5. API: Ambil Variabel by LAM (Untuk keperluan AJAX Javascript)
     */
    public function getVariablesByLam($lam_id)
    {
        $variables = RawDataVariable::where('model_id', $lam_id)
            ->select('id', 'code', 'name', 'description')
            ->orderBy('code', 'asc')
            ->get();

        return response()->json([
            'variables' => $variables
        ]);
    }
}
