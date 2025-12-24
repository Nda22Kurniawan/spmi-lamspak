@extends('template.BaseView')

@section('content')
<div class="container-fluid">

    {{-- Header Halaman --}}
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Asesmen Mutu: {{ $prodi->name }}</h1>
        <a href="{{ route('assessment.pilih_prodi') }}" class="btn btn-sm btn-secondary shadow-sm">
            <i class="fas fa-arrow-left fa-sm text-white-50"></i> Kembali
        </a>
    </div>

    {{-- Info Card & Total Skor Keseluruhan --}}
    <div class="card shadow mb-4 border-bottom-primary">
        <div class="card-body">
            <div class="row align-items-center">
                <div class="col-md-4">
                    Instrumen Akreditasi: <strong>{{ $model->name }}</strong>
                </div>
                <div class="col-md-4 text-center">
                    {{-- [BARU] Total Skor Keseluruhan --}}
                    <div class="bg-primary text-white p-2 rounded shadow-sm">
                        Total Skor Keseluruhan: <strong id="total-overall-score" style="font-size: 1.2rem;">{{ number_format($totalScore ?? 0, 2) }}</strong>
                    </div>
                </div>
                <div class="col-md-4 text-md-right mt-2 mt-md-0">
                    Tahun Data (TS): <strong>{{ $year }}</strong>
                </div>
            </div>
        </div>
    </div>

    {{-- Content --}}
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
                    <div class="card-body p-2">

                        @foreach($cluster->indicators as $indicator)
                            @php
                                $savedScore = $scores[$indicator->id] ?? null;
                                $bgCard = $savedScore ? 'border-left-success' : 'border-left-warning';
                                $weight = $indicator->weight ?? 0;
                                $weightedScore = $savedScore ? ($savedScore->final_score * $weight) : 0;
                            @endphp

                            <div class="card mb-3 {{ $bgCard }} shadow-sm py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        
                                        {{-- Kolom Kiri: Form --}}
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-uppercase mb-1 d-flex align-items-center">
    {{-- Kode Indikator --}}
    <span class="mr-2">{{ $indicator->code }}</span>

    {{-- Badge Tipe (Kualitatif/Kuantitatif) --}}
    <span class="badge badge-secondary mr-1">{{ $indicator->type }}</span>

    {{-- [BARU] Badge Klasifikasi --}}
    @if($indicator->classification)
        @php
            // Logika Warna Badge: Merah untuk Unggul, Biru untuk Umum/Lainnya
            $badgeColor = 'badge-info'; 
            $icon = 'fa-tag';
            
            if(str_contains(strtoupper($indicator->classification), 'UNGGUL')) {
                $badgeColor = 'badge-danger';
                $icon = 'fa-exclamation-circle';
            }
        @endphp
        
        <span class="badge {{ $badgeColor }} shadow-sm">
            <i class="fas {{ $icon }} fa-xs"></i> {{ $indicator->classification }}
        </span>
    @endif
</div>

<div class="h5 mb-3 font-weight-bold text-gray-800">
    {{ $indicator->description }}
</div>

                                            <form class="assessment-form" data-indicator="{{ $indicator->id }}" data-weight="{{ $weight }}">
                                                @csrf
                                                <input type="hidden" name="prodi_id" value="{{ $prodiId }}">
                                                <input type="hidden" name="indicator_id" value="{{ $indicator->id }}">

                                                @if($indicator->type == 'QUALITATIVE')
                                                    <div class="form-group">
                                                        <select name="rubric_id" class="form-control form-control-sm">
                                                            <option value="">-- Pilih Capaian --</option>
                                                            @foreach($indicator->rubrics as $rubric)
                                                                <option value="{{ $rubric->id }}" 
                                                                    {{ $savedScore && $savedScore->selected_rubric_id == $rubric->id ? 'selected' : '' }}>
                                                                    [Skor {{ $rubric->score_value }}] {{ Str::limit($rubric->description, 120) }}
                                                                </option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                @else
                                                    <div class="alert alert-secondary text-xs mb-2 p-1">
                                                        Rumus: <code>{{ $indicator->custom_formula ?? $indicator->calculation_code ?? 'Manual' }}</code>
                                                    </div>
                                                @endif

                                                {{-- Link Google Drive --}}
                                                <div class="form-row align-items-center mb-2">
                                                    <div class="col">
                                                        <div class="input-group input-group-sm">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><i class="fab fa-google-drive"></i></span>
                                                            </div>
                                                            <input type="text" name="proof_link" class="form-control" placeholder="Link Google Drive" value="{{ $savedScore->proof_link ?? '' }}">
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <a href="{{ $savedScore->proof_link ?? '#' }}" target="_blank" 
                                                           class="btn btn-info btn-sm btn-view-proof {{ empty($savedScore->proof_link) ? 'd-none' : '' }}">
                                                            <i class="fas fa-external-link-alt"></i>
                                                        </a>
                                                    </div>
                                                </div>

                                                {{-- [BARU] Input Komentar / Keterangan --}}
                                                <div class="form-group mb-2">
    <textarea name="notes" class="form-control form-control-sm" rows="2" 
              placeholder="Komentar / Keterangan tambahan untuk indikator ini...">{{ $savedScore->notes ?? '' }}</textarea>
</div>

                                                <button type="button" class="btn btn-primary btn-sm btn-save">
                                                    <i class="fas fa-save"></i> Simpan
                                                </button>
                                            </form>
                                        </div>

                                        {{-- [BARU] Kolom Kanan: Detail Skor --}}
                                        <div class="col-auto text-center border-left pl-3 ml-2" style="min-width: 120px;">
                                            <div class="mb-2">
                                                <div class="text-xs text-muted font-weight-bold">Nilai</div>
                                                <div class="h5 mb-0 font-weight-bold {{ $savedScore ? 'text-primary' : 'text-gray-400' }}" id="score-display-{{ $indicator->id }}">
                                                    {{ $savedScore ? number_format($savedScore->final_score, 2) : '-' }}
                                                </div>
                                            </div>
                                            <div class="mb-2">
                                                <div class="text-xs text-muted font-weight-bold">Bobot</div>
                                                <div class="h6 mb-0 text-dark">{{ number_format($weight, 2) }}</div>
                                            </div>
                                            <div class="border-top pt-1">
                                                <div class="text-xs text-muted font-weight-bold">Skor Akhir</div>
                                                <div class="h5 mb-0 font-weight-bold text-success" id="weighted-score-{{ $indicator->id }}">
                                                    {{ $savedScore ? number_format($weightedScore, 2) : '-' }}
                                                </div>
                                            </div>
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
        var btn = $(this);
        var form = btn.closest('form');
        var indicatorId = form.data('indicator');
        var weight = parseFloat(form.data('weight'));
        
        var proofInput = form.find('input[name="proof_link"]').val();
        var viewBtn = form.find('.btn-view-proof');

        btn.html('<i class="fas fa-spinner fa-spin"></i>').prop('disabled', true);

        $.ajax({
            url: "{{ route('assessment.score') }}",
            type: "POST",
            data: form.serialize(),
            success: function(response) {
                // 1. Update Nilai (Score)
                var rawScore = parseFloat(response.score);
                $('#score-display-' + indicatorId).text(rawScore.toFixed(2)).removeClass('text-gray-400').addClass('text-primary');
                
                // 2. Update Skor Akhir (Nilai x Bobot)
                var finalWeighted = rawScore * weight;
                $('#weighted-score-' + indicatorId).text(finalWeighted.toFixed(2));

                // 3. Update Total Skor Keseluruhan (Jika backend mengirim total_score)
                if(response.total_overall_score) {
                    $('#total-overall-score').text(response.total_overall_score);
                }

                // 4. Update Link View
                if (proofInput && proofInput.trim() !== "") {
                    viewBtn.attr('href', proofInput).removeClass('d-none');
                } else {
                    viewBtn.addClass('d-none');
                }

                // Visual Feedback
                btn.html('<i class="fas fa-check"></i>').removeClass('btn-primary').addClass('btn-success');
                form.closest('.card').removeClass('border-left-warning').addClass('border-left-success');
                
                setTimeout(() => {
                    btn.html('<i class="fas fa-save"></i> Simpan').removeClass('btn-success').addClass('btn-primary').prop('disabled', false);
                }, 2000);
            },
            error: function(xhr) {
                alert('Gagal menyimpan: ' + (xhr.responseJSON ? xhr.responseJSON.message : 'Error'));
                btn.html('<i class="fas fa-save"></i> Simpan').prop('disabled', false);
            }
        });
    });
});
</script>
@endsection