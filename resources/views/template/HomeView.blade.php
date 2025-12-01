<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Smart Sistem Penjamin Mutu Internal - {{ $title ?? 'Home' }}</title>
    <meta name="author" content="Ricky Martin Ginting">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <link rel="apple-touch-icon" sizes="57x57" href="{{ asset('favicon/apple-icon-57x57.png') }}">
    <link rel="apple-touch-icon" sizes="60x60" href="{{ asset('favicon/apple-icon-60x60.png') }}">
    <link rel="apple-touch-icon" sizes="72x72" href="{{ asset('favicon/apple-icon-72x72.png') }}">
    <link rel="apple-touch-icon" sizes="76x76" href="{{ asset('favicon/apple-icon-76x76.png') }}">
    <link rel="apple-touch-icon" sizes="114x114" href="{{ asset('favicon/apple-icon-114x114.png') }}">
    <link rel="apple-touch-icon" sizes="120x120" href="{{ asset('favicon/apple-icon-120x120.png') }}">
    <link rel="apple-touch-icon" sizes="144x144" href="{{ asset('favicon/apple-icon-144x144.png') }}">
    <link rel="apple-touch-icon" sizes="152x152" href="{{ asset('favicon/apple-icon-152x152.png') }}">
    <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('favicon/apple-icon-180x180.png') }}">
    <link rel="icon" type="image/png" sizes="192x192" href="{{ asset('favicon/android-icon-192x192.png') }}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('favicon/favicon-32x32.png') }}">
    <link rel="icon" type="image/png" sizes="96x96" href="{{ asset('favicon/favicon-96x96.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('favicon/favicon-16x16.png') }}">
    <link rel="manifest" href="{{ asset('favicon/manifest.json') }}">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="{{ asset('favicon/ms-icon-144x144.png') }}">
    <meta name="theme-color" content="#ffffff">

    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

    <link href="{{ asset('home/vendor/animate.css/animate.min.css') }}" rel="stylesheet">
    <link href="{{ asset('home/vendor/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('home/vendor/bootstrap-icons/bootstrap-icons.css') }}" rel="stylesheet">
    <link href="{{ asset('home/vendor/boxicons/css/boxicons.min.css') }}" rel="stylesheet">
    <link href="{{ asset('home/vendor/glightbox/css/glightbox.min.css') }}" rel="stylesheet">
    <link href="{{ asset('home/vendor/swiper/swiper-bundle.min.css') }}" rel="stylesheet">
    <link href="{{ asset('portal/vendor/datatables/dataTables.bootstrap4.min.css') }}" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

    <link href="{{ asset('home/css/style.css') }}" rel="stylesheet">

    <style>
        :root {
            /* Ganti warna ini sesuai brand FTIK USM */
            --primary-color: #FF6600;
            /* INI WARNA ORANYE BARU */
            --primary-hover: #E05A00;
            /* INI WARNA ORANYE (HOVER) BARU */
        }

        body {
            font-family: 'Poppins', sans-serif;
        }

        /* Modern Hero Section */
        #hero {
            width: 100%;
            height: 90vh;
            padding: 0;
            overflow: hidden;
        }

        #hero .carousel-item {
            width: 100%;
            height: 90vh;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        #hero .carousel-item::before {
            content: "";
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            /* Overlay gelap agar teks terbaca */
            background: rgba(0, 0, 0, 0.6);
        }

        #hero .carousel-container {
            display: flex;
            justify-content: center;
            align-items: center;
            position: absolute;
            bottom: 0;
            top: 0;
            left: 0;
            right: 0;
            flex-direction: column;
            text-align: center;
        }

        #hero h2 {
            color: #fff;
            margin-bottom: 20px;
            font-size: 48px;
            font-weight: 700;
        }

        #hero p {
            width: 80%;
            color: rgba(255, 255, 255, 0.8);
            margin: 0 auto 30px auto;
            font-size: 18px;
        }

        #hero .btn-hero {
            font-weight: 500;
            font-size: 16px;
            letter-spacing: 1px;
            display: inline-block;
            padding: 12px 32px;
            border-radius: 50px;
            transition: 0.5s;
            margin: 10px;
            color: #fff;
            background: var(--primary-color);
            border: 2px solid var(--primary-color);
        }

        #hero .btn-hero:hover {
            background: transparent;
            border-color: #fff;
        }

        /* Modern Card Features */
        .feature-card {
            border: none;
            border-radius: 15px;
            transition: all 0.3s ease-in-out;
            background: #fff;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08) !important;
        }

        .feature-icon {
            font-size: 48px;
            color: var(--primary-color);
        }

        /* List Prodi yang lebih rapi */
        .prodi-list li {
            padding-bottom: 15px;
            font-size: 1.1rem;
        }

        .prodi-list i {
            font-size: 20px;
            color: var(--primary-color);
            margin-right: 8px;
        }

        .prodi-list a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            transition: color 0.3s;
        }

        .prodi-list a:hover {
            color: var(--primary-color);
        }

        /* Modern Footer */
        #footer {
            background: #f8f9fa;
            /* Warna background sedikit abu-abu */
            color: #444;
            font-size: 14px;
            padding-top: 60px;
            padding-bottom: 30px;
            border-top: 1px solid #e9ecef;
        }

        #footer .footer-top {
            padding-bottom: 30px;
        }

        #footer .footer-heading {
            font-size: 18px;
            font-weight: 600;
            color: #222;
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
        }

        #footer .footer-heading::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 50px;
            height: 2px;
            background: var(--primary-color);
        }

        #footer .footer-links {
            margin-bottom: 30px;
        }

        #footer .footer-links ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        #footer .footer-links ul li {
            padding: 10px 0;
            display: flex;
            align-items: center;
        }

        #footer .footer-links ul i {
            padding-right: 8px;
            color: var(--primary-color);
            font-size: 16px;
        }

        #footer .footer-links ul a {
            color: #555;
            transition: 0.3s;
            display: inline-block;
            line-height: 1;
            text-decoration: none;
        }

        #footer .footer-links ul a:hover {
            color: var(--primary-color);
        }

        #footer .logo-footer img {
            max-height: 40px;
            margin-bottom: 15px;
        }

        #footer .copyright-wrap {
            border-top: 1px solid #e9ecef;
            padding-top: 30px;
            text-align: center;
        }
        
    </style>
