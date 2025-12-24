@extends('template.BaseView')

@section('content')
    <div class="container-fluid">
        <h1 class="h3 mb-4 text-gray-800">Master Data: Variabel Statistik (DKPS)</h1>

        {{-- Pesan Sukses/Error --}}
        @if(session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session('success') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
        @endif
        @if($errors->any())
            <div class="alert alert-danger">
                <ul class="mb-0">@foreach($errors->all() as $err) <li>{{ $err }}</li> @endforeach</ul>
            </div>
        @endif

        <div class="row">
            {{-- KOLOM KIRI: FORM (Dinamis Create/Edit) --}}
            <div class="col-md-4">
                <div class="card shadow mb-4 {{ $editVariable ? 'border-left-warning' : 'border-left-primary' }}">
                    <div class="card-header py-3 d-flex justify-content-between align-items-center">
                        <h6 class="m-0 font-weight-bold {{ $editVariable ? 'text-warning' : 'text-primary' }}">
                            {{ $editVariable ? 'Edit Variabel' : 'Tambah Variabel Baru' }}
                        </h6>
                        @if($editVariable)
                            <a href="{{ route('variable.index', ['lam_id' => $selectedLamId]) }}" class="btn btn-sm btn-secondary">
                                <i class="fas fa-times"></i> Batal
                            </a>
                        @endif
                    </div>
                    <div class="card-body">
                        {{-- Logika Form Action: Jika ada editVariable, lari ke Update, jika tidak ke Store --}}
                        <form action="{{ $editVariable ? route('variable.update', $editVariable->id) : route('variable.store') }}" method="POST">
                            @csrf
                            @if($editVariable) @method('PUT') @endif

                            <div class="form-group">
                                <label>Instrumen LAM</label>
                                <select name="model_id" class="form-control">
                                    @foreach($lams as $lam)
                                        <option value="{{ $lam->id }}" 
                                            {{ ($editVariable ? $editVariable->model_id : $selectedLamId) == $lam->id ? 'selected' : '' }}>
                                            {{ $lam->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Kode Variabel (Unik)</label>
                                <input type="text" name="code" class="form-control" placeholder="Cth: JML_DOSEN_S3" required
                                    style="text-transform: uppercase"
                                    value="{{ old('code', $editVariable->code ?? '') }}">
                                <small class="text-muted">Kode ini yang akan dipanggil di Rumus Kuantitatif.</small>
                            </div>

                            <div class="form-group">
                                <label>Tipe Input Data</label>
                                <select name="type" class="form-control" id="varType" onchange="toggleFormula()">
                                    <option value="static" {{ old('type', $editVariable->type ?? '') == 'static' ? 'selected' : '' }}>
                                        Input Manual (Angka)
                                    </option>
                                    <option value="formula" {{ old('type', $editVariable->type ?? '') == 'formula' ? 'selected' : '' }}>
                                        Hitungan Otomatis (Rumus)
                                    </option>
                                </select>
                            </div>

                            {{-- Kotak Rumus (Default hidden, kecuali tipe=formula) --}}
                            <div class="form-group {{ old('type', $editVariable->type ?? '') == 'formula' ? '' : 'd-none' }}" id="formulaBox">
                                <label>Rumus Variabel</label>
                                <textarea name="calculation_formula" class="form-control font-monospace"
                                    placeholder="Contoh: (NPM / NPD) * 100">{{ old('calculation_formula', $editVariable->calculation_formula ?? '') }}</textarea>
                                <small class="text-muted">Gunakan Kode Variabel lain sebagai bahan hitungan.</small>
                            </div>

                            <div class="form-group">
                                <label>Nama Data</label>
                                <input type="text" name="name" class="form-control" placeholder="Cth: Jumlah Dosen S3"
                                    value="{{ old('name', $editVariable->name ?? '') }}" required>
                            </div>

                            <div class="form-group">
                                <label>Keterangan</label>
                                <textarea name="description" class="form-control" rows="2">{{ old('description', $editVariable->description ?? '') }}</textarea>
                            </div>

                            <button type="submit" class="btn btn-block {{ $editVariable ? 'btn-warning' : 'btn-primary' }}">
                                <i class="fas fa-save"></i> {{ $editVariable ? 'Simpan Perubahan' : 'Simpan Data' }}
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            {{-- KOLOM KANAN: TABEL --}}
            <div class="col-md-8">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex justify-content-between align-items-center">
                        <h6 class="m-0 font-weight-bold text-primary">Daftar Variabel</h6>

                        {{-- Filter Dropdown --}}
                        <select class="form-control w-50" onchange="window.location.href='?lam_id='+this.value">
                            @foreach($lams as $lam)
                                <option value="{{ $lam->id }}" {{ $selectedLamId == $lam->id ? 'selected' : '' }}>
                                    {{ $lam->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-sm table-hover">
                                <thead class="thead-light">
                                    <tr>
                                        <th>Kode</th>
                                        <th>Nama Data</th>
                                        <th>Tipe</th>
                                        <th style="width: 15%">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($variables as $var)
                                        <tr class="{{ $editVariable && $editVariable->id == $var->id ? 'table-warning' : '' }}">
                                            <td class="align-middle"><code>{{ $var->code }}</code></td>
                                            <td class="align-middle">
                                                <span class="font-weight-bold">{{ $var->name }}</span>
                                                <div class="text-xs text-muted">{{ $var->description }}</div>
                                            </td>
                                            <td class="align-middle">
                                                @if($var->type == 'formula')
                                                    <span class="badge badge-info">Rumus</span>
                                                    <div class="text-xs font-monospace mt-1">{{ $var->calculation_formula }}</div>
                                                @else
                                                    <span class="badge badge-secondary">Manual</span>
                                                @endif
                                            </td>
                                            <td class="text-center align-middle">
                                                {{-- Tombol Edit: Reload halaman dengan parameter edit_id --}}
                                                <a href="{{ route('variable.index', ['lam_id' => $selectedLamId, 'edit_id' => $var->id]) }}" 
                                                   class="btn btn-warning btn-sm" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </a>

                                                <form action="{{ route('variable.destroy', $var->id) }}" method="POST" class="d-inline">
                                                    @csrf @method('DELETE')
                                                    <button class="btn btn-danger btn-sm" onclick="return confirm('Hapus variabel ini? Data yang sudah diinput akan hilang.')" title="Hapus">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="4" class="text-center text-muted py-3">
                                                Belum ada variabel untuk LAM ini.
                                            </td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- Script JS --}}
    <script>
    function toggleFormula() {
        let type = document.getElementById('varType').value;
        let box = document.getElementById('formulaBox');
        
        if(type === 'formula') {
            box.classList.remove('d-none');
        } else {
            box.classList.add('d-none');
        }
    }
    
    // Jalankan sekali saat halaman loading (untuk kasus Edit)
    document.addEventListener("DOMContentLoaded", function() {
        toggleFormula();
    });
    </script>
@endsection