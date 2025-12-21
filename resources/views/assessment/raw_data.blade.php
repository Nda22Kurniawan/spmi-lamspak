@extends('template.BaseView') {{-- Sesuaikan dengan nama layout utama Anda --}}

@section('content')
<div class="container-fluid">

    <h1 class="h3 mb-4 text-gray-800">Data Statistik (DKPS)</h1>

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
            <h6 class="m-0 font-weight-bold text-primary">Input Data Kuantitatif Program Studi</h6>
        </div>
        <div class="card-body">
            
            <div class="alert alert-warning text-sm">
                <strong>Penting:</strong> Data ini digunakan sebagai dasar perhitungan otomatis (Rumus) pada instrumen LAM-INFOKOM. 
                Pastikan data diisi dengan benar sesuai TS (Tahun Sekarang).
            </div>

            <form action="{{ route('raw_data.store') }}" method="POST">
                @csrf
                
                <div class="form-row mb-4">
                    <div class="col-md-3">
                        <label for="year">Tahun Data (TS)</label>
                        <select name="year" class="form-control" required>
                            @for($i = date('Y'); $i >= date('Y')-5; $i--)
                                <option value="{{ $i }}" {{ request('year', date('Y')) == $i ? 'selected' : '' }}>{{ $i }}</option>
                            @endfor
                        </select>
                    </div>
                    
                    <input type="hidden" name="prodi_id" value="{{ $prodiId }}">
                </div>

                <div class="table-responsive">
                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                        <thead class="thead-light">
                            <tr>
                                <th style="width: 5%">No</th>
                                <th style="width: 15%">Kode Variabel</th>
                                <th style="width: 50%">Nama Data / Deskripsi</th>
                                <th style="width: 30%">Nilai (Angka)</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($variables as $index => $var)
                            <tr>
                                <td class="text-center">{{ $index + 1 }}</td>
                                <td>
                                    <span class="badge badge-secondary">{{ $var->code }}</span>
                                </td>
                                <td>
                                    <strong>{{ $var->name }}</strong>
                                    <br>
                                    <small class="text-muted">{{ $var->description }}</small>
                                </td>
                                <td>
                                    <input type="number" step="0.01" 
                                           name="data[{{ $var->code }}]" 
                                           class="form-control" 
                                           value="{{ $existingValues[$var->id] ?? 0 }}"
                                           placeholder="0">
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td colspan="4" class="text-center text-muted py-4">
                                    Belum ada definisi Variabel Data Mentah di database. 
                                    <br>Silakan jalankan Seeder terlebih dahulu.
                                </td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>

                <div class="form-group mt-4 text-right">
                    <button type="submit" class="btn btn-primary btn-icon-split">
                        <span class="icon text-white-50">
                            <i class="fas fa-save"></i>
                        </span>
                        <span class="text">Simpan Data Statistik</span>
                    </button>
                </div>

            </form>
        </div>
    </div>

</div>
@endsection