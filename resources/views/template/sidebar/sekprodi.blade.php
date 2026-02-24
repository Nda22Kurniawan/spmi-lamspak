<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    {{-- Brand --}}
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{ route('dashboard') }}">
        <div class="sidebar-brand-icon">
            <i class="fas fa-book-open"></i>
        </div>
        <div class="sidebar-brand-text mx-3">FTIK USM</div>
    </a>

    <hr class="sidebar-divider my-0">

    {{-- Menu Utama --}}
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

    <div class="sidebar-heading">
        Sistem Penjaminan Mutu
    </div>

    {{-- 1. Isi Asesmen (Logic ID Prodi Fix) --}}
    <li class="nav-item {{ request()->routeIs('assessment.form_asesmen') ? 'active' : '' }}">
        @php
            $userProdiId = 0;
            // Cek apakah user punya kolom prodi_kode
            if(Auth::user()->prodi_kode) {
                $prodiData = \App\Models\Prodi::where('kode', Auth::user()->prodi_kode)->first();
                $userProdiId = $prodiData ? $prodiData->id : 0;
            }
        @endphp
        
        <a class="nav-link" href="{{ route('assessment.form_asesmen', ['prodi_id' => $userProdiId]) }}">
            <i class="fas fa-fw fa-edit"></i>
            <span>Isi Asesmen Mutu</span>
        </a>
    </li>

    {{-- 2. Data Statistik (DKPS) --}}
    <li class="nav-item {{ request()->routeIs('raw_data.index') ? 'active' : '' }}">
        <a class="nav-link" href="{{ route('raw_data.index', ['prodi_id' => $userProdiId]) }}">
            <i class="fas fa-fw fa-calculator"></i>
            <span>Data Statistik (DKPS)</span>
        </a>
    </li>

    {{-- 3. Grafik & Laporan --}}
    <li class="nav-item {{ request()->routeIs('diagram.show') ? 'active' : '' }}">
        <a class="nav-link" href="{{ route('diagram.show', ['prodi_id' => $userProdiId]) }}">
            <i class="fas fa-fw fa-chart-pie"></i>
            <span>Grafik & Laporan</span>
        </a>
    </li>

    <hr class="sidebar-divider">

    <div class="sidebar-heading">
        Administrasi Prodi
    </div>

    {{-- Pengaturan Prodi --}}
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pengaturan" aria-expanded="true"
            aria-controls="pengaturan">
            <i class="fas fa-fw fa-cog"></i>
            <span>Pengaturan Data</span>
        </a>
        <div id="pengaturan" class="collapse" aria-labelledby="heading2" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                {{-- <a class="collapse-item" href="{{ url('target/' . Auth::user()->prodi_kode) }}">Target Pencapaian</a> --}}
                <a class="collapse-item" href="{{ url('data/mahasiswa/' . Auth::user()->prodi_kode) }}">Data Mahasiswa & Alumni</a>
            </div>
        </div>
    </li>

    <hr class="sidebar-divider d-none d-md-block">

    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>