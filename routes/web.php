<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\KriteriaController;
use App\Http\Controllers\Level2Controller;
use App\Http\Controllers\Level3Controller;
use App\Http\Controllers\Level4Controller;
use App\Http\Controllers\IndikatorController;
use App\Http\Controllers\ElementController;
use App\Http\Controllers\BerkasController;
use App\Http\Controllers\PengaturanController;
use App\Http\Controllers\ProdiController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\TargetController;
use App\Http\Controllers\MahasiswaController;
use App\Http\Controllers\DropdownController;
use App\Http\Controllers\AssessmentController;
use App\Http\Controllers\ClusterController;
use App\Http\Controllers\DiagramController;
use App\Http\Controllers\RawDataVariableController;
use App\Http\Controllers\RubricController;
use Illuminate\Support\Facades\Route;
use App\Models\Jenjang;
use App\Models\Prodi;

// =============================================================
// PUBLIC ROUTES (Login & Home)
// =============================================================

Route::get('login', [AuthController::class, 'index'])->name('login');
Route::post('proses', [AuthController::class, 'proses']);
Route::post('logout', [AuthController::class, 'logout'])->name('logout');

Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('tabel/{prodi:kode}', [HomeController::class, 'tabel']);
Route::get('tabel/berkas/{element}', [HomeController::class, 'berkas']);
Route::get('tabel/view/{berkas}', [HomeController::class, 'view']);
Route::get('single-search', [HomeController::class, 'singleSearch'])->name('singleSearch');
Route::post('single-search/hasil', [HomeController::class, 'hasilsingleSearch']);
Route::get('multiple-search', [HomeController::class, 'multiSearch'])->name('multipleSearch');
Route::post('multi-search/hasil', [HomeController::class, 'hasilmultiSearch']);
Route::get('diagram', [HomeController::class, 'diagram'])->name('diagram'); // Diagram Lama
Route::get('diagram/login', fn() => redirect()->route('login'));
// Route::get('diagram/{prodi:kode}', [HomeController::class, 'radarDiagram']); // Diagram Lama


// =============================================================
// PROTECTED ROUTES (Butuh Login & Role)
// =============================================================

