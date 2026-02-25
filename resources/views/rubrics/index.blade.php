@extends('template.BaseView')

@section('content')
    <div class="container-fluid">

        {{-- Judul Halaman --}}
        <h1 class="h3 mb-4 text-gray-800">Master Data: Rubrik Penilaian</h1>

        @if(session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session('success') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        @endif
        @if(session('error'))
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                {{ session('error') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        @endif

        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Daftar Rubrik per Indikator</h6>

                {{-- Tombol Tambah --}}
                <button type="button" class="btn btn-sm btn-primary shadow-sm" data-toggle="modal" data-target="#addModal">
                    <i class="fas fa-plus fa-sm text-white-50"></i> Tambah Rubrik Baru
                </button>
            </div>

            <div class="card-body">

                {{-- FILTER SECTION (Menggunakan AccreditationModel) --}}
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label font-weight-bold">Pilih Instrumen (LAM):</label>
                    <div class="col-sm-6">
                        <select id="filterLam" class="form-control" onchange="window.location.href='?lam_id='+this.value">
                            @foreach($lams as $lam)
                                <option value="{{ $lam->id }}" {{ $selectedLamId == $lam->id ? 'selected' : '' }}>
                                    {{ $lam->name }} {{-- Misal: LAM INFOKOM --}}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <hr>

                {{-- TABLE SECTION --}}
                <div class="table-responsive">
                    <table class="table table-bordered" width="100%" cellspacing="0">
                        <thead class="thead-dark">
                            <tr>
                                <th style="width: 10%" class="text-center">Skor</th>
                                <th>Deskripsi Penilaian</th>
                                <th style="width: 15%" class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($indicators as $indicator)

                                {{-- 1. HITUNG NILAI MAKSIMAL UNTUK INDIKATOR INI --}}
                                @php
                                    $maxScore = $indicator->rubrics->max('score_value') ?? 4;
                                @endphp

                                {{-- SEKAT: HEADER INDIKATOR --}}
                                <tr class="bg-light">
                                    <td colspan="3" class="font-weight-bold text-primary">
                                        <i class="fas fa-tag mr-2"></i>
                                        {{ $indicator->code }} - {{ $indicator->description }}
                                        <small class="text-muted ml-2">({{ $indicator->cluster->name ?? 'Klaster Umum' }})</small>
                                    </td>
                                </tr>

                                {{-- LOOP RUBRIK --}}
                                @foreach($indicator->rubrics as $rubric)
                                    <tr>
                                        <td class="text-center align-middle">

                                            {{-- 2. LOGIKA WARNA DINAMIS --}}
                                            @php
                                                $badgeClass = 'badge-danger'; // Default Merah

                                                if ($maxScore > 0) {
                                                    $percentage = $rubric->score_value / $maxScore;

                                                    if ($percentage >= 0.75) {
                                                        $badgeClass = 'badge-success'; // Hijau (75% - 100%)
                                                    } elseif ($percentage >= 0.5) {
                                                        $badgeClass = 'badge-warning'; // Kuning (50% - 74%)
                                                    }
                                                }
                                            @endphp

                                            <span class="badge {{ $badgeClass }} px-3 py-2" style="font-size:14px">
                                                {{ $rubric->score_value }}
                                            </span>

                                        </td>

                                        <td class="align-middle">
                                            {!! nl2br(e($rubric->description)) !!}
                                        </td>

                                        <td class="text-center align-middle">
                                            <button class="btn btn-sm btn-warning" data-toggle="modal"
                                                data-target="#editModal{{ $rubric->id }}">
                                                <i class="fas fa-edit"></i>
                                            </button>

                                            <button type="button" class="btn btn-sm btn-danger btn-delete-rubric" 
                                                    data-id="{{ $rubric->id }}" 
                                                    data-score="{{ $rubric->score_value }}"
                                                    data-toggle="modal" 
                                                    data-target="#deleteModal" 
                                                    title="Hapus">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>

                                    @include('rubrics.partials.modal_edit', ['rubric' => $rubric])
                                @endforeach

                                @if($indicator->rubrics->isEmpty())
                                    <tr>
                                        <td colspan="3" class="text-center text-muted font-italic py-2">
                                            Belum ada rubrik. <a href="#" data-toggle="modal" data-target="#addModal"
                                                onclick="$('#selectIndicator').val({{ $indicator->id }})">Tambah sekarang</a>.
                                        </td>
                                    </tr>
                                @endif

                            @empty
                                <tr>
                                    <td colspan="3" class="text-center text-muted py-4">Data tidak ditemukan.</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>

                {{-- Pagination --}}
                <div class="mt-3">
                    {{ $indicators->links() }}
                </div>

            </div>
        </div>
    </div>

    {{-- MODAL CREATE --}}
    @include('rubrics.partials.modal_create', ['all_indicators' => $indicators])

    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <form id="deleteForm" action="" method="POST">
            @csrf
            @method('DELETE')
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header border-bottom-0 pb-0">
                        <h5 class="modal-title font-weight-bold text-danger" id="deleteModalLabel">Yakin ingin menghapus?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body py-4">
                        Rubrik dengan nilai Skor <strong id="deleteRubricScore" class="text-dark"></strong> akan dihapus permanen.<br>
                        <small class="text-muted">Tindakan ini tidak dapat dibatalkan.</small>
                    </div>
                    <div class="modal-footer bg-light border-top-0">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <button class="btn btn-danger" type="submit">Hapus</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

@endsection

@section('script')
<script>
    $(document).ready(function() {
        $('.btn-delete-rubric').on('click', function() {
            var id = $(this).data('id');
            var score = $(this).data('score');
            
            var url = "{{ url('/rubrics') }}/" + id;
            
            $('#deleteForm').attr('action', url);
            $('#deleteRubricScore').text(score);
        });
    });
</script>
@endsection