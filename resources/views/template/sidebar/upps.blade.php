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

    <div class="sidebar-heading">
        Sistem Penjaminan Mutu
    </div>

    <li class="nav-item {{ request()->routeIs('assessment.form_asesmen') ? 'active' : '' }}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseAsesmen" aria-expanded="true"
            aria-controls="collapseAsesmen">
            <i class="fas fa-fw fa-edit"></i>
            <span>Isi Asesmen Mutu</span>
        </a>
        <div id="collapseAsesmen" class="collapse" aria-labelledby="headingAsesmen" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Pilih Program Studi:</h6>
                @foreach ($data['p'] as $pr)
                    <a class="collapse-item" href="{{ route('assessment.form_asesmen', ['prodi_id' => $pr->id]) }}">{{ $pr->name }}</a>
                @endforeach
            </div>
        </div>
    </li>

    <li class="nav-item {{ request()->routeIs('raw_data.index') ? 'active' : '' }}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDkps" aria-expanded="true"
            aria-controls="collapseDkps">
            <i class="fas fa-fw fa-calculator"></i>
            <span>Data Statistik (DKPS)</span>
        </a>
        <div id="collapseDkps" class="collapse" aria-labelledby="headingDkps" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Pilih Program Studi:</h6>
                @foreach ($data['p'] as $pr)
                    <a class="collapse-item" href="{{ route('raw_data.index', ['prodi_id' => $pr->id]) }}">{{ $pr->name }}</a>
                @endforeach
            </div>
        </div>
    </li>

    <li class="nav-item {{ request()->routeIs('diagram.show') ? 'active' : '' }}">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseGrafik" aria-expanded="true"
            aria-controls="collapseGrafik">
            <i class="fas fa-fw fa-chart-pie"></i>
            <span>Grafik & Laporan</span>
        </a>
        <div id="collapseGrafik" class="collapse" aria-labelledby="headingGrafik" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Pilih Program Studi:</h6>
                @foreach ($data['p'] as $pr)
                    <a class="collapse-item" href="{{ route('diagram.show', ['prodi_id' => $pr->id]) }}">{{ $pr->name }}</a>
                @endforeach
            </div>
        </div>
    </li>

    <hr class="sidebar-divider">

    <div class="sidebar-heading">
        Pengaturan Sistem
    </div>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePengaturan" aria-expanded="true"
            aria-controls="collapsePengaturan">
            <i class="fas fa-fw fa-cog"></i>
            <span>Pengaturan Data</span>
        </a>
        <div id="collapsePengaturan" class="collapse" aria-labelledby="headingPengaturan" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="{{ route('jenjang') }}">Jenjang Pendidikan</a>
                <a class="collapse-item" href="{{ route('prodi') }}">Program Studi</a>
            </div>
        </div>
    </li>

    <hr class="sidebar-divider d-none d-md-block">

    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>