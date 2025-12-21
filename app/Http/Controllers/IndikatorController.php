<?php

namespace App\Http\Controllers;

use App\Models\Indikator;
use App\Models\Jenjang;
use App\Models\Score;
use App\Models\Prodi;
use App\Models\AccreditationModel;
use App\Models\AssessmentCluster;
use App\Models\Indicator;
use Illuminate\Http\Request;

class IndikatorController extends Controller
{
    public function index(Request $request)
    {
        $lams = AccreditationModel::all();

        // Ambil lam_id dari request, atau default ke LAM pertama
        $selectedLamId = $request->get('lam_id', $lams->first()->id ?? null);
        $search = $request->get('search'); // Ambil kata kunci pencarian

        $indicators = collect(); // Default kosong

        if ($selectedLamId) {
            $query = Indicator::with('cluster')
                ->whereHas('cluster', function ($q) use ($selectedLamId) {
                    $q->where('model_id', $selectedLamId);
                });

            // Logika Pencarian
            if ($search) {
                $query->where(function ($q) use ($search) {
                    $q->where('code', 'like', "%{$search}%")
                        ->orWhere('description', 'like', "%{$search}%");
                });
            }

            // Sorting & Pagination
            $indicators = $query->join('assessment_clusters', 'indicators.cluster_id', '=', 'assessment_clusters.id')
                ->orderBy('assessment_clusters.order_index', 'asc') // Urutkan Cluster dulu
                ->orderBy('indicators.id', 'asc') // Lalu urutkan ID Indikator
                ->select('indicators.*') // Penting agar ID tidak tertimpa ID cluster
                ->paginate(10) // Tampilkan 10 data per halaman
                ->appends(['lam_id' => $selectedLamId, 'search' => $search]); // Agar parameter tidak hilang saat pindah hal
        }

        return view('indikator.index', compact('lams', 'selectedLamId', 'indicators', 'search'));
    }

    // 2. Hapus Indikator
    public function destroy($id)
    {
        $indicator = Indicator::findOrFail($id);

        // Simpan LAM ID untuk redirect balik ke halaman yang sama
        $lamId = $indicator->cluster->model_id;

        // Hapus (Score & Rubrik akan terhapus otomatis jika Anda set onCascadeDelete di migrasi)
        // Jika tidak, Anda perlu manual: $indicator->rubrics()->delete(); $indicator->scores()->delete();
        $indicator->delete();

        return redirect()->route('indikator.index', ['lam_id' => $lamId])
            ->with('success', 'Indikator berhasil dihapus.');
    }

    // public function index(Request $request)
    // {
    //     $kode = basename($request->path());
    //     $jenjang = Jenjang::where('kode', $kode)->first();
    //     $indikator = Indikator::where('jenjang_id', $jenjang->id)->orderBy('id', 'ASC')->get();
    //     return view('indikator.index', [
    //         'd' => $indikator,
    //         'j' => $jenjang,
    //     ]);
    // }

    public function store(Request $request)
    {
        $url = $request->url;

        $request->validate([
            'dec' => 'required',
        ]);

        Indikator::create([
            'dec' => $request->dec,
            'jenjang_id' => $request->jenjang,
        ]);

        session()->flash('pesan', '<div class="alert alert-info alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Data Berhasil Ditambahkan</strong>
    </div>');
        return redirect()->to($url);
    }

    public function konfirmasi(Indikator $indikator)
    {
        return view('indikator.konfirmasi', [
            'i' => $indikator,
            'j' => Jenjang::where('id', $indikator->jenjang_id)->first(),
        ]);
    }

    public function hapusIndikator(Indikator $indikator)
    {
        $jenjang = Jenjang::where('id', $indikator->jenjang_id)->first();
        Score::where('indikator_id', $indikator->id)->delete();
        $indikator->delete();

        session()->flash('pesan', '<div class="alert alert-info alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Data Berhasil Dihapus</strong>
    </div>');
        return redirect()->route('indikator-' . $jenjang->kode);
    }

    public function editFormIndikator(Indikator $indikator)
    {
        return view('indikator.editIndikator', [
            'i' => $indikator,
            'j' => Jenjang::where('id', $indikator->jenjang_id)->first(),
        ]);
    }

    public function putIndikator(Indikator $indikator, Request $request)
    {
        $jenjang = Jenjang::where('id', $indikator->jenjang_id)->first();
        $indikator->update([
            'dec' => $request->dec,
        ]);
        session()->flash('pesan', '<div class="alert alert-info alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Data Berhasil Diedit</strong>
    </div>');
        return redirect()->route('indikator-' . $jenjang->kode);
    }

    public function inputScore(Indikator $indikator)
    {
        return view('indikator.input-score', [
            'indikator' => $indikator,
        ]);
    }

    public function storeScore(Request $request)
    {
        $ind = Indikator::where('id', $request->indikator_id)->first();
        $jenjang = Jenjang::where('id', $ind->jenjang_id)->first();

        $request->validate([
            'name' => 'required',
            'value' => 'required',
        ]);

        Score::create([
            'name' => $request->name,
            'value' => floatval($request->value),
            'indikator_id' => $request->indikator_id,
        ]);

        session()->flash('pesan', '<div class="alert alert-info alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Data Berhasil Ditambahkan</strong>
    </div>');
        return redirect()->route('indikator-' . $jenjang->kode);
        // return redirect()->to('indikator/' . $jenjang->kode);
    }

    public function cekScore(Indikator $indikator)
    {
        $att = Score::where('indikator_id', $indikator->id)->get();
        return view('indikator.cek-score', [
            's' => $att,
        ]);
    }

    public function konfirmasiScore(Score $score)
    {
        $i = Indikator::where('id', $score->indikator_id)->first();
        $jenjang = Jenjang::where('id', $i->jenjang_id)->first();

        return view('indikator.konfirmasiScore', [
            's' => $score,
            'j' => $jenjang,
        ]);
    }

    public function hapusScore(Score $score)
    {
        $i = Indikator::where('id', $score->indikator_id)->first();
        $jenjang = Jenjang::where('id', $i->jenjang_id)->first();
        $score->delete();
        session()->flash('pesan', '<div class="alert alert-info alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Data Berhasil Dihapus</strong>
    </div>');
        return redirect()->route('indikator-' . $jenjang->kode);
    }

    public function editScore(Score $score)
    {

        return view('indikator.editScore', [
            's' => $score,
            'i' => Indikator::where('id', $score->indikator_id)->first(),
        ]);
    }

    public function putScore(Score $score, Request $request)
    {
        $i = Indikator::where('id', $score->indikator_id)->first();
        $score->update([
            'name' => $request->name,
            'value' => $request->value,
        ]);
        session()->flash('pesan', '<div class="alert alert-info alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Data Berhasil Diedit</strong>
    </div>');
        return redirect()->to('/indikator/cek-score/' . $i->id);
    }

    public function createByLam()
    {
        // Ambil semua Jenis LAM (INFOKOM, SPAK, WISATA, dll)
        $lams = AccreditationModel::all();
        return view('indikator.create_wizard', compact('lams'));
    }

    // API untuk mengambil Klaster berdasarkan LAM ID (Bukan Prodi ID)
    public function getClustersByLam($lam_id)
    {
        $lam = AccreditationModel::with('clusters')->find($lam_id);

        if (!$lam) {
            return response()->json(['error' => 'Instrumen tidak ditemukan.'], 404);
        }

        return response()->json([
            'clusters' => $lam->clusters
        ]);
    }

    // API untuk mengambil Klaster berdasarkan Prodi yang dipilih
    public function getClustersByProdi($prodi_id)
    {
        $prodi = Prodi::with('accreditationModel.clusters')->find($prodi_id);

        if (!$prodi || !$prodi->accreditationModel) {
            return response()->json(['error' => 'Prodi ini belum diseting menggunakan LAM apapun.'], 404);
        }

        return response()->json([
            'lam_name' => $prodi->accreditationModel->name,
            'clusters' => $prodi->accreditationModel->clusters
        ]);
    }

    public function storeWizard(Request $request)
    {
        // Validasi & Simpan Indikator Baru
        $request->validate([
            'cluster_id' => 'required',
            'code' => 'required',
            'description' => 'required',
            'type' => 'required',
            'weight' => 'required'
        ]);

        Indicator::create($request->all());

        return redirect()->back()->with('success', 'Indikator berhasil ditambahkan ke LAM terkait.');
    }
}
