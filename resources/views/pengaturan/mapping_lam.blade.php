@extends('template.BaseView')

@section('content')
<div class="container-fluid">

    <h1 class="h3 mb-4 text-gray-800">Pengaturan Instrumen Akreditasi Prodi</h1>

    @if(session('success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        {{ session('success') }}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Mapping Program Studi ke LAM</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-striped" width="100%" cellspacing="0">
                    <thead class="thead-dark">
                        <tr>
                            <th style="width: 5%">No</th>
                            <th style="width: 30%">Nama Program Studi</th>
                            <th style="width: 20%">Kode</th>
                            <th style="width: 30%">Instrumen LAM (Saat Ini)</th>
                            <th style="width: 15%">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($prodis as $index => $prodi)
                        <tr>
                            <td class="text-center">{{ $index + 1 }}</td>
                            <td class="font-weight-bold">{{ $prodi->name }}</td>
                            <td>{{ $prodi->kode }}</td>
                            <td>
                                @if($prodi->accreditationModel)
                                    <span class="badge badge-success px-3 py-2">
                                        {{ $prodi->accreditationModel->name }}
                                    </span>
                                @else
                                    <span class="badge badge-danger px-3 py-2">Belum Diset</span>
                                @endif
                            </td>
                            <td class="text-center">
                                <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#editModal{{ $prodi->id }}">
                                    <i class="fas fa-edit"></i> Ubah LAM
                                </button>

                                <div class="modal fade" id="editModal{{ $prodi->id }}" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <form action="{{ route('pengaturan.lam.mapping.update') }}" method="POST">
                                                @csrf
                                                @method('PUT')
                                                <input type="hidden" name="prodi_id" value="{{ $prodi->id }}">
                                                
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Setting LAM: {{ $prodi->name }}</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-left">
                                                    <div class="form-group">
                                                        <label>Pilih Instrumen Akreditasi</label>
                                                        <select name="model_id" class="form-control" required>
                                                            <option value="">-- Pilih LAM --</option>
                                                            @foreach($models as $model)
                                                                <option value="{{ $model->id }}" 
                                                                    {{ $prodi->accreditation_model_id == $model->id ? 'selected' : '' }}>
                                                                    {{ $model->name }} (Max Skor: {{ $model->max_score }})
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                        <small class="text-muted mt-2 d-block">
                                                            Pastikan pilihan sesuai dengan rumpun ilmu prodi (Misal: Teknik -> INFOKOM).
                                                        </small>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                                                    <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="card shadow mb-4 mt-5">
    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-success">Daftar Master Instrumen (LAM) Tersedia</h6>
        <a href="{{ route('pengaturan.lam.create') }}" class="btn btn-sm btn-success shadow-sm">
            <i class="fas fa-plus fa-sm text-white-50"></i> Tambah Baru
        </a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" width="100%" cellspacing="0">
                <thead class="thead-light">
                    <tr>
                        <th style="width: 5%">No</th>
                        <th>Nama Instrumen</th>
                        <th>Skor Maksimal</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($models as $index => $model)
                    <tr>
                        <td class="text-center">{{ $index + 1 }}</td>
                        <td class="font-weight-bold">{{ $model->name }}</td>
                        <td>{{ $model->max_score }}</td>
                        <td>
                            <a href="{{ route('pengaturan.lam.edit', $model->id) }}" class="btn btn-sm btn-warning">
                                <i class="fas fa-edit"></i> Edit
                            </a>
                            </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
        </div>
    </div>
</div>
@endsection