@extends('template.BaseView')

@section('content')
<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Grafik Capaian Mutu Prodi</h1>

    @if(session('error'))
        <div class="alert alert-danger">{{ session('error') }}</div>
    @endif

    <div class="row">
        @foreach($prodis as $prodi)
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
                                Instrumen: {{ $prodi->accreditationModel->name ?? '-' }}
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-chart-pie fa-2x text-gray-300"></i>
                        </div>
                    </div>
                    <hr>
                    @if($prodi->accreditationModel)
                        <a href="{{ route('diagram.show', $prodi->id) }}" class="btn btn-sm btn-info btn-block">
                            <i class="fas fa-eye"></i> Lihat Spider Chart
                        </a>
                    @else
                        <button disabled class="btn btn-sm btn-secondary btn-block">Belum Diset</button>
                    @endif
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>
@endsection