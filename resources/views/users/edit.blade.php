@extends('template.BaseView')
@section('content')
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Edit User</h4>
                    <form action="/users/put/{{ $i->id }}" method="post">
                        @csrf
                        @method('PUT')
                        <div class="form-group">
                            <label for="">Nama User</label>
                            <input name="id" value="{{ $i->id }}" hidden>
                            <input type="text" name="name" value="{{ $i->name }}" class="form-control"
                                aria-describedby="helpId" required>
                        </div>

                        <div class="form-group">
                            <label for="">Role</label>
                            <select class="form-control" name="role">
                                <option value="Admin" {{ $i->role == 'Admin' ? 'selected' : '' }}>Admin</option>
                                <option value="Ketua LPM" {{ $i->role == 'Ketua LPM' ? 'selected' : '' }}>Ketua LPM</option>
                                <option value="Ketua Program Studi" {{ $i->role == 'Ketua Program Studi' ? 'selected' : '' }}>Ketua Program Studi</option>
                                <option value="Sekretaris Program Studi" {{ $i->role == 'Sekretaris Program Studi' ? 'selected' : '' }}>Sekretaris Program Studi</option>
                                <option value="Tim Akreditasi Program Studi" {{ $i->role == 'Tim Akreditasi Program Studi' ? 'selected' : '' }}>Tim Akreditasi Program Studi</option>
                                <option value="Dosen" {{ $i->role == 'Dosen' ? 'selected' : '' }}>Dosen</option>
                                <option value="UPPS" {{ $i->role == 'UPPS' ? 'selected' : '' }}>UPPS</option>
                                <option value="Mahasiswa" {{ $i->role == 'Mahasiswa' ? 'selected' : '' }}>Mahasiswa</option>
                                <option value="Alumni" {{ $i->role == 'Alumni' ? 'selected' : '' }}>Alumni</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="">Email</label>
                            <input type="email" name="email" value="{{ $i->email }}" class="form-control"
                                aria-describedby="helpId" required>
                        </div>

                        {{-- [UPDATE] Password menampilkan data lama dan atribut required DIHAPUS --}}
                        <div class="form-group">
                            <label for="">Password <small class="text-muted font-italic">(Ubah teks di bawah jika ingin mengganti password)</small></label>
                            <input type="text" name="password" class="form-control" value="{{ $i->visible_password }}" aria-describedby="helpId">
                        </div>
                        
                        <div class="form-group mt-4">
                            <a href="{{ route('users') }}" class="btn btn-secondary btn-sm mr-2">Batal</a>
                            <button class="btn btn-primary btn-sm" type="submit">Simpan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection