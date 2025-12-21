<?php

namespace App\Http\Controllers;

use App\Models\Jenjang;
use App\Models\Prodi;
use App\Models\AccreditationModel;
use Illuminate\Http\Request;

class PengaturanController extends Controller
{
    public function jenjang()
    {
        return view('jenjang.index', [
            'jenjang' => Jenjang::NotIn(),
        ]);
    }

    public function jenjangPost(Request $request, Jenjang $jenjang)
    {
        $request->validate([
            'name' => 'required',
            'kode' => 'required',
        ]);

        $att = $request->all();
        $jenjang->create($att);
        session()->flash('pesan', '<div class="alert alert-info alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Data ' . $request->name . ' Berhasil Ditambahkan</strong>
    </div>');
        return redirect()->route('jenjang');
    }

    public function jenjangDelete(Jenjang $jenjang)
    {

        session()->flash('pesan', '<div class="alert alert-info alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Data ' . $jenjang->name . ' Berhasil Dihapus</strong>
    </div>');
        $jenjang->delete();
        return redirect()->route('jenjang');
    }

    public function jenjangPut(Request $request, Jenjang $jenjang)
    {

        $jenjang->update([
            'name' => $request->name,
            'kode' => $request->kode,
        ]);

        session()->flash('pesan', '<div class="alert alert-info alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Data Berhasil Diedit</strong>
    </div>');
        return redirect()->route('jenjang');
    }

    public function prodi()
    {
        return view('prodi.index', [
            'prodi' => Prodi::NotIn(),
            'jenjang' => Jenjang::NotIn(),
        ]);
    }

    public function prodiPost(Request $request, Prodi $prodi)
    {
        $request->validate([
            'name' => 'required',
            'kode' => 'required',
        ]);

        $att = $request->all();
        $prodi->create($att);
        session()->flash('pesan', '<div class="alert alert-info alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Data ' . $request->name . ' Berhasil Ditambahkan</strong>
    </div>');
        return redirect()->route('prodi');

    }

    public function prodiDelete(Prodi $prodi)
    {

        session()->flash('pesan', '<div class="alert alert-info alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Data ' . $prodi->name . ' Berhasil Dihapus</strong>
    </div>');
        $prodi->delete();
        return redirect()->route('prodi');
    }

    public function prodiPut(Request $request, Prodi $prodi)
    {

        $prodi->update([
            'name' => $request->name,
            'kode' => $request->kode,
            'jenjang_id' => $request->jenjang_id,
        ]);

        session()->flash('pesan', '<div class="alert alert-info alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Data Berhasil Diedit</strong>
    </div>');
        return redirect()->route('prodi');
    }

    public function createLam()
    {
        return view('pengaturan.create_lam');
    }

    // 2. Proses Simpan LAM Baru
    public function storeLam(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:50|unique:accreditation_models,name',
            'max_score' => 'required|integer|min:1|max:100', // Biasanya 4
        ]);

        AccreditationModel::create([
            'name' => $request->name,
            'max_score' => $request->max_score
        ]);

        // Redirect kembali ke halaman Mapping agar bisa langsung dipakai
        return redirect()->route('pengaturan.lam')
            ->with('success', 'Data"' . $request->name . '" berhasil ditambahkan.');
    }

    public function editLam($id)
    {
        $lam = AccreditationModel::findOrFail($id);
        return view('pengaturan.edit_lam', compact('lam'));
    }

    // 4. Proses Update LAM
    public function updateLam(Request $request, $id)
    {
        $request->validate([
            // Validasi nama unique, kecuali untuk ID yang sedang diedit ini
            'name' => 'required|string|max:50|unique:accreditation_models,name,' . $id,
            'max_score' => 'required|integer|min:1|max:100',
        ]);

        $lam = AccreditationModel::findOrFail($id);
        $lam->update([
            'name' => $request->name,
            'max_score' => $request->max_score
        ]);

        return redirect()->route('pengaturan.lam')
            ->with('success', 'Data Instrumen ' . $lam->name . ' berhasil diperbarui.');
    }

    public function mappingLam()
    {
        // Ambil semua prodi beserta model akreditasi yang sedang dipakai
        $prodis = Prodi::with('accreditationModel')->get();
        
        // Ambil daftar pilihan LAM (Infokom, SPAK, dll)
        $models = AccreditationModel::all();

        return view('pengaturan.mapping_lam', compact('prodis', 'models'));
    }

    // 2. Proses Simpan Perubahan
    public function updateMappingLam(Request $request)
    {
        $request->validate([
            'prodi_id' => 'required|exists:prodis,id',
            'model_id' => 'nullable|exists:accreditation_models,id' // Nullable jika ingin reset
        ]);

        $prodi = Prodi::findOrFail($request->prodi_id);
        
        // Update kolom accreditation_model_id
        $prodi->accreditation_model_id = $request->model_id;
        $prodi->save();

        return redirect()->back()->with('success', 'Pengaturan LAM untuk Prodi ' . $prodi->name . ' berhasil diperbarui.');
    }
}
