@extends('template.BaseView')

@section('content')
<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Edit Klaster</h1>

    <div class="card shadow mb-4">
        <div class="card-body">
            <form action="{{ route('cluster.update', $cluster->id) }}" method="POST">
                @csrf
                @method('PUT')
                
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label font-weight-bold">Instrumen LAM</label>
                    <div class="col-sm-10">
                        <select name="model_id" class="form-control" required>
                            @foreach($lams as $lam)
                                <option value="{{ $lam->id }}" {{ $cluster->model_id == $lam->id ? 'selected' : '' }}>
                                    {{ $lam->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label font-weight-bold">Kode Klaster</label>
                    <div class="col-sm-10">
                        <input type="text" name="code" class="form-control" value="{{ $cluster->code }}">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label font-weight-bold">Nama Klaster</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" value="{{ $cluster->name }}" required>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label font-weight-bold">No. Urut Tampilan</label>
                    <div class="col-sm-2">
                        <input type="number" name="order_index" class="form-control" value="{{ $cluster->order_index }}" required>
                    </div>
                    <div class="col-sm-8 d-flex align-items-center">
                        <small class="text-muted">Urutan tampilan di halaman asesmen.</small>
                    </div>
                </div>

                <hr>
                <div class="text-right">
                    <a href="{{ route('cluster.index', ['lam_id' => $cluster->model_id]) }}" class="btn btn-secondary">Batal</a>
                    <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection