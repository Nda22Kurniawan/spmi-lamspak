@extends('template.HomeView', ['title' => 'Berkas ' . ($prodi->name ?? 'Prodi')])

@section('content')
<main id="main">
    <section class="breadcrumbs" style="padding: 20px 0; background: #f3f5fa;">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <h2>Laporan Mutu: <strong>{{ $prodi->name ?? '-' }}</strong></h2>
                <ol>
                    <li><a href="{{ route('home') }}">Home</a></li>
                    <li>Berkas Prodi</li>
                </ol>
            </div>
        </div>
    </section>

    <section class="inner-page">
        <div class="container">

            {{-- Info Card & Total Skor Keseluruhan --}}
            <div class="card shadow-sm mb-4 border-bottom border-primary" style="border-bottom-width: 4px !important;">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col-md-4 mb-2 mb-md-0">
                            <span class="text-muted small d-block">Instrumen Akreditasi:</span>
                            <strong class="text-dark">{{ $model->name ?? 'Belum ada instrumen' }}</strong>
                        </div>
                        <div class="col-md-4 text-center mb-2 mb-md-0">
                            <div class="bg-primary text-white p-2 rounded shadow-sm d-inline-block w-100">
                                Total Skor Keseluruhan: <br>
                                <strong style="font-size: 1.5rem;">{{ number_format($totalScore ?? 0, 2) }}</strong>
                            </div>
                        </div>
                        <div class="col-md-4 text-md-end text-right">
                            <span class="text-muted small d-block">Tahun Data (TS):</span>
                            <strong class="text-dark">{{ $year ?? date('Y') }}</strong>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Fitur Pencarian --}}
            <div class="card shadow-sm mb-4">
                <div class="card-body py-2">
                    <div class="input-group">
                        <span class="input-group-text bg-white border-end-0 text-primary"><i class="bi bi-search"></i></span>
                        <input type="text" id="searchInput" class="form-control border-start-0" placeholder="Cari Kode atau Nama Indikator di sini...">
                    </div>
                </div>
            </div>

            {{-- Content Klaster dan Indikator --}}
            <div class="row">
                <div class="col-lg-12">

                    @if(isset($model) && $model->clusters)
                    @foreach($model->clusters as $cluster)
                    <div class="card shadow-sm mb-4 cluster-card" style="border: none;">
                        <a href="#collapseCluster{{ $cluster->id }}" class="d-block card-header py-3 bg-light text-decoration-none" data-bs-toggle="collapse" data-toggle="collapse" role="button" aria-expanded="true">
                            <h6 class="m-0 font-weight-bold text-primary" style="color: var(--primary-color);">
                                {{ $cluster->code }} - {{ $cluster->name }}
                            </h6>
                        </a>

                        <div class="collapse show" id="collapseCluster{{ $cluster->id }}">
                            <div class="card-body p-3" style="background-color: #f8f9fc;">

                                @foreach($cluster->indicators as $indicator)
                                @php
                                $savedScore = $scores[$indicator->id] ?? null;
                                $bgCard = ($savedScore && !empty($savedScore->proof_link)) ? 'border-success' : 'border-warning';
                                $weight = $indicator->weight ?? 0;
                                $weightedScore = $savedScore ? ($savedScore->final_score * $weight) : 0;
                                @endphp

                                <div class="card mb-3 shadow-sm indicator-item border-start border-4 {{ $bgCard }}">
                                    <div class="card-body">
                                        <div class="row align-items-center">

                                            {{-- Kolom Kiri: Deskripsi & Tombol GDrive --}}
                                            <div class="col">
                                                <div class="text-xs font-weight-bold text-uppercase mb-2 d-flex align-items-center flex-wrap">
                                                    <span class="me-2 text-dark"><strong>{{ $indicator->code }}</strong></span>
                                                    <span class="badge bg-secondary me-2 mx-1">{{ $indicator->type }}</span>

                                                    @if($indicator->classification)
                                                    @php
                                                    $badgeColor = str_contains(strtoupper($indicator->classification), 'UNGGUL') ? 'bg-danger' : 'bg-info text-dark';
                                                    @endphp
                                                    <span class="badge {{ $badgeColor }} shadow-sm">
                                                        {{ $indicator->classification }}
                                                    </span>
                                                    @endif
                                                </div>

                                                <div class="h6 mb-3 text-dark" style="line-height: 1.5;">
                                                    {{ $indicator->description }}
                                                </div>

                                                {{-- Area Read-Only Nilai Capaian --}}
                                                <div class="p-2 mb-2 rounded" style="background-color: #f1f3f5; font-size: 0.9rem;">
                                                    @if($indicator->type == 'QUALITATIVE')
                                                    @php
                                                    $selectedRubric = null;
                                                    if($savedScore) {
                                                    $rubricId = $savedScore->selected_rubric_id ?? $savedScore->rubric_id;
                                                    $selectedRubric = $indicator->rubrics->firstWhere('id', $rubricId);
                                                    }
                                                    @endphp

                                                    @if($selectedRubric)
                                                    <strong>Capaian:</strong> [Skor {{ $selectedRubric->score_value }}] {{ $selectedRubric->description }}
                                                    @else
                                                    <span class="text-muted"><em>Belum ada capaian yang dipilih.</em></span>
                                                    @endif
                                                    @else
                                                    <strong>Rumus / Perhitungan:</strong> <code>{{ $indicator->custom_formula ?? $indicator->calculation_code ?? 'Manual' }}</code>
                                                    @endif
                                                </div>

                                                {{-- Catatan (Read Only) --}}
                                                @if($savedScore && $savedScore->notes)
                                                <div class="mb-3 text-muted small">
                                                    <strong>Keterangan:</strong> {{ $savedScore->notes }}
                                                </div>
                                                @endif

                                                {{-- Tombol Google Drive (Hanya Tampil Jika Ada Link) --}}
                                                <div class="mt-2">
                                                    @if($savedScore && !empty($savedScore->proof_link))
                                                    <a href="{{ $savedScore->proof_link }}" target="_blank" class="btn btn-sm btn-primary shadow-sm" style="background-color: #1a73e8; border-color: #1a73e8;">
                                                        <i class="bi bi-google"></i> Buka File Google Drive
                                                    </a>
                                                    @else
                                                    <span class="badge bg-light text-muted border"><i class="bi bi-dash-circle"></i> File Belum Tersedia</span>
                                                    @endif
                                                </div>
                                            </div>

                                            {{-- Kolom Kanan: Info Bobot & Skor --}}
                                            <div class="col-auto text-center border-start ps-3 ms-2" style="min-width: 120px;">
                                                <div class="mb-2">
                                                    <div class="text-muted small fw-bold">Nilai</div>
                                                    <div class="fs-5 fw-bold {{ $savedScore ? 'text-primary' : 'text-secondary' }}">
                                                        {{ $savedScore ? number_format($savedScore->final_score, 2) : '-' }}
                                                    </div>
                                                </div>
                                                <div class="mb-2">
                                                    <div class="text-muted small fw-bold">Bobot</div>
                                                    <div class="fw-bold text-dark">{{ number_format($weight, 2) }}</div>
                                                </div>
                                                <div class="border-top pt-2 mt-2">
                                                    <div class="text-muted small fw-bold">Skor Akhir</div>
                                                    <div class="fs-5 fw-bold text-success">
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
                    @else
                    <div class="alert alert-info text-center">Data Asesmen Mutu belum tersedia untuk Program Studi ini.</div>
                    @endif

                </div>
            </div>

        </div>
    </section>
</main>
@endsection

@section('script')
{{-- Memastikan jQuery tersedia jika belum di-load oleh HomeView --}}
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $('#searchInput').on('keyup', function() {
            var value = $(this).val().toLowerCase();

            $('.indicator-item').filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
            });

            $('.cluster-card').each(function() {
                var visibleIndicators = $(this).find('.indicator-item:visible').length;
                if (visibleIndicators > 0) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });
    });
</script>
@endsection