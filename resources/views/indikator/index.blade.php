@extends('template.BaseView')

@section('content')
    <div class="container-fluid">
        <h1 class="h3 mb-4 text-gray-800">Master Data: Indikator Penilaian</h1>

        @if(session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session('success') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        @endif

        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Daftar Indikator / Butir</h6>

                <a href="{{ route('indikator.create') }}" class="btn btn-sm btn-primary shadow-sm">
                    <i class="fas fa-plus fa-sm text-white-50"></i> Tambah Indikator Baru
                </a>
            </div>
            <div class="card-body">

                <form method="GET" action="{{ route('indikator.index') }}">
                    <div class="row mb-4 align-items-end">
                        <div class="col-md-5">
                            <label class="font-weight-bold">Pilih Instrumen (LAM):</label>
                            <select name="lam_id" class="form-control" onchange="this.form.submit()">
                                @foreach($lams as $lam)
                                    <option value="{{ $lam->id }}" {{ $selectedLamId == $lam->id ? 'selected' : '' }}>
                                        {{ $lam->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-5 offset-md-2">
                            <label class="font-weight-bold">Cari Indikator:</label>
                            <div class="input-group">
                                <input type="text" name="search" class="form-control"
                                    placeholder="Cari kode atau deskripsi..." value="{{ request('search') }}">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="submit">
                                        <i class="fas fa-search"></i>
                                    </button>
                                    @if(request('search'))
                                        <a href="{{ route('indikator.index', ['lam_id' => $selectedLamId]) }}"
                                            class="btn btn-secondary" title="Reset">
                                            <i class="fas fa-times"></i>
                                        </a>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <hr>

                <div class="table-responsive">
                    <table class="table table-bordered table-hover" width="100%" cellspacing="0">
                        <thead class="thead-light">
                            <tr>
                                <th style="width: 20%">Klaster</th>
                                <th style="width: 10%">Kode</th>
                                <th>Deskripsi Pertanyaan</th>
                                <th style="width: 5%">Bobot</th>
                                <th style="width: 10%">Tipe</th>
                                <th style="width: 10%">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            {{-- Cek apakah $indicators kosong (bisa karena search tidak ketemu atau memang belum ada data)
                            --}}
                            @if($indicators->count() > 0)
                                @foreach($indicators as $indicator)
                                    <tr>
                                        <td class="small font-weight-bold text-primary align-middle">
                                            {{ $indicator->cluster->code }} - {{ $indicator->cluster->name }}
                                        </td>
                                        <td class="font-weight-bold align-middle">{{ $indicator->code }}</td>
                                        <td class="align-middle">{{ Str::limit($indicator->description, 120) }}</td>
                                        <td class="text-center align-middle">{{ $indicator->weight }}</td>
                                        <td class="text-center align-middle">
                                            @if($indicator->type == 'QUALITATIVE')
                                                <span class="badge badge-info">Rubrik</span>
                                            @else
                                                <span class="badge badge-warning">Rumus</span>
                                            @endif
                                        </td>
                                        <td class="text-center align-middle">
                                            <a href="{{ route('indikator.edit', $indicator->id) }}"
                                                class="btn btn-sm btn-warning mr-1" title="Edit">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <form action="{{ route('indikator.destroy', $indicator->id) }}" method="POST"
                                                class="d-inline"
                                                onsubmit="return confirm('Yakin ingin menghapus Indikator {{ $indicator->code }}? Data nilai yang terkait juga akan hilang!');">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-sm btn-danger" title="Hapus">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                            @else
                                <tr>
                                    <td colspan="6" class="text-center text-muted py-5">
                                        <i class="fas fa-folder-open fa-3x mb-3 text-gray-300"></i><br>
                                        Data indikator tidak ditemukan.
                                    </td>
                                </tr>
                            @endif
                        </tbody>
                    </table>
                </div>

                <div class="d-flex justify-content-end mt-3">
                    {{-- Pastikan AppServiceProvider menggunakan Paginator::useBootstrap() --}}
                    @if($indicators instanceof \Illuminate\Pagination\LengthAwarePaginator)
                        {{ $indicators->links() }}
                    @endif
                </div>

                <div class="small text-muted">
                    Menampilkan {{ $indicators->firstItem() ?? 0 }} sampai {{ $indicators->lastItem() ?? 0 }} dari total
                    {{ $indicators->total() ?? 0 }} data.
                </div>

            </div>
        </div>
    </div>
@endsection