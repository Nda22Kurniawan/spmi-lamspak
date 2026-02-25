@extends('template.BaseView')

@section('content')
    <div class="container-fluid">
        <h1 class="h3 mb-4 text-gray-800">Master Data: Klaster / Elemen Penilaian</h1>

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
                <h6 class="m-0 font-weight-bold text-primary">Daftar Klaster</h6>

                <a href="{{ route('cluster.create', ['lam_id' => $selectedLamId]) }}"
                    class="btn btn-sm btn-primary shadow-sm">
                    <i class="fas fa-plus fa-sm text-white-50"></i> Tambah Klaster Baru
                </a>
            </div>
            <div class="card-body">

                <div class="form-group row">
                    <label class="col-sm-3 col-form-label font-weight-bold">Pilih Instrumen (LAM):</label>
                    <div class="col-sm-6">
                        <select id="filterLam" class="form-control" onchange="window.location.href='?lam_id='+this.value">
                            @foreach($lams as $lam)
                                <option value="{{ $lam->id }}" {{ $selectedLamId == $lam->id ? 'selected' : '' }}>
                                    {{ $lam->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <hr>

                <div class="table-responsive">
                    <table class="table table-bordered table-striped" width="100%" cellspacing="0">
                        <thead class="thead-dark">
                            <tr>
                                <th style="width: 5%">No Urut</th>
                                <th style="width: 15%">Kode</th>
                                <th>Nama Klaster / Elemen / Standar</th>
                                <th style="width: 15%">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($clusters as $cluster)
                                <tr>
                                    <td class="text-center font-weight-bold">{{ $cluster->order_index }}</td>
                                    <td class="font-weight-bold">{{ $cluster->code }}</td>
                                    <td>
                                        {{ $cluster->name }}
                                        <div class="small text-muted mt-1">
                                            <i class="fas fa-list-ul"></i> {{ $cluster->indicators->count() }} Butir Indikator
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <a href="{{ route('cluster.edit', $cluster->id) }}" class="btn btn-sm btn-warning"
                                            title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        
                                        <button class="btn btn-sm btn-danger btn-delete" 
                                                data-id="{{ $cluster->id }}" 
                                                data-name="{{ $cluster->name }}"
                                                data-toggle="modal" 
                                                data-target="#deleteModal" 
                                                title="Hapus">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="4" class="text-center text-muted py-4">
                                        Belum ada data.
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

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
                        Data klaster <strong id="deleteClusterName" class="text-dark"></strong> akan dihapus permanen.<br>
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
        $('.btn-delete').on('click', function() {
            var id = $(this).data('id');
            var name = $(this).data('name');
            
            var url = "{{ url('/master/klaster/hapus') }}/" + id;
            
            $('#deleteForm').attr('action', url);
            
            $('#deleteClusterName').text('"' + name + '"');
        });
    });
</script>
@endsection