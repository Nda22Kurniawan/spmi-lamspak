@extends('template.HomeView', ['title' => 'Home'])
@section('content')

    <section id="hero">
        <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

            <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

            <div class="carousel-inner" role="listbox">

                <div class="carousel-item active"
                    style="background-image: url(https://via.placeholder.com/1920x1080?text=FTIK+USM)">
                    <div class="carousel-container">
                        <div class="container animate__animated animate__fadeInUp">
                            <h2>FTIK USM</h2>
                            <p>Menjadi fakultas yang memiliki daya saing dalam Tri Dharma perguruan tinggi berbasis
                                teknologi,
                                dengan karakter berke-Indonesia-an.</p>
                            <a href="#about" class="btn-hero scrollto">Selengkapnya</a>
                        </div>
                    </div>
                </div>

                <div class="carousel-item"
                    style="background-image: url(https://via.placeholder.com/1920x1080?text=Teknik+Informatika)">
                    <div class="carousel-container">
                        <div class="container animate__animated animate__fadeInUp">
                            <h2>Teknik Informatika</h2>
                            <p>Menjadi Program Studi bereputasi di bidang Pengembangan rekayasa Perangkat Lunak,
                            Sistem dan Keamanan jaringan, dan Sistem Cerdas serta pengembangan sumber daya insani yang profesional, beradab dan berkelndonesiaan.</p>
                            <a href="#about" class="btn-hero scrollto">Lihat Program Studi</a>
                        </div>
                    </div>
                </div>

                <div class="carousel-item"
                    style="background-image: url(https://via.placeholder.com/1920x1080?text=Sistem+Informasi)">
                    <div class="carousel-container">
                        <div class="container animate__animated animate__fadeInUp">
                            <h2>Sistem Informasi</h2>
                            <p>Menjadi Program Studi yang unggul dalam mengoptimalkan pemanfaatan Teknologi Informasi di bidang bisnis, menciptakan lulusan yang
                            berkarakter ke Indonesiaan dan memiliki kompetensi professional Sistem Informasi yang mampu bersaing ditingkat global.</p>
                            <a href="#about" class="btn-hero scrollto">Lihat Program Studi</a>
                        </div>
                    </div>
                </div>

                <div class="carousel-item"
                    style="background-image: url(https://via.placeholder.com/1920x1080?text=Ilmu+Komunikasi)">
                    <div class="carousel-container">
                        <div class="container animate__animated animate__fadeInUp">
                            <h2>Ilmu Komunikasi</h2>
                            <p>Program Studi Ilmu Komunikasi Universitas Semarang pada tahun 2023 mampu menghasilkan lulusan yang bermoral,
                            berkualitas, berkarakter, kompetitif, dan dapat mengikuti perkembangan IPTekS dalam dunia komunikasi sesuai dengan tren internasional di 
                            masa depan melalui penyelenggaraan Tri Dharma Perguruan Tinggi.</p>
                            <a href="#about" class="btn-hero scrollto">Lihat Program Studi</a>
                        </div>
                    </div>
                </div>

                <div class="carousel-item"
                    style="background-image: url(https://via.placeholder.com/1920x1080?text=Pariwisata)">
                    <div class="carousel-container">
                        <div class="container animate__animated animate__fadeInUp">
                            <h2>Pariwisata</h2>
                            <p>Menjadi program studi pariwisata yang unggul, kompetitif, professional dan berkarakter berkeindonesiaan serta mampu
                                 bersaing di tingkat global berbasis teknologi informasi.</p>
                            <a href="#about" class="btn-hero scrollto">Lihat Program Studi</a>
                        </div>
                    </div>
                </div>

            </div>

            <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
                <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
            </a>

            <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
                <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
            </a>

        </div>
    </section>
    <main id="main">

        <section id="features" class="features py-5" style="background-color: #f8f9fa;">
            <div class="container">

                <div class="row gy-4">
                    <div class="col-lg-4 col-md-6">
                        <div class="feature-card shadow-sm p-4 text-center h-100">
                            <div class="feature-icon mb-3">
                                <i class="bi bi-laptop"></i>
                            </div>
                            <h4 class="title fw-bold">Efisien</h4>
                            <p class="description">
                                Dengan menerapkan penyimpanan berkas secara cloud, berkas akan
                                lebih mudah dan aman saat disimpan.
                            </p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6">
                        <div class="feature-card shadow-sm p-4 text-center h-100">
                            <div class="feature-icon mb-3">
                                <i class="bi bi-search"></i>
                            </div>
                            <h4 class="title fw-bold">Cepat</h4>
                            <p class="description">
                                Berkas akan lebih mudah dicari jika akan dibutuhkan saat akan
                                dilakukan validasi kembali.
                            </p>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6">
                        <div class="feature-card shadow-sm p-4 text-center h-100">
                            <div class="feature-icon mb-3">
                                <i class="bi bi-check-circle"></i>
                            </div>
                            <h4 class="title fw-bold">Tepat</h4>
                            <p class="description">
                                Laporan pencapaian nilai asesmen membantu stakeholder mengambil
                                keputusan yang tepat untuk perbaikan mutu.
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <section id="about" class="about py-5">
            <div class="container">

                <div class="section-title text-center mb-5">
                    <h2>Tentang FTIK USM</h2>
                    <p>Memperbaiki tata kelola pemberkasan menjadi lebih baik dan efisien, menciptakan simulasi perhitungan
                        nilai asesmen pencapaian suatu Program Studi.</p>
                </div>

                <div class="row align-items-center">
                    <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
                        <h3>Program Studi Terdaftar</h3>
                        <p class="fst-italic">
                            Berikut adalah data Program Studi yang terdaftar di <b>Fakultas Teknologi Informasi dan
                                Komunikasi</b>:
                        </p>
                        <ul class="list-unstyled prodi-list mt-4">
                            @foreach ($data['p'] as $i)
                                <li>
                                    <i class="bi bi-check-circle-fill"></i>
                                    <a href="{{ url('diagram/' . $i->kode) }}">
                                        {{ $i->name }} - <b>{{ $i->kode }}</b> ({{ $i->jenjang->kode }})
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>

            </div>
        </section>
    </main>
@endsection