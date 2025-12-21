@extends('template.BaseView')

@section('content')
    <div class="container-fluid">
        <h1 class="h3 mb-4 text-gray-800">Master Data: Klaster / Elemen Penilaian</h1>

        @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif
        @if(session('error'))
            <div class="alert alert-danger">{{ session('error') }}</div>
        @endif

        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Daftar Klaster</h6>

                <a href="{{ route('cluster.create', ['lam_id' => $selectedLamId]) }}"
                    class="btn btn-sm btn-primary shadow-sm">
                    <i class="fas fa-plus fa-sm text-white-50"></i> Tambah Klaster Baru
                </a>
            </div>
            <div class="card-body">

                <div class="form-group row">
                    <label class="col-sm-3 col-form-label font-weight-bold">Pilih Instrumen (LAM):</label>
                    <div class="col-sm-6">
                        <select id="filterLam" class="form-control" onchange="window.location.href='?lam_id='+this.value">
                            @foreach($lams as $lam)
                                <option value="{{ $lam->id }}" {{ $selectedLamId == $lam->id ? 'selected' : '' }}>
                                    {{ $lam->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <hr>

                <div class="table-responsive">
                    <table class="table table-bordered table-striped" width="100%" cellspacing="0">
                        <thead class="thead-dark">
                            <tr>
                                <th style="width: 5%">No Urut</th>
                                <th style="width: 15%">Kode</th>
                                <th>Nama Klaster / Elemen / Standar</th>
                                <th style="width: 15%">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($clusters as $cluster)
                                <tr>
                                    <td class="text-center font-weight-bold">{{ $cluster->order_index }}</td>
                                    <td class="font-weight-bold">{{ $cluster->code }}</td>
                                    <td>
                                        {{ $cluster->name }}
                                        <div class="small text-muted mt-1">
                                            <i class="fas fa-list-ul"></i> {{ $cluster->indicators->count() }} Butir Indikator
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <a href="{{ route('cluster.edit', $cluster->id) }}" class="btn btn-sm btn-warning"
                                            title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <form action="{{ route('cluster.destroy', $cluster->id) }}" method="POST"
                                            class="d-inline" onsubmit="return confirm('Yakin hapus?');">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger" title="Hapus">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="4" class="text-center text-muted py-4">
                                        Belum ada data.
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection