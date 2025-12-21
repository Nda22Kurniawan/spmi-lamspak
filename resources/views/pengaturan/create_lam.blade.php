@extends('template.BaseView')

@section('content')
<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Tambah Master Instrumen (LAM)</h1>

    <div class="row">
        <div class="col-lg-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Form Data LAM Baru</h6>
                </div>
                <div class="card-body">
                    
                    <form action="{{ route('pengaturan.lam.store') }}" method="POST">
                        @csrf
                        
                        <div class="form-group">
                            <label class="font-weight-bold">Nama Lembaga Akreditasi</label>
                            <input type="text" name="name" class="form-control" 
                                   placeholder="Contoh: LAM-TEKNIK, LAM-EMBA" required>
                            <small class="text-muted">Gunakan nama yang singkat dan jelas.</small>
                        </div>

                        <div class="form-group">
                            <label class="font-weight-bold">Skor Maksimal</label>
                            <input type="number" name="max_score" class="form-control" value="4" required>
                            <small class="text-muted">
                                Standar akreditasi saat ini umumnya menggunakan skala 4. 
                                (LAM-SPAK biasanya skala 2, sesuaikan jika perlu).
                            </small>
                        </div>

                        <hr>
                        
                        <div class="d-flex justify-content-between">
                            <a href="{{ route('pengaturan.lam') }}" class="btn btn-secondary">
                                <i class="fas fa-arrow-left"></i> Kembali
                            </a>
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-save"></i> Simpan LAM
                            </button>
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card shadow mb-4 border-left-info">
                <div class="card-body">
                    <h5 class="font-weight-bold text-info">Informasi</h5>
                    <p>Halaman ini digunakan untuk mendaftarkan Lembaga Akreditasi Mandiri (LAM) baru ke dalam sistem.</p>
                    <p>Setelah ditambahkan:</p>
                    <ol>
                        <li>Anda dapat memetakan Prodi ke LAM ini di menu <strong>Setting LAM Prodi</strong>.</li>
                        <li>Anda dapat mulai menginput indikator/butir penilaian khusus untuk LAM ini di menu <strong>Tambah Indikator Baru</strong>.</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection