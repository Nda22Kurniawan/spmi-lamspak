@extends('template.BaseView')
@section('content')
    <div class="row">
        <div class="col">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Program Studi</h6>
                </div>
                <div class="card-body">
                    @if (session()->has('pesan'))
                        {!! session()->get('pesan') !!}
                    @endif
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Kode</th>
                                    <th>Jenjang</th>
                                    <th width="150px">Aksi</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Name</th>
                                    <th>Kode</th>
                                    <th>Jenjang</th>
                                    <th width="150px">Aksi</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                @foreach ($prodi as $i)
                                    <tr>
                                        <td>{{ $i->name }}</td>
                                        <td>{{ $i->kode }}</td>
                                        <td>{{ $i->jenjang->kode }}</td>
                                        <td width="150px" class="text-center">
                                            <button type="button" class="btn btn-warning btn-sm" data-toggle="modal"
                                                data-target="#modelEdit{{ $i->id }}">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal"
                                                data-target="#modelHapus{{ $i->id }}">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    {{-- EDIT DATA --}}
                                    <div class="modal fade" id="modelEdit{{ $i->id }}" tabindex="-1"
                                        role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <form action="/program-studi/put/{{ $i->id }}" method="POST">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Edit Program Studi</h5>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        @csrf
                                                        @method('PUT')
                                                        <div class="form-group">
                                                            <label for="">Nama Program Studi</label>
                                                            <input type="text" name="name" class="form-control"
                                                                placeholder="Diploma 3" aria-describedby="helpId"
                                                                value="{{ $i->name }}" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="">Kode</label>
                                                            <input type="text" name="kode" class="form-control"
                                                                placeholder="D3" aria-describedby="helpId"
                                                                value="{{ $i->kode }}" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="">Jenjang</label>
                                                            <select class="form-control" name="jenjang_id">
                                                                <option selected value="{{ $i->jenjang_id }}">
                                                                    {{ $i->jenjang->name }} - {{ $i->jenjang->kode }}
                                                                </option>

                                                                {{-- [UPDATE] Ubah $i menjadi $j agar tidak bentrok dengan $i
                                                                milik Prodi --}}
                                                                @foreach ($jenjang as $j)
                                                                    <option value="{{ $j->id }}">
                                                                        {{ $j->name }} - {{ $j->kode }}
                                                                    </option>
                                                                @endforeach

                                                            </select>
                                                        </div>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Save</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    {{-- HAPUS DATA --}}
                                    <div class="modal fade" id="modelHapus{{ $i->id }}" tabindex="-1"
                                        role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <form action="/program-studi/hapus/{{ $i->id }}" method="post">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Hapus Program Studi</h5>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        @csrf
                                                        @method('delete')
                                                        Apa kamu yakin akan menghapus data <b>{{ $i->name }}</b>
                                                        penghapusan data bersifat permanet,
                                                        dan mungkin akan mengakibatkan kerusakan pada sistem yang
                                                        menggunakan data berelasi.
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-danger">Tetap Hapus
                                                            !!!</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-2">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Aksi</h4>
                    <button type="button" class="btn btn-primary btn-sm float-right" data-toggle="modal"
                        data-target="#modelTambah">
                        <i class="fas fa-plus"></i> Tambah Prodi
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-md-10">
            <div class="card shadow mb-4 border-left-success">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-success">Master Jenjang Pendidikan</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="dataTableJenjang" width="100%" cellspacing="0">
                            <thead class="thead-light">
                                <tr>
                                    <th>Nama Jenjang</th>
                                    <th>Kode</th>
                                    <th width="150px">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                {{-- Gunakan variabel $j --}}
                                @foreach ($jenjang as $j)
                                    <tr>
                                        <td class="align-middle">{{ $j->name }}</td>
                                        <td class="align-middle">{{ $j->kode }}</td>
                                        <td width="150px" class="text-center">
                                            <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#modelEditJenjang{{ $j->id }}">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modelHapusJenjang{{ $j->id }}">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>

                                    {{-- MODAL EDIT JENJANG --}}
                                    <div class="modal fade" id="modelEditJenjang{{ $j->id }}" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <form action="/jenjang-pendidikan/put/{{ $j->id }}" method="POST">
                                                @csrf @method('PUT')
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Edit Jenjang Pendidikan</h5>
                                                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label>Nama Jenjang</label>
                                                            <input type="text" name="name" class="form-control" value="{{ $j->name }}" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Kode</label>
                                                            <input type="text" name="kode" class="form-control" value="{{ $j->kode }}" required>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                                                        <button type="submit" class="btn btn-success">Simpan Perubahan</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    {{-- MODAL HAPUS JENJANG --}}
                                    <div class="modal fade" id="modelHapusJenjang{{ $j->id }}" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <form action="/jenjang-pendidikan/hapus/{{ $j->id }}" method="POST">
                                                @csrf @method('DELETE')
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title font-weight-bold text-danger">Hapus Jenjang</h5>
                                                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Apa Anda yakin ingin menghapus jenjang <b>{{ $j->name }}</b>?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                                                        <button type="submit" class="btn btn-danger">Ya, Hapus!</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card shadow mb-4">
                <div class="card-body text-center">
                    <h6 class="font-weight-bold mb-3">Aksi Jenjang</h6>
                    <button type="button" class="btn btn-success btn-sm w-100" data-toggle="modal" data-target="#modelTambahJenjang">
                        <i class="fas fa-plus"></i> Tambah Jenjang
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="modelTambah" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form action="/program-studi/post" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Tambah Program Studi</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        @csrf
                        <div class="form-group">
                            <label for="">Nama Program Studi</label>
                            <input type="text" name="name" class="form-control" placeholder="Teknik Informatika"
                                aria-describedby="helpId" required>
                        </div>

                        <div class="form-group">
                            <label for="">Kode</label>
                            <input type="text" name="kode" class="form-control" placeholder="T1" aria-describedby="helpId"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="">Jenjang</label>
                            <select class="form-control" name="jenjang_id">
                                @foreach ($jenjang as $i)
                                    <option value="{{ $i->id }}">{{ $i->name }} - {{ $i->kode }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="modal fade" id="modelTambahJenjang" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form action="/jenjang-pendidikan/post" method="POST">
                @csrf
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Tambah Jenjang Pendidikan</h5>
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Nama Jenjang</label>
                            <input type="text" name="name" class="form-control" placeholder="Cth: Sarjana" required>
                        </div>
                        <div class="form-group">
                            <label>Kode</label>
                            <input type="text" name="kode" class="form-control" placeholder="Cth: S1" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-success">Simpan</button>
                    </div>
                </div>
            </form>
        </div>
    </div>


@endsection
