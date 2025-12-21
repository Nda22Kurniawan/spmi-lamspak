@extends('template.BaseView') {{-- Sesuaikan dengan layout utama Anda --}}

@section('content')
<div class="container-fluid">

    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Asesmen Mutu: {{ $prodi->name }}</h1>
        <a href="{{ route('assessment.pilih_prodi') }}" class="d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm">
            <i class="fas fa-arrow-left fa-sm text-white-50"></i> Kembali
        </a>
    </div>

    <div class="card shadow mb-4 border-bottom-primary">
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    Instrumen Akreditasi: <strong>{{ $model->name }}</strong>
                </div>
                <div class="col-md-6 text-right">
                    Tahun Data (TS): <strong>{{ date('Y') }}</strong>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">

            @foreach($model->clusters as $cluster)
            <div class="card shadow mb-4">
                <a href="#collapseCluster{{ $cluster->id }}" class="d-block card-header py-3" data-toggle="collapse"
                    role="button" aria-expanded="true" aria-controls="collapseCluster{{ $cluster->id }}">
                    <h6 class="m-0 font-weight-bold text-primary">
                        {{ $cluster->code }} - {{ $cluster->name }}
                    </h6>
                </a>
                
                <div class="collapse show" id="collapseCluster{{ $cluster->id }}">
                    <div class="card-body">
                        
                        @foreach($cluster->indicators as $indicator)
                        @php
                            $savedScore = $scores[$indicator->id] ?? null;
                            $bgCard = $savedScore ? 'border-left-success' : 'border-left-warning';
                        @endphp

                        <div class="card mb-3 {{ $bgCard }} shadow-sm h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-uppercase mb-1">
                                            {{ $indicator->code }} <span class="badge badge-secondary">{{ $indicator->type }}</span>
                                        </div>
                                        <div class="h5 mb-2 font-weight-bold text-gray-800">
                                            {{ $indicator->description }}
                                        </div>
                                        
                                        <form class="assessment-form" data-indicator="{{ $indicator->id }}">
                                            @csrf
                                            <input type="hidden" name="prodi_id" value="{{ $prodiId }}">
                                            <input type="hidden" name="indicator_id" value="{{ $indicator->id }}">

                                            @if($indicator->type == 'QUALITATIVE')
                                                <div class="form-group">
                                                    <label>Pilih Capaian:</label>
                                                    <select name="rubric_id" class="form-control">
                                                        <option value="">-- Pilih --</option>
                                                        @foreach($indicator->rubrics as $rubric)
                                                            <option value="{{ $rubric->id }}" 
                                                                {{ $savedScore && $savedScore->selected_rubric_id == $rubric->id ? 'selected' : '' }}>
                                                                [Skor {{ $rubric->score_value }}] {{ Str::limit($rubric->description, 100) }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                            @else
                                                <div class="alert alert-secondary text-xs">
                                                    Nilai dihitung otomatis dari Data Statistik (DKPS).
                                                    <br>Rumus: <code>{{ $indicator->calculation_code }}</code>
                                                </div>
                                            @endif
                                            
                                            <div class="form-row">
                                                <div class="col">
                                                    <input type="text" name="proof_link" class="form-control form-control-sm" 
                                                           placeholder="Link Bukti (Gdrive...)" value="{{ $savedScore->proof_link ?? '' }}">
                                                </div>
                                                <div class="col-auto">
                                                    <button type="button" class="btn btn-primary btn-sm btn-save">
                                                        <i class="fas fa-save"></i> Simpan / Hitung
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="col-auto">
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="score-display-{{ $indicator->id }}">
                                            {{ $savedScore ? $savedScore->final_score : '-' }}
                                        </div>
                                        <div class="text-xs text-center">Skor Akhir</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach

                    </div>
                </div>
            </div>
            @endforeach

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $('.btn-save').click(function() {
        var form = $(this).closest('form');
        var btn = $(this);
        var indicatorId = form.data('indicator');
        
        btn.html('<i class="fas fa-spinner fa-spin"></i> Loading...');

        $.ajax({
            url: "{{ route('assessment.score') }}",
            type: "POST",
            data: form.serialize(),
            success: function(response) {
                // Update tampilan skor
                $('#score-display-' + indicatorId).text(response.score);
                btn.html('<i class="fas fa-check"></i> Tersimpan').removeClass('btn-primary').addClass('btn-success');
                setTimeout(() => {
                    btn.html('<i class="fas fa-save"></i> Simpan / Hitung').removeClass('btn-success').addClass('btn-primary');
                }, 2000);
            },
            error: function(xhr) {
                alert('Gagal menyimpan: ' + xhr.responseJSON.message);
                btn.html('<i class="fas fa-save"></i> Simpan / Hitung');
            }
        });
    });
});
</script>
@endsection