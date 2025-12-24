@extends('template.BaseView') {{-- Sesuaikan dengan template Anda --}}

@section('content')
    <div class="container-fluid">
        <h1 class="h3 mb-4 text-gray-800">Master Data: Tambah Indikator Penilaian</h1>

        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Form Input Indikator Baru</h6>
            </div>
            <div class="card-body">

                @if(session('success'))
                    <div class="alert alert-success">{{ session('success') }}</div>
                @endif

                <form action="{{ route('indikator.storeWizard') }}" method="POST">
                    @csrf

                    <div class="form-group">
                        <label class="font-weight-bold">Pilih Instrumen Akreditasi (LAM)</label>
                        <select id="selectLam" class="form-control" required>
                            <option value="">-- Pilih Instrumen --</option>
                            @foreach($lams as $lam)
                                <option value="{{ $lam->id }}">
                                    {{ $lam->name }} (Skor Max: {{ $lam->max_score }})
                                </option>
                            @endforeach
                        </select>
                        <small class="text-muted">Indikator ini akan berlaku untuk semua Prodi yang menggunakan LAM
                            ini.</small>
                    </div>

                    <div class="form-group d-none" id="groupCluster">
                        <label class="font-weight-bold">Pilih Klaster / Elemen Penilaian</label>
                        <select name="cluster_id" id="selectCluster" class="form-control" required>
                            <option value="">-- Loading --</option>
                        </select>
                    </div>

                    <div id="groupForm" class="d-none border-top pt-3 mt-3">
                        <h6 class="text-secondary mb-3">Detail Indikator</h6>

                        <div class="form-row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Kode Butir</label>
                                    <input type="text" name="code" class="form-control font-weight-bold"
                                        placeholder="Cth: C.2.a" required>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Bobot</label>
                                    <input type="number" step="0.01" name="weight" class="form-control" value="1.00"
                                        required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Tipe Penilaian</label>
                                    <select name="type" class="form-control" id="selectType">
                                        <option value="QUALITATIVE">Kualitatif (Rubrik 0-4)</option>
                                        <option value="QUANTITATIVE">Kuantitatif (Rumus Otomatis)</option>
                                    </select>
                                </div>
                            </div>
                            {{-- INPUTAN BARU: KLASIFIKASI --}}
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Klasifikasi / Syarat</label>
                                    <select id="selectClassification" class="form-control"
                                        onchange="toggleManualClassification(this)">
                                        <option value="UMUM">UMUM (Biasa)</option>
                                        <option value="SYARAT UNGGUL">SYARAT UNGGUL</option>
                                        <option value="MANUAL">-- Input Manual --</option>
                                    </select>
                                    {{-- Hidden input yang akan benar-benar dikirim ke Controller --}}
                                    <input type="text" name="classification" id="manualClassification"
                                        class="form-control mt-2 d-none" placeholder="Masukkan klasifikasi manual...">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Deskripsi Indikator / Pertanyaan</label>
                            <textarea name="description" rows="3" class="form-control"
                                placeholder="Tuliskan pertanyaan indikator di sini..." required></textarea>
                        </div>

                        <div class="card bg-light mb-3 d-none" id="groupQuantitative">
                            <div class="card-body">
                                <h6 class="font-weight-bold text-primary">Setting Rumus Kuantitatif</h6>

                                <div class="form-group">
                                    <label>Tulis Rumus Penilaian</label>
                                    <textarea name="custom_formula" id="formulaInput" class="form-control font-monospace"
                                        rows="3" placeholder="Contoh: (JML_DOSEN_S3 / JML_DOSEN_TOTAL) * 4"></textarea>
                                    <small class="text-muted">
                                        Gunakan kode variabel di bawah ini. Operator: <code>+ - * /</code> dan
                                        <code>( )</code>. <br>
                                        Untuk logika IF gunakan: <code>kondisi ? nilai_jika_benar : nilai_jika_salah</code>
                                    </small>
                                </div>

                                <div class="alert alert-info py-2">
                                    <small><strong>Daftar Variabel Tersedia (Klik untuk insert):</strong></small>
                                    <div id="variableList" class="mt-1">
                                        <span class="text-muted font-italic">Silakan pilih LAM terlebih dahulu...</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary btn-icon-split mt-2">
                            <span class="icon text-white-50">
                                <i class="fas fa-save"></i>
                            </span>
                            <span class="text">Simpan Indikator</span>
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // Variabel Global untuk menyimpan data variabel yang diambil
        let availableVariables = [];

        $(document).ready(function () {

            // --- 1. SAAT LAM DIPILIH ---
            $('#selectLam').change(function () {
                let lamId = $(this).val();

                // Reset Tampilan
                $('#groupCluster').addClass('d-none');
                $('#groupForm').addClass('d-none');
                $('#selectCluster').html('<option value="">-- Loading --</option>');
                $('#variableList').html('<span class="text-muted">Loading variabel...</span>');

                if (!lamId) return;

                // A. AJAX Ambil Cluster
                $.get('/api/get-clusters-by-lam/' + lamId, function (data) {
                    let options = '<option value="">-- Pilih Klaster --</option>';
                    if (data.clusters.length === 0) {
                        options = '<option value="">Tidak ada klaster ditemukan</option>';
                    } else {
                        data.clusters.forEach(function (cluster) {
                            let label = cluster.code ? `[${cluster.code}] ${cluster.name}` : cluster.name;
                            options += `<option value="${cluster.id}">${label}</option>`;
                        });
                    }
                    $('#selectCluster').html(options);
                    $('#groupCluster').removeClass('d-none');
                });

                // B. AJAX Ambil Variabel (Untuk Rumus Kuantitatif)
                // Pastikan Anda sudah membuat Route API ini: /api/get-variables-by-lam/{lam_id}
                $.get('/api/get-variables-by-lam/' + lamId, function (data) {
                    availableVariables = data.variables; // Simpan ke global
                    renderVariables(); // Tampilkan badge
                }).fail(function () {
                    $('#variableList').html('<span class="text-danger">Gagal mengambil variabel.</span>');
                });
            });

            // --- 2. SAAT KLASTER DIPILIH ---
            $('#selectCluster').change(function () {
                if ($(this).val()) {
                    $('#groupForm').removeClass('d-none');
                } else {
                    $('#groupForm').addClass('d-none');
                }
            });

            // --- 3. SAAT TIPE PENILAIAN BERUBAH ---
            $('#selectType').change(function () {
                if ($(this).val() == 'QUANTITATIVE') {
                    $('#groupQuantitative').removeClass('d-none');
                } else {
                    $('#groupQuantitative').addClass('d-none');
                }
            });
        });

        // --- FUNGSI TAMPILKAN DAFTAR VARIABEL ---
        function renderVariables() {
            let html = '';
            if (availableVariables.length === 0) {
                html = '<span class="text-muted">Tidak ada variabel terdaftar untuk LAM ini.</span>';
            } else {
                availableVariables.forEach(v => {
                    // Saat diklik, panggil fungsi insertVar
                    html += `<span class="badge badge-success mr-2 mb-1 cursor-pointer" 
                                    style="cursor:pointer; font-size:90%;" 
                                    onclick="insertVar('${v.code}')" 
                                    title="${v.name}">
                                    ${v.code}
                                 </span>`;
                });
            }
            $('#variableList').html(html);
        }

        // --- FUNGSI INSERT VARIABEL KE TEXTAREA ---
        function insertVar(code) {
            let textarea = document.getElementById('formulaInput');
            let start = textarea.selectionStart;
            let end = textarea.selectionEnd;
            let text = textarea.value;
            let before = text.substring(0, start);
            let after = text.substring(end, text.length);

            // Sisipkan kode di posisi kursor
            textarea.value = (before + code + after);

            // Kembalikan fokus ke textarea
            textarea.selectionStart = textarea.selectionEnd = start + code.length;
            textarea.focus();
        }

        function toggleManualClassification(select) {
            let manualInput = document.getElementById('manualClassification');

            if (select.value === 'MANUAL') {
                manualInput.classList.remove('d-none');
                manualInput.value = ''; // Kosongkan agar user isi sendiri
                manualInput.focus();
            } else {
                manualInput.classList.add('d-none');
                manualInput.value = select.value; // Isi dengan nilai dari select (UMUM/SYARAT UNGGUL)
            }
        }

        // Inisialisasi saat halaman load
        $(document).ready(function () {
            // Set default value untuk input hidden
            document.getElementById('manualClassification').value = document.getElementById('selectClassification').value;
        });
    </script>
@endsection