</head>

<body>

    <header id="header" class="d-flex align-items-center">
        <div class="container d-flex align-items-center">

            <a href="{{ route('home') }}" class="logo me-auto"><img src="{{ asset('home/img/ftik-usm.png') }}" alt=""
                    class="img-fluid"></a>

            <nav id="navbar" class="navbar">
                <ul>
                    <li><a class="nav-link scrollto {{ request()->is('/') ? 'active' : '' }}"
                            href="{{ route('home') }}">Home</a>
                    </li>
                    <li><a class="nav-link scrollto {{ request()->is('diagram*') ? 'active' : '' }}"
                            href="{{ route('diagram') }}">Diagram
                            Pencapaian</a></li>
                    <li class="dropdown"><a href="#"><span>Search</span> <i class="bi bi-chevron-down"></i></a>
                        <ul>
                            <li><a href="{{ route('multipleSearch') }}">Multiple Search</a></li>
                            <li><a href="{{ route('singleSearch') }}">Single Search</a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#"><span>Berkas</span> <i class="bi bi-chevron-down"></i></a>
                        <ul>
                            @foreach ($data['p'] as $pr)
                                <li><a href="{{ url('tabel/' . $pr->kode) }}">{{ $pr->name }}</a></li>
                            @endforeach
                        </ul>
                    </li>
                    <li>
                        @if (Auth::guest())
                            <a class="getstarted scrollto" href="{{ route('login') }}">Login Admin</a>
                        @else
                            <a class="getstarted scrollto" href="{{ route('dashboard') }}">Dashboard</a>
                        @endif
                    </li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav>
        </div>
    </header>
    @yield('content')

    <footer id="footer">
        <div class="footer-top">
            <div class="container">
                <div class="row">

                    <div class="col-lg-4 col-md-6 footer-links">
                        <a href="{{ route('home') }}" class="logo-footer"><img
                                src="{{ asset('home/img/ftik-usm.png') }}" alt="" class="img-fluid"></a>
                        <p class.="mt-3">
                            Fakultas Teknologi Informasi dan Komunikasi<br>
                            Universitas Semarang (USM)<br>
                            Jl. Soekarno-Hatta, Tlogosari Kulon<br>
                            Semarang, Jawa Tengah 50196<br><br>
                            <strong>Phone:</strong> (024) 6702757<br>
                            <strong>Email:</strong> ftik@usm.ac.id<br>
                        </p>
                    </div>

                    <div class="col-lg-2 col-md-6 footer-links">
                        <h4 class="footer-heading">Tautan Cepat</h4>
                        <ul>
                            <li><i class="bi bi-chevron-right"></i> <a href="{{ route('home') }}">Home</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="{{ route('diagram') }}">Diagram
                                    Pencapaian</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="{{ route('multipleSearch') }}">Multiple
                                    Search</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="{{ route('singleSearch') }}">Single
                                    Search</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4 class="footer-heading">Program Studi</h4>
                        <ul>
                            @foreach ($data['p'] as $pr)
                                <li><i class="bi bi-chevron-right"></i> <a
                                        href="{{ url('tabel/' . $pr->kode) }}">{{ $pr->name }}</a></li>
                            @endforeach
                        </ul>
                    </div>

                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4 class="footer-heading">Akun</h4>
                        <ul>
                            @if (Auth::guest())
                                <li><i class="bi bi-chevron-right"></i> <a href="{{ route('login') }}">Login Admin</a></li>
                            @else
                                <li><i class="bi bi-chevron-right"></i> <a href="{{ route('dashboard') }}">Dashboard</a>
                                </li>
                            @endif
                        </ul>
                    </div>

                </div>
            </div>
        </div>

        <div class="container">
            <div class="copyright-wrap">
                <div class="copyright">
                    &copy; Copyright <strong><span>FTIK USM</span></strong>. All Rights Reserved
                </div>
                <div class="credits">
                    Created by <a>DECOMUS</a>
                </div>
            </div>
        </div>
    </footer>
    <a href="#" class="back-to-top d-flex align-items: center justify-content: center"><i
            class="bi bi-arrow-up-short"></i></a>

    <script src="{{ asset('home/vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('home/vendor/glightbox/js/glightbox.min.js') }}"></script>
    <script src="{{ asset('home/vendor/isotope-layout/isotope.pkgd.min.js') }}"></script>
    <script src="{{ asset('home/vendor/swiper/swiper-bundle.min.js') }}"></script>
    <script src="{{ asset('home/vendor/php-email-form/validate.js') }}"></script>

    <script src="{{ asset('home/js/main.js') }}"></script>

    <script src="{{ asset('portal/vendor/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('portal/vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>

    <script src="{{ asset('portal/vendor/jquery-easing/jquery.easing.min.js') }}"></script>

    <script src="{{ asset('portal/vendor/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('portal/vendor/datatables/dataTables.bootstrap4.min.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="{{ asset('dist/ckeditor/ckeditor.js') }}"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <script src="{{ asset('portal/js/demo/datatables-demo.js') }}"></script>

    @yield('script')
</body>

</html>