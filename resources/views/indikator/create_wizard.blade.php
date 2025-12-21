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
                    <small class="text-muted">Indikator ini akan berlaku untuk semua Prodi yang menggunakan LAM ini.</small>
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
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Kode Butir</label>
                                <input type="text" name="code" class="form-control" placeholder="Cth: C.2.a" required>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Bobot</label>
                                <input type="number" step="0.01" name="weight" class="form-control" value="1.00" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Tipe Penilaian</label>
                                <select name="type" class="form-control" id="selectType">
                                    <option value="QUALITATIVE">Kualitatif (Rubrik 0-4)</option>
                                    <option value="QUANTITATIVE">Kuantitatif (Rumus)</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Deskripsi Indikator / Pertanyaan</label>
                        <textarea name="description" rows="3" class="form-control" placeholder="Tuliskan pertanyaan indikator di sini..." required></textarea>
                    </div>

                    <div class="form-group d-none" id="groupQuantitative">
                        <label>Kode Rumus (Wajib untuk Kuantitatif)</label>
                        <input type="text" name="calculation_code" class="form-control" placeholder="Cth: CALC_RASIO_DOSEN">
                        <small class="text-danger">*Pastikan kode rumus ini sudah didaftarkan di ScoreCalculator Service.</small>
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
    $(document).ready(function() {
        // Saat LAM dipilih
        $('#selectLam').change(function(){
            let lamId = $(this).val();
            
            // Reset Tampilan
            $('#groupCluster').addClass('d-none');
            $('#groupForm').addClass('d-none');
            $('#selectCluster').html('<option value="">-- Loading --</option>');

            if(!lamId) return;

            // AJAX Ambil Cluster berdasarkan LAM ID
            $.get('/api/get-clusters-by-lam/' + lamId, function(data){
                let options = '<option value="">-- Pilih Klaster --</option>';
                
                if(data.clusters.length === 0) {
                    options = '<option value="">Tidak ada klaster ditemukan</option>';
                } else {
                    data.clusters.forEach(function(cluster){
                        // Tampilkan Kode dan Nama Klaster
                        let label = cluster.code ? `[${cluster.code}] ${cluster.name}` : cluster.name;
                        options += `<option value="${cluster.id}">${label}</option>`;
                    });
                }
                
                $('#selectCluster').html(options);
                $('#groupCluster').removeClass('d-none');
            }).fail(function(){
                alert('Gagal mengambil data klaster.');
            });
        });

        // Saat Klaster dipilih, tampilkan form
        $('#selectCluster').change(function(){
            if($(this).val()) {
                $('#groupForm').removeClass('d-none');
            } else {
                $('#groupForm').addClass('d-none');
            }
        });

        // Toggle Input Rumus jika tipe Kuantitatif
        $('#selectType').change(function(){
            if($(this).val() == 'QUANTITATIVE') {
                $('#groupQuantitative').removeClass('d-none');
            } else {
                $('#groupQuantitative').addClass('d-none');
            }
        });
    });
</script>
@endsection