@extends('template.BaseView')

@section('content')
    <div class="container-fluid">
        <h1 class="h3 mb-4 text-gray-800">Master Data: Edit Indikator</h1>

        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex justify-content-between align-items-center">
                <h6 class="m-0 font-weight-bold text-primary">Form Edit Indikator: {{ $indicator->code }}</h6>
                <a href="{{ route('indikator.index', ['lam_id' => $indicator->cluster->model_id]) }}"
                    class="btn btn-sm btn-secondary">
                    <i class="fas fa-arrow-left"></i> Kembali
                </a>
            </div>
            <div class="card-body">

                @if($errors->any())
                    <div class="alert alert-danger">
                        <ul class="mb-0">
                            @foreach($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <form action="{{ route('indikator.update', $indicator->id) }}" method="POST">
                    @csrf
                    @method('PUT') {{-- PENTING UNTUK UPDATE --}}

                    {{-- 1. PILIH LAM (Disabled karena edit indikator jarang pindah LAM) --}}
                    <div class="form-group">
                        <label class="font-weight-bold">Instrumen Akreditasi (LAM)</label>
                        <input type="text" class="form-control" value="{{ $indicator->cluster->model->name }}" disabled>
                        <small class="text-muted">Untuk memindahkan ke LAM lain, silakan hapus dan buat baru.</small>
                        {{-- Hidden input untuk keperluan JS jika butuh ID --}}
                        <input type="hidden" id="lamIdHidden" value="{{ $indicator->cluster->model_id }}">
                    </div>

                    {{-- 2. PILIH KLASTER --}}
                    <div class="form-group" id="groupCluster">
                        <label class="font-weight-bold">Klaster / Elemen Penilaian</label>
                        <select name="cluster_id" id="selectCluster" class="form-control" required>
                            @foreach($clusters as $cluster)
                                <option value="{{ $cluster->id }}" {{ $indicator->cluster_id == $cluster->id ? 'selected' : '' }}>
                                    [{{ $cluster->code }}] {{ $cluster->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    {{-- 3. DETAIL INDIKATOR --}}
                    <div id="groupForm" class="border-top pt-3 mt-3">
                        <h6 class="text-secondary mb-3">Detail Indikator</h6>

                        <div class="form-row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Kode Butir</label>
                                    <input type="text" name="code" class="form-control font-weight-bold"
                                        value="{{ old('code', $indicator->code) }}" required>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Bobot</label>
                                    <input type="number" step="0.01" name="weight" class="form-control"
                                        value="{{ old('weight', $indicator->weight) }}" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Tipe Penilaian</label>
                                    <select name="type" class="form-control" id="selectType">
                                        <option value="QUALITATIVE" {{ $indicator->type == 'QUALITATIVE' ? 'selected' : '' }}>
                                            Kualitatif (Rubrik 0-4)
                                        </option>
                                        <option value="QUANTITATIVE" {{ $indicator->type == 'QUANTITATIVE' ? 'selected' : '' }}>
                                            Kuantitatif (Rumus Otomatis)
                                        </option>
                                    </select>
                                </div>
                            </div>

                            {{-- BAGIAN BARU: KLASIFIKASI --}}
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Klasifikasi / Syarat</label>
                                    <select id="selectClassification" class="form-control"
                                        onchange="toggleManualClassification(this)">
                                        <option value="UMUM" {{ $indicator->classification == 'UMUM' ? 'selected' : '' }}>UMUM
                                            (Biasa)</option>
                                        <option value="SYARAT UNGGUL" {{ $indicator->classification == 'SYARAT UNGGUL' ? 'selected' : '' }}>SYARAT UNGGUL</option>
                                        {{-- Logika: Jika isi classification bukan UMUM/UNGGUL, maka pilih MANUAL --}}
                                        <option value="MANUAL" {{ !in_array($indicator->classification, ['UMUM', 'SYARAT UNGGUL', null]) ? 'selected' : '' }}>
                                            -- Input Manual --
                                        </option>
                                    </select>

                                    {{-- Input Hidden/Text untuk value yang dikirim ke DB --}}
                                    <input type="text" name="classification" id="manualClassification"
                                        class="form-control mt-2 {{ in_array($indicator->classification, ['UMUM', 'SYARAT UNGGUL', null]) ? 'd-none' : '' }}"
                                        placeholder="Masukkan klasifikasi manual..."
                                        value="{{ old('classification', $indicator->classification) }}">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Deskripsi Indikator / Pertanyaan</label>
                            <textarea name="description" rows="3" class="form-control"
                                required>{{ old('description', $indicator->description) }}</textarea>
                        </div>

                        {{-- 4. SETTING RUMUS KUANTITATIF --}}
                        {{-- Tampilkan class d-none hanya jika tipe awalnya QUALITATIVE --}}
                        <div class="card bg-light mb-3 {{ $indicator->type == 'QUALITATIVE' ? 'd-none' : '' }}"
                            id="groupQuantitative">
                            <div class="card-body">
                                <h6 class="font-weight-bold text-primary">Setting Rumus Kuantitatif</h6>

                                <div class="form-group">
                                    <label>Tulis Rumus Penilaian</label>
                                    <textarea name="custom_formula" id="formulaInput" class="form-control font-monospace"
                                        rows="3"
                                        placeholder="Contoh: (JML_DOSEN_S3 / JML_DOSEN_TOTAL) * 4">{{ old('custom_formula', $indicator->custom_formula) }}</textarea>
                                    <small class="text-muted">
                                        Gunakan kode variabel di bawah ini. Operator: <code>+ - * /</code> dan
                                        <code>( )</code>. <br>
                                        Logika IF: <code>kondisi ? nilai_jika_benar : nilai_jika_salah</code>
                                    </small>
                                </div>

                                <div class="alert alert-info py-2">
                                    <small><strong>Daftar Variabel Tersedia (Klik untuk insert):</strong></small>
                                    <div id="variableList" class="mt-1">
                                        <span class="text-muted font-italic">Loading variabel...</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-success btn-icon-split mt-2">
                            <span class="icon text-white-50">
                                <i class="fas fa-save"></i>
                            </span>
                            <span class="text">Update Perubahan</span>
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // Variabel Global untuk menyimpan data variabel rumus
        let availableVariables = [];

        $(document).ready(function () {

            // --- 1. INISIALISASI (Untuk Halaman Edit) ---
            // Jika halaman edit dibuka, langsung load variabel berdasarkan LAM yang ada
            let initialLamId = $('#selectLam').val() || $('#lamIdHidden').val();
            if (initialLamId) {
                loadClusters(initialLamId, "{{ $indicator->cluster_id ?? '' }}");
                loadVariables(initialLamId);
            }

            // --- 2. EVENT: SAAT LAM DIPILIH ---
            $('#selectLam').change(function () {
                let lamId = $(this).val();

                // Reset Tampilan
                $('#groupCluster').addClass('d-none');
                $('#groupForm').addClass('d-none');
                $('#selectCluster').html('<option value="">-- Loading --</option>');
                $('#variableList').html('<span class="text-muted">Loading variabel...</span>');

                if (!lamId) return;

                loadClusters(lamId);
                loadVariables(lamId);
            });

            // --- 3. EVENT: SAAT KLASTER DIPILIH ---
            $('#selectCluster').change(function () {
                if ($(this).val()) {
                    $('#groupForm').removeClass('d-none');
                } else {
                    $('#groupForm').addClass('d-none');
                }
            });

            // --- 4. EVENT: SAAT TIPE PENILAIAN BERUBAH ---
            $('#selectType').change(function () {
                if ($(this).val() == 'QUANTITATIVE') {
                    $('#groupQuantitative').removeClass('d-none');
                } else {
                    $('#groupQuantitative').addClass('d-none');
                }
            });
        });

        // --- FUNGSI: LOAD KLASTER VIA AJAX ---
        function loadClusters(lamId, selectedClusterId = '') {
            $.get('/api/get-clusters-by-lam/' + lamId, function (data) {
                let options = '<option value="">-- Pilih Klaster --</option>';
                data.clusters.forEach(function (cluster) {
                    let selected = (cluster.id == selectedClusterId) ? 'selected' : '';
                    let label = cluster.code ? `[${cluster.code}] ${cluster.name}` : cluster.name;
                    options += `<option value="${cluster.id}" ${selected}>${label}</option>`;
                });
                $('#selectCluster').html(options);
                $('#groupCluster').removeClass('d-none');

                // Jika dalam mode edit, munculkan form detail
                if (selectedClusterId) $('#groupForm').removeClass('d-none');
            });
        }

        // --- FUNGSI: LOAD VARIABEL RUMUS VIA AJAX ---
        function loadVariables(lamId) {
            // Pastikan route ini ada di controller (lihat bagian ke-2 di bawah)
            $.get('/api/get-variables-by-lam/' + lamId, function (data) {
                availableVariables = data.variables;
                renderVariables();
            }).fail(function () {
                $('#variableList').html('<span class="text-danger">Gagal mengambil variabel.</span>');
            });
        }

        // --- FUNGSI: RENDER BADGE VARIABEL ---
        function renderVariables() {
            let html = '';
            if (availableVariables.length === 0) {
                html = '<span class="text-muted small">Tidak ada variabel terdaftar.</span>';
            } else {
                availableVariables.forEach(v => {
                    html += `<span class="badge badge-success mr-2 mb-1" 
                                style="cursor:pointer; font-size:90%;" 
                                onclick="insertVar('${v.code}')" 
                                title="${v.name}">
                                ${v.code}
                             </span>`;
                });
            }
            $('#variableList').html(html);
        }

        // --- FUNGSI: INSERT VARIABEL KE POSISI KURSOR ---
        function insertVar(code) {
            let textarea = document.getElementById('formulaInput');
            let start = textarea.selectionStart;
            let end = textarea.selectionEnd;
            let text = textarea.value;
            textarea.value = text.substring(0, start) + code + text.substring(end);
            textarea.selectionStart = textarea.selectionEnd = start + code.length;
            textarea.focus();
        }

        // --- FUNGSI: TOGGLE KLASIFIKASI MANUAL ---
        function toggleManualClassification(select) {
            let manualInput = document.getElementById('manualClassification');
            if (select.value === 'MANUAL') {
                manualInput.classList.remove('d-none');
                manualInput.value = '';
                manualInput.focus();
            } else {
                manualInput.classList.add('d-none');
                manualInput.value = select.value;
            }
        }
    </script>
@endsection