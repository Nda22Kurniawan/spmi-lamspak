<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{ route('dashboard') }}">
        <div class="sidebar-brand-icon">
            <i class="fas fa-book-open"></i>
        </div>
        <div class="sidebar-brand-text mx-3">FTIK USM</div>
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

    @php
        // Ambil ID Prodi berdasarkan Kode Prodi User (Mahasiswa/Alumni)
        $userProdiId = 0;
        if(Auth::user()->prodi_kode) {
            $prodiData = \App\Models\Prodi::where('kode', Auth::user()->prodi_kode)->first();
            $userProdiId = $prodiData ? $prodiData->id : 0;
        }
    @endphp

    <div class="sidebar-heading">
        Sistem Penjaminan Mutu
    </div>

    <li class="nav-item {{ request()->routeIs('diagram.show') ? 'active' : '' }}">
        <a class="nav-link" href="{{ route('diagram.show', ['prodi_id' => $userProdiId]) }}">
            <i class="fas fa-fw fa-chart-pie"></i>
            <span>Grafik & Laporan</span>
        </a>
    </li>

    <hr class="sidebar-divider d-none d-md-block">

    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>