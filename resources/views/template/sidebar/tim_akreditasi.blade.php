<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    {{-- BRAND --}}
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{ route('dashboard') }}">
        <div class="sidebar-brand-icon">
            <i class="fas fa-user-shield"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Tim Akreditasi</div>
    </a>

    <hr class="sidebar-divider my-0">

    <li class="nav-item">
        <a class="nav-link" href="{{ route('home') }}">
            <i class="fa-solid fa-house"></i>
            <span>Home Page</span>
        </a>
        <a class="nav-link" href="{{ route('dashboard') }}">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
        </a>
    </li>

    <hr class="sidebar-divider">

    {{-- BAGIAN 1: MASTER DATA (KEWENANGAN ADMIN) --}}
    {{-- Ini yang memungkinkan Tim Akreditasi menambah indikator dari berbagai LAM --}}
    <div class="sidebar-heading">
        Master Data (Admin Access)
    </div>

    <li class="nav-item {{ request()->routeIs('pengaturan.lam') ? 'active' : '' }}">
        <a class="nav-link" href="{{ route('pengaturan.lam') }}">
            <i class="fas fa-fw fa-cogs"></i>
            <span>Setting LAM Prodi</span></a>
    </li>

    <li class="nav-item {{ request()->routeIs('indikator.wizard') ? 'active' : '' }}">
        <a class="nav-link" href="{{ route('indikator.wizard') }}">
            <i class="fas fa-fw fa-plus-circle"></i>
            <span>Tambah Indikator Baru</span></a>
    </li>

    <li class="nav-item {{ request()->routeIs('cluster.*') ? 'active' : '' }}">
        <a class="nav-link" href="{{ route('cluster.index') }}">
            <i class="fas fa-fw fa-list-alt"></i>
            <span>Master Klaster/Elemen</span></a>
    </li>

    <li class="nav-item {{ request()->routeIs('indikator.index') ? 'active' : '' }}">
        <a class="nav-link" href="{{ route('indikator.index') }}">
            <i class="fas fa-fw fa-list-check"></i>
            <span>Master Indikator</span></a>
    </li>

    <li class="nav-item {{ request()->routeIs('variable.index') ? 'active' : '' }}">
        <a class="nav-link" href="{{ route('variable.index') }}">
            <i class="fas fa-fw fa-database"></i>
            <span>Master Variabel (DKPS)</span></a>
    </li>

    <li class="nav-item {{ request()->routeIs('rubrics.index') ? 'active' : '' }}">
        <a class="nav-link" href="{{ route('rubrics.index') }}">
            <i class="fas fa-fw fa-table"></i>
            <span>Master Rubrik</span></a>
    </li>

    <hr class="sidebar-divider">

    {{-- BAGIAN 2: SPMI TERINTEGRASI (TUGAS PRODI) --}}
    {{-- Logic Ambil ID Prodi --}}
    @php
        $userProdiId = 0;
        if(Auth::user()->prodi_kode) {
            $prodiData = \App\Models\Prodi::where('kode', Auth::user()->prodi_kode)->first();
            $userProdiId = $prodiData ? $prodiData->id : 0;
        }
    @endphp

    <div class="sidebar-heading">
        Tugas Akreditasi Prodi
    </div>

    {{-- Isi Asesmen --}}
    <li class="nav-item {{ request()->routeIs('assessment.form_asesmen') ? 'active' : '' }}">
        <a class="nav-link" href="{{ route('assessment.form_asesmen', ['prodi_id' => $userProdiId]) }}">
            <i class="fas fa-fw fa-edit"></i>
            <span>Isi Asesmen Mutu</span>
        </a>
    </li>

    {{-- Input Statistik --}}
    <li class="nav-item {{ request()->routeIs('raw_data.index') ? 'active' : '' }}">
        <a class="nav-link" href="{{ route('raw_data.index', ['prodi_id' => $userProdiId]) }}">
            <i class="fas fa-fw fa-calculator"></i>
            <span>Input Data Statistik</span>
        </a>
    </li>

    {{-- Grafik --}}
    <li class="nav-item {{ request()->routeIs('diagram.show') ? 'active' : '' }}">
        <a class="nav-link" href="{{ route('diagram.show', ['prodi_id' => $userProdiId]) }}">
            <i class="fas fa-fw fa-chart-pie"></i>
            <span>Grafik & Laporan</span>
        </a>
    </li>

    <hr class="sidebar-divider">

    {{-- BAGIAN 3: MANAJEMEN BERKAS --}}
    {{-- <div class="sidebar-heading">
        Manajemen Berkas
    </div>

    <li class="nav-item">
        <a class="nav-link" href="{{ route('element-' . Auth::user()->prodi_kode) }}">
            <i class="fa-brands fa-elementor"></i>
            <span>Element & Upload Bukti</span>
        </a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="{{ route('berkas') }}">
            <i class="fa-solid fa-magnifying-glass"></i>
            <span>Multi Search Dokumen</span>
        </a>
    </li> --}}

    {{-- ADMINISTRASI (Target & Mahasiswa) --}}
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pengaturan" aria-expanded="true"
            aria-controls="pengaturan">
            <i class="fas fa-fw fa-cog"></i>
            <span>Administrasi Data</span>
        </a>
        <div id="pengaturan" class="collapse" aria-labelledby="heading2" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="{{ url('data/mahasiswa/' . Auth::user()->prodi_kode) }}">Data Mahasiswa & Alumni</a>
            </div>
        </div>
    </li>

    <hr class="sidebar-divider d-none d-md-block">

    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>