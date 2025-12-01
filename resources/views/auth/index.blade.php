@extends('template.AuthBase')
@section('auth')

    <div class="row justify-content-center">

        <div class="col-lg-7">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    
                    <div class="row">
                        <div class="col-lg">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">FTIK USM</h1>
                                </div>
                                @if (session()->has('pesan'))
                                    {!! session()->get('pesan') !!}
                                @endif
                                <form action="{{ url('proses') }}" class="user" method="POST">
                                    @csrf
                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                            aria-describedby="emailHelp" placeholder="Enter Email Address..." name="email"
                                            required>
                                    </div>

                                    <div class="form-group position-relative">
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleInputPassword" placeholder="Password" name="password" required>

                                        <span toggle="#exampleInputPassword" class="fas fa-eye field-icon toggle-password"
                                            style="position: absolute; right: 20px; top: 50%; transform: translateY(-50%); cursor: pointer; z-index: 2;"></span>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-user btn-block">
                                        Login
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const togglePassword = document.querySelector('.toggle-password');
            const password = document.querySelector('#exampleInputPassword');

            togglePassword.addEventListener('click', function () {
                // Toggle tipe input: password menjadi text, dan sebaliknya
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);

                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });
        });
    </script>
@endsection