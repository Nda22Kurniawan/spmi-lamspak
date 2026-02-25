@extends('template.BaseView')

@section('content')
    <div class="row">
        <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2">
            <div class="card shadow mb-4 border-left-primary">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Edit Profil Saya</h6>
                </div>
                <div class="card-body">
                    
                    {!! session('pesan') !!}

                    <form action="{{ route('profile.update') }}" method="POST">
                        @csrf
                        @method('PUT')

                        <div class="form-group">
                            <label class="font-weight-bold">Nama Lengkap</label>
                            <input type="text" name="name" value="{{ old('name', $user->name) }}" class="form-control" required>
                            @error('name') <small class="text-danger">{{ $message }}</small> @enderror
                        </div>

                        <div class="form-group">
                            <label class="font-weight-bold">Email Akun</label>
                            <input type="email" name="email" value="{{ old('email', $user->email) }}" class="form-control" required>
                            @error('email') <small class="text-danger">{{ $message }}</small> @enderror
                        </div>

                        <hr class="mt-4 mb-4">
                        
                        <div class="form-group">
                            <label class="font-weight-bold">Ganti Password <span class="text-muted font-weight-normal">(Opsional)</span></label>
                            
                            <div class="input-group">
                                <input type="password" id="passwordInput" name="password" class="form-control" placeholder="Ketik password baru jika ingin diganti...">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="button" id="togglePassword" title="Lihat/Sembunyikan Password">
                                        <i class="fas fa-eye" id="eyeIcon"></i>
                                    </button>
                                </div>
                            </div>
                            
                            <small class="text-muted font-italic">Biarkan kolom ini <strong>kosong</strong> jika Anda tidak ingin merubah password.</small>
                            @error('password') <br><small class="text-danger">{{ $message }}</small> @enderror
                        </div>

                        <div class="form-group text-right mt-4">
                            <a href="{{ route('dashboard') }}" class="btn btn-secondary mr-2">
                                <i class="fas fa-times"></i> Batal
                            </a>
                            <button class="btn btn-primary" type="submit">
                                <i class="fas fa-save"></i> Simpan
                            </button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
<script>
    document.getElementById('togglePassword').addEventListener('click', function () {
        const passwordInput = document.getElementById('passwordInput');
        const eyeIcon = document.getElementById('eyeIcon');
        
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        
        eyeIcon.classList.toggle('fa-eye-slash');
        eyeIcon.classList.toggle('fa-eye');
    });
</script>
@endsection