Route::middleware(['auth', 'cekRole:Admin,Ketua LPM,Ketua Program Studi,Dosen,UPPS,Mahasiswa,Alumni'])->group(function () {
    
    // Wrap try-catch agar tidak error saat migrate fresh
    try {
        $jenjangs = Jenjang::get();
        $prodis = Prodi::get();
    } catch (\Exception $e) {
        $jenjangs = [];
        $prodis = [];
    }

    // Dashboard
    Route::get('dashboard', [DashboardController::class, 'index'])->name('dashboard');

    // ===========================================================
    // BAGIAN 1: SPMI TERINTEGRASI (FITUR BARU)
    // ===========================================================

    // --- A. PENGATURAN LAM (Administrator) ---
    // 1. Master Data LAM (Tambah/Edit Jenis LAM)
    Route::get('/pengaturan/master-lam/tambah', [PengaturanController::class, 'createLam'])->name('pengaturan.lam.create');
    Route::post('/pengaturan/master-lam/simpan', [PengaturanController::class, 'storeLam'])->name('pengaturan.lam.store');
    Route::get('/pengaturan/master-lam/edit/{id}', [PengaturanController::class, 'editLam'])->name('pengaturan.lam.edit');
    Route::put('/pengaturan/master-lam/update/{id}', [PengaturanController::class, 'updateLam'])->name('pengaturan.lam.update');
    
    // 2. Mapping Prodi ke LAM
    Route::get('/pengaturan/mapping-lam', [PengaturanController::class, 'mappingLam'])->name('pengaturan.lam');
    Route::put('/pengaturan/mapping-lam/update', [PengaturanController::class, 'updateMappingLam'])->name('pengaturan.lam.mapping.update');


    // --- B. MASTER DATA (Administrator) ---
    // 1. Master Klaster / Elemen Penilaian
    Route::get('/master/klaster', [ClusterController::class, 'index'])->name('cluster.index');
    Route::get('/master/klaster/tambah', [ClusterController::class, 'create'])->name('cluster.create');
    Route::post('/master/klaster/simpan', [ClusterController::class, 'store'])->name('cluster.store');
    Route::get('/master/klaster/edit/{id}', [ClusterController::class, 'edit'])->name('cluster.edit');
    Route::put('/master/klaster/update/{id}', [ClusterController::class, 'update'])->name('cluster.update');
    Route::delete('/master/klaster/hapus/{id}', [ClusterController::class, 'destroy'])->name('cluster.destroy');

    // 2. Master Indikator / Butir Penilaian
    Route::get('/master/indikator', [IndikatorController::class, 'index'])->name('indikator.index');
    Route::delete('/master/indikator/hapus/{id}', [IndikatorController::class, 'destroy'])->name('indikator.destroy');
    
    // Wizard Tambah Indikator (Pilih LAM -> Pilih Klaster -> Input)
    Route::get('/master/indikator/tambah', [IndikatorController::class, 'createByLam'])->name('indikator.wizard');
    Route::post('/master/indikator/simpan', [IndikatorController::class, 'storeWizard'])->name('indikator.storeWizard');


    // --- C. INPUT DATA & ASESMEN (User/Prodi) ---
    // 1. Data Statistik (DKPS) - Input Angka Mentah
    Route::get('/spmi/data-statistik', [AssessmentController::class, 'indexRawData'])->name('raw_data.index');
    Route::post('/spmi/data-statistik/store', [AssessmentController::class, 'storeRawData'])->name('raw_data.store');

    // 2. Asesmen Mutu (Penilaian)
    Route::get('/asesmen/pilih-prodi', [AssessmentController::class, 'pilihProdi'])->name('assessment.pilih_prodi');
    Route::get('/asesmen/form/{prodi_id}', [AssessmentController::class, 'formAsesmen'])->name('assessment.form');
    Route::post('/spmi/asesmen/hitung', [AssessmentController::class, 'assess'])->name('assessment.score');


    // --- D. LAPORAN & GRAFIK ---
    // Grafik Spider Chart (Radar)
    Route::get('/diagram/pilih-prodi', [DiagramController::class, 'index'])->name('diagram.index');
    Route::get('/diagram/lihat/{prodi_id}', [DiagramController::class, 'show'])->name('diagram.show');


    // --- E. API / AJAX SUPPORT (SPMI) ---
    Route::get('/api/get-clusters-by-lam/{lam_id}', [IndikatorController::class, 'getClustersByLam']);
    

    // ===========================================================
    // BAGIAN 2: FITUR LAMA (LEGACY / SISTEM AWAL)
    // ===========================================================

    // Jenjang
    foreach ($jenjangs as $jenjang) {
        Route::get("kriteria/{$jenjang->kode}", [KriteriaController::class, 'index'])->name($jenjang->kode);
    }

    // Prodi
    foreach ($prodis as $prodi) {
        Route::get("prodi/{$prodi->kode}", [ProdiController::class, 'index'])->name($prodi->kode);
        Route::get("prodi/{$prodi->kode}/{any}", [ProdiController::class, 'butir']);
    }

    // Kriteria
    Route::post('kriteria/store', [KriteriaController::class, 'store']);
    Route::delete('kriteria/hapus/{l1}', [KriteriaController::class, 'hapus']);
    Route::put('kriteria/put/{l1}', [KriteriaController::class, 'put']);

    // Level 2, 3, 4 (Sub Kriteria)
    Route::get('sub-kriteria/l2', [Level2Controller::class, 'index'])->name('level2');
    Route::post('sub-kriteria/l2/post', [Level2Controller::class, 'store']);
    Route::delete('sub-kriteria/l2/hapus/{l2}', [Level2Controller::class, 'hapus']);
    Route::put('sub-kriteria/l2/put/{l2}', [Level2Controller::class, 'put']);
    foreach ($jenjangs as $jenjang) { Route::get("sub-kriteria/l2/{$jenjang->kode}", [Level2Controller::class, 'sort']); }

    Route::get('sub-kriteria/l3', [Level3Controller::class, 'index'])->name('level3');
    Route::post('sub-kriteria/l3/post', [Level3Controller::class, 'store']);
    Route::delete('sub-kriteria/l3/hapus/{l3}', [Level3Controller::class, 'hapus']);
    Route::put('sub-kriteria/l3/put/{l3}', [Level3Controller::class, 'put']);
    foreach ($jenjangs as $jenjang) { Route::get("sub-kriteria/l3/{$jenjang->kode}", [Level3Controller::class, 'sort']); }

    Route::get('sub-kriteria/l4', [Level4Controller::class, 'index'])->name('level4');
    Route::post('sub-kriteria/l4/post', [Level4Controller::class, 'store']);
    Route::delete('sub-kriteria/l4/hapus/{l4}', [Level4Controller::class, 'hapus']);
    Route::put('sub-kriteria/l4/put/{l4}', [Level4Controller::class, 'put']);
    foreach ($jenjangs as $jenjang) { Route::get("sub-kriteria/l4/{$jenjang->kode}", [Level4Controller::class, 'sort']); }

    // Indikator Lama
    foreach ($jenjangs as $jenjang) {
        Route::get("indikator/{$jenjang->kode}", [IndikatorController::class, 'index'])->name("indikator-{$jenjang->kode}");
    }
    Route::post('indikator/store', [IndikatorController::class, 'store']);
    Route::get('indikator/input-score/{indikator}', [IndikatorController::class, 'inputScore']);
    Route::post('indikator/store-score', [IndikatorController::class, 'storeScore']);
    Route::get('indikator/cek-score/{indikator}', [IndikatorController::class, 'cekScore']);
    Route::get('indikator/konfirmasi/{indikator}', [IndikatorController::class, 'konfirmasi']);
    Route::delete('indikator/hapus/{indikator}', [IndikatorController::class, 'hapusIndikator']);
    Route::get('indikator/edit/{indikator}', [IndikatorController::class, 'editFormIndikator']);
    Route::put('indikator/put/{indikator}', [IndikatorController::class, 'putIndikator']);
    Route::get('indikator/konfrimasi-score/{score}', [IndikatorController::class, 'konfirmasiScore']);
    Route::delete('indikator/score-hapus/{score}', [IndikatorController::class, 'hapusScore']);
    Route::get('indikator/score/edit/{score}', [IndikatorController::class, 'editScore']);
    Route::put('indikator/score/put/{score}', [IndikatorController::class, 'putScore']);
    Route::get('/indikator', [IndikatorController::class, 'index'])->name('indikator.index');
    Route::get('/indikator/tambah', [IndikatorController::class, 'create'])->name('indikator.create');
    Route::post('/indikator/simpan', [IndikatorController::class, 'storeWizard'])->name('indikator.storeWizard');
    Route::get('/indikator/{id}/edit', [IndikatorController::class, 'edit'])->name('indikator.edit');
    Route::put('/indikator/{id}', [IndikatorController::class, 'update'])->name('indikator.update');
    Route::delete('/indikator/{id}', [IndikatorController::class, 'destroy'])->name('indikator.destroy');
    Route::get('/api/get-variables-by-lam/{lam_id}', [IndikatorController::class, 'getVariablesByLam']);
    
    // Element
    foreach ($prodis as $prodi) {
        Route::get("element/{$prodi->kode}", [ElementController::class, 'index'])->name("element-{$prodi->kode}");
    }
    Route::get('element/tambah', [ElementController::class, 'tambahElement'])->name('tambah-element');
    Route::post('element/store', [ElementController::class, 'store']);
    Route::get('element/unggah-berkas/{element}', [ElementController::class, 'unggahBerkas']);
    Route::post('element/store-berkas', [ElementController::class, 'storeBerkas']);
    Route::get('element/lihat-berkas/{element}', [ElementController::class, 'lihatBerkas']);
    Route::get('element/syarat-akreditasi/{element}', [ElementController::class, 'akreditas']);
    Route::put('element/put-akreditasi/{element}', [ElementController::class, 'putAkreditas']);
    Route::get('element/syarat-unggul/{element}', [ElementController::class, 'unggul']);
    Route::put('element/put-unggul/{element}', [ElementController::class, 'putUnggul']);
    Route::get('element/syarat-baik/{element}', [ElementController::class, 'baik']);
    Route::put('element/put-baik/{element}', [ElementController::class, 'putBaik']);
    Route::delete('element/reset/{element}', [ElementController::class, 'resetData']);
    Route::get('element/konfirmasi/{element}', [ElementController::class, 'konfirHapus']);
    Route::delete('element/delete/{element}', [ElementController::class, 'delete']);
    Route::get('element/detail/{element}', [ElementController::class, 'detailElement']);
    Route::put('element/bobot/put/{element}', [ElementController::class, 'putBobot']);

    // Berkas
    Route::get('berkas/cari', [BerkasController::class, 'cari'])->name('berkas');
    Route::post('berkas/hasil', [BerkasController::class, 'hasil']);
    Route::get('berkas/{berkas}', [BerkasController::class, 'detail']);
    Route::delete('berkas/hapus/{berkas}', [BerkasController::class, 'hapus']);
    Route::get('berkas/edit/{berkas}', [BerkasController::class, 'edit']);
    Route::put('berkas/put/{berkas}', [BerkasController::class, 'put']);

    // Pengaturan
    Route::get('jenjang-pendidkan', [PengaturanController::class, 'jenjang'])->name('jenjang');
    Route::post('jenjang-pendidikan/post', [PengaturanController::class, 'jenjangPost']);
    Route::delete('jenjang-pendidikan/hapus/{jenjang}', [PengaturanController::class, 'jenjangDelete']);
    Route::put('jenjang-pendidikan/put/{jenjang}', [PengaturanController::class, 'jenjangPut']);
    Route::get('program-studi', [PengaturanController::class, 'prodi'])->name('prodi');
    Route::post('program-studi/post', [PengaturanController::class, 'prodiPost']);
    Route::delete('program-studi/hapus/{prodi}', [PengaturanController::class, 'prodiDelete']);
    Route::put('program-studi/put/{prodi}', [PengaturanController::class, 'prodiPut']);

    // User Management
    Route::get('users', [AdminController::class, 'index'])->name('users');
    Route::get('users/tambah/admin', [AdminController::class, 'tambahAdmin'])->name('tambah-admin');
    Route::get('users/tambah/ketua-lpm', [AdminController::class, 'tambahLpm'])->name('tambah-lpm');
    Route::get('users/tambah/ketua-program-studi', [AdminController::class, 'tambahKaprodi'])->name('tambah-kaprodi');
    Route::get('users/tambah/dosen', [AdminController::class, 'tambahDosen'])->name('tambah-dosen');
    Route::get('users/tambah/upps', [AdminController::class, 'tambahUpps'])->name('tambah-upps');
    Route::get('users/tambah/mahasiswa-alumni', [AdminController::class, 'tambahMhsAlm'])->name('tambah-mhsalm');
    Route::post('users/store', [AdminController::class, 'store']);
    Route::delete('users/hapus/{user}', [AdminController::class, 'hapus']);
    Route::get('users/edit/{user}', [AdminController::class, 'edit']);
    Route::put('users/put/{user}', [AdminController::class, 'put']);

    // Target
    Route::get('target', [TargetController::class, 'index'])->name('target');
    Route::get('target/{prodi:kode}', [TargetController::class, 'detail']);
    Route::get('target/create-target/{prodi:kode}', [TargetController::class, 'createTarget']);
    Route::put('target/update/{target}', [TargetController::class, 'update']);

    // Mahasiswa
    Route::get('data/mahasiswa/{prodi:kode}', [MahasiswaController::class, 'index']);
    Route::get('data/mahasiswa/tambah/{prodi:kode}', [MahasiswaController::class, 'tambah']);
    Route::post('data/mahasiswa/store', [MahasiswaController::class, 'store']);

    Route::get('/variabel', [RawDataVariableController::class, 'index'])->name('variable.index');
    Route::post('/variabel', [RawDataVariableController::class, 'store'])->name('variable.store');
    Route::put('/variabel/{id}', [RawDataVariableController::class, 'update'])->name('variable.update'); // <--- INI BARU
    Route::delete('/variabel/{id}', [RawDataVariableController::class, 'destroy'])->name('variable.destroy');

    Route::get('/master/variabel-data', [RawDataVariableController::class, 'index'])->name('variable.index');
    Route::post('/master/variabel-data/simpan', [RawDataVariableController::class, 'store'])->name('variable.store');
    Route::delete('/master/variabel-data/hapus/{id}', [RawDataVariableController::class, 'destroy'])->name('variable.destroy');
    Route::get('/api/get-variables-by-lam/{lam_id}', [RawDataVariableController::class, 'getVariablesByLam'])
    ->name('api.variables.by.lam');

    Route::resource('rubrics', RubricController::class)->except(['create', 'show', 'edit']);
});

// =============================================================
// DROPDOWN AJAX ROUTES
// =============================================================

Route::post('dropdownlist/getJen', [DropdownController::class, 'getJen'])->name('getJen');
Route::post('dropdownlist/getPro', [DropdownController::class, 'getPro'])->name('getPro');
Route::post('dropdownlist/getIndikator', [DropdownController::class, 'getIndikator'])->name('getInd');
Route::post('dropdownlist/getScore', [DropdownController::class, 'getScore'])->name('getScore');
Route::post('dropdownlist/getl1', [DropdownController::class, 'getL1'])->name('l1');
Route::post('dropdownlist/getl2', [DropdownController::class, 'getL2'])->name('l2');
Route::post('dropdownlist/getl3', [DropdownController::class, 'getL3'])->name('l3');
Route::post('dropdownlist/getl4', [DropdownController::class, 'getL4'])->name('l4');

// No Multiple Saat Edit Berkas
Route::post('dropdownlist/getl1ne', [DropdownController::class, 'getL1ne'])->name('l1ne');
Route::post('dropdownlist/getl2ne', [DropdownController::class, 'getL2ne'])->name('l2ne');
Route::post('dropdownlist/getl3ne', [DropdownController::class, 'getL3ne'])->name('l3ne');
Route::post('dropdownlist/getl4ne', [DropdownController::class, 'getL4ne'])->name('l4ne');

// No Multiple [Sub Butir L2 - L4]
Route::post('dropdownlist/getjn', [DropdownController::class, 'getjn'])->name('jn');
Route::post('dropdownlist/getl1n', [DropdownController::class, 'getL1n'])->name('l1n');
Route::post('dropdownlist/getl2n', [DropdownController::class, 'getL2n'])->name('l2n');
Route::post('dropdownlist/getl3n', [DropdownController::class, 'getL3n'])->name('l3n');
Route::post('dropdownlist/getl4n', [DropdownController::class, 'getL4n'])->name('l4n');

// No Multiple Saat Edit Level [Sub Butir L2 - L4]
Route::post('dropdownlist/getjnu', [DropdownController::class, 'getjnu'])->name('jnu');
Route::post('dropdownlist/getl1nu', [DropdownController::class, 'getL1nu'])->name('l1nu');
Route::post('dropdownlist/getl2nu', [DropdownController::class, 'getL2nu'])->name('l2nu');
Route::post('dropdownlist/getl3nu', [DropdownController::class, 'getL3nu'])->name('l3nu');
Route::post('dropdownlist/getl4nu', [DropdownController::class, 'getL4nu'])->name('l4nu');