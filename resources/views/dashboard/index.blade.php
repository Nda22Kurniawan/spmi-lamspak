@extends('template.BaseView')

@section('content')
<div class="container-fluid">
    @if (Auth::user()->prodi_kode == '-')
    <div class="row">
        @foreach ($p as $prodi)
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                Program Studi
                            </div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $prodi->name }}</div>
                            <div class="mt-2 text-xs text-muted">
                                Instrumen:
                                @if($prodi->accreditationModel)
                                <strong>{{ $prodi->accreditationModel->name }}</strong>
                                @else
                                <span class="text-danger">Belum Diset</span>
                                @endif
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                    <hr>

                    <a href="{{ route('diagram.show', $prodi->id) }}" class="btn btn-sm btn-info btn-block">
                        <i class="fas fa-eye"></i> Lihat Detail Prodi
                    </a>
                </div>
            </div>
        </div>
        @endforeach
    </div>
    @endif

    <div class="row mt-2">
        <div class="col">
            <div class="card shadow">
                <div class="card-body">
                    <h4 class="card-title text-primary font-weight-bold">FTIK USM</h4>
                    <p class="card-text">Selamat datang <b>{{ Auth::user()->name }}</b>,<br>
                        @if (Auth::user()->prodi_kode == '-')
                        Kamu dapat melakukan pemberkasan dengan lebih mudah dan untuk saat ini terdapat
                        <b>{{ $p->count() }}</b> Program Studi yang terdaftar pada sistem.
                        @else
                        Saat ini kamu bertugas sebagai <b>{{ Auth::user()->role }}</b> pada Program Studi
                        <b>{{ Auth::user()->prodi_name }}</b>. Kamu dapat melakukan peningkatan dan pemberkasan melalui menu
                        Element dan Berkas.
                        @endif
                    </p>
                    <hr>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection