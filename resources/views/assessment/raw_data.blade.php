@extends('template.BaseView')

@section('content')
    <div class="container-fluid">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Data Statistik (DKPS)</h1>
        </div>

        {{-- 1. FILTER PILIH PRODI & TAHUN --}}
        <div class="card shadow mb-4 border-left-primary">
            <div class="card-body py-2">
                <form method="GET" action="{{ url()->current() }}" class="form-inline">

                    <label class="mr-2 font-weight-bold text-gray-700">Pilih Prodi:</label>
                    <select name="prodi_id" class="form-control mr-4 mb-2 mb-sm-0" onchange="this.form.submit()">
                        @foreach($allProdis as $p)
                            <option value="{{ $p->id }}" {{ $p->id == $prodi->id ? 'selected' : '' }}>
                                {{ $p->name }}
                            </option>
                        @endforeach
                    </select>

                    <label class="mr-2 font-weight-bold text-gray-700">Tahun (TS):</label>
                    <select name="year" class="form-control mr-4 mb-2 mb-sm-0" onchange="this.form.submit()">
                        @for($i = date('Y'); $i >= date('Y') - 4; $i--)
                            <option value="{{ $i }}" {{ request('year', date('Y')) == $i ? 'selected' : '' }}>
                                {{ $i }}
                            </option>
                        @endfor
                    </select>

                    <noscript>
                        <button type="submit" class="btn btn-primary btn-sm">Tampilkan</button>
                    </noscript>
                </form>
            </div>
        </div>

        {{-- 2. FORM INPUT DATA --}}
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    Input Data: {{ $prodi->name }} (TS: {{ request('year', date('Y')) }})
                </h6>
            </div>
            <div class="card-body">

                <form action="{{ route('raw_data.store') }}" method="POST">
                    @csrf
                    {{-- ID Prodi & Tahun otomatis ikut yang sedang dipilih --}}
                    <input type="hidden" name="prodi_id" value="{{ $prodi->id }}">
                    <input type="hidden" name="year" value="{{ request('year', date('Y')) }}">

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead class="thead-light">
                                <tr>
                                    <th style="width: 20%">Kode Variabel</th>
                                    <th>Nama Data / Keterangan</th>
                                    <th style="width: 25%">Nilai (Angka)</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($variables as $var)
                                    <tr>
                                        <td>
                                            <span class="badge badge-secondary"
                                                style="font-size: 0.9rem">{{ $var->code }}</span>
                                        </td>
                                        <td>
                                            <strong>{{ $var->name }}</strong>
                                            @if($var->description)
                                                <br><small class="text-muted">{{ $var->description }}</small>
                                            @endif
                                        </td>
                                        <td>
                                            @if($var->type == 'formula')
                                                {{-- Tampilan untuk Variabel Rumus (Read Only) --}}
                                                <div class="input-group">
                                                    <input type="text" class="form-control bg-light" value="Otomatis" disabled
                                                        title="Nilai variabel ini akan dihitung otomatis oleh sistem">
                                                    <div class="input-group-append">
                                                        <span class="input-group-text"><i class="fas fa-calculator"></i></span>
                                                    </div>
                                                </div>
                                                <small class="text-success font-italic">{{ $var->calculation_formula }}</small>
                                            @else
                                                {{-- Tampilan untuk Input Manual --}}
                                                <input type="number" step="0.01" name="values[{{ $var->id }}]"
                                                    class="form-control font-weight-bold text-primary" placeholder="0"
                                                    value="{{ $existingValues[$var->id] ?? 0 }}">
                                            @endif
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="3" class="text-center text-danger py-4">
                                            <i class="fas fa-exclamation-triangle"></i>
                                            Belum ada variabel data yang didefinisikan untuk Prodi/LAM ini.
                                            <br>Silakan minta Admin menambahkannya di menu "Master Variabel (DKPS)".
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>

                    <div class="text-right mt-3">
                        <button type="submit" class="btn btn-primary btn-icon-split btn-lg">
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