@extends('template.BaseView')
@section('content')
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Tambah Tim Akreditasi Program Studi</h4>
                    
                    <form action="/users/store" method="post">
                        @csrf
                        <div class="form-group">
                            <label>Nama Anggota Tim</label>
                            <input type="text" name="name" class="form-control" required>
                            
                            {{-- Role diset otomatis --}}
                            <input type="hidden" name="role" value="Tim Akreditasi Program Studi">
                        </div>

                        <div class="form-group">
                            <label>Program Studi</label>
                            <select class="form-control" name="prodi_kode" required>
                                <option value="">-- Pilih Program Studi --</option>
                                @foreach ($prodi as $i)
                                    <option value="{{ $i->kode }}">{{ $i->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input type="text" name="password" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <button class="btn-primary btn-sm" type="submit">Simpan</button>
                            <a href="{{ route('users') }}" class="btn btn-secondary btn-sm">Batal</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection