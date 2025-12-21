@extends('template.BaseView')

@section('content')
<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Edit Master Instrumen (LAM)</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Form Edit: {{ $lam->name }}</h6>
        </div>
        <div class="card-body">
            
            <form action="{{ route('pengaturan.lam.update', $lam->id) }}" method="POST">
                @csrf
                @method('PUT') {{-- PENTING: Untuk update data --}}
                
                <div class="form-group">
                    <label class="font-weight-bold">Nama Lembaga Akreditasi</label>
                    <input type="text" name="name" class="form-control" 
                           value="{{ old('name', $lam->name) }}" required>
                </div>

                <div class="form-group">
                    <label class="font-weight-bold">Skor Maksimal</label>
                    <input type="number" name="max_score" class="form-control" 
                           value="{{ old('max_score', $lam->max_score) }}" required>
                    <small class="text-danger font-weight-bold">
                        <i class="fas fa-exclamation-triangle"></i> Perhatian:
                        Mengubah skor maksimal dapat mempengaruhi perhitungan persentase capaian pada diagram radar prodi yang sudah dinilai.
                    </small>
                </div>

                <hr>
                
                <div class="d-flex justify-content-between">
                    <a href="{{ route('pengaturan.lam') }}" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Batal
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Simpan Perubahan
                    </button>
                </div>

            </form>
        </div>
    </div>
</div>
@endsection