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
            <span>Home Page</span></a>
        <a class="nav-link" href="{{ route('dashboard') }}">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

    <div class="sidebar-heading">
        Administrator
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

    <hr class="sidebar-divider">

    <div class="sidebar-heading">
        SPMI Terintegrasi
    </div>

    <li class="nav-item">
        <a class="nav-link" href="{{ route('raw_data.index') }}">
            <i class="fas fa-fw fa-calculator"></i>
            <span>Data Statistik (DKPS)</span>
        </a>
    </li>

    <li class="nav-item {{ request()->routeIs('assessment.*') ? 'active' : '' }}">
        <a class="nav-link" href="{{ route('assessment.pilih_prodi') }}">
            <i class="fas fa-fw fa-edit"></i>
            <span>Isi Asesmen Prodi</span>
        </a>
    </li>

    <li class="nav-item {{ request()->routeIs('diagram.*') ? 'active' : '' }}">
        <a class="nav-link" href="{{ route('diagram.index') }}">
            <i class="fas fa-fw fa-chart-pie"></i>
            <span>Grafik Capaian Mutu</span>
        </a>
    </li>

    {{-- <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#menuAkreditasi" aria-expanded="true"
            aria-controls="menuAkreditasi">
            <i class="fas fa-fw fa-tasks"></i>
            <span>Lembar Asesmen</span>
        </a>
        <div id="menuAkreditasi" class="collapse" aria-labelledby="headingLam" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Pilih Instrumen:</h6>

                @if(isset($global_lams) && count($global_lams) > 0)
                    @foreach($global_lams as $lam)
                        <a class="collapse-item" href="{{ route('assessment.index', $lam->id) }}">
                            {{ $lam->name }}
                        </a>
                    @endforeach
                @else
                    <a class="collapse-item" href="#">Belum ada Instrumen</a>
                @endif
            </div>
        </div>
    </li> --}}

    <hr class="sidebar-divider">

    <div class="sidebar-heading">
        Master Menu (Legacy)
    </div>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#prodi" aria-expanded="true"
            aria-controls="prodi">
            <i class="fa-solid fa-circle-check"></i>
            <span>Penilain & Diagram</span></a>
        </a>
        <div id="prodi" class="collapse" aria-labelledby="heading1" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                @if(isset($data['p']))
                    @foreach ($data['p'] as $pr)
                        <a class="collapse-item" href="{{ route($pr->kode) }}">{{ $pr->name }}</a>
                    @endforeach
                @endif
            </div>
        </div>
    </li>

    <li class="nav-item">
        @if(isset($data['j']))
            @foreach ($data['j'] as $jn)
                <a class="nav-link" href="{{ route($jn->kode) }}">
                    <i class="fa-solid fa-folder"></i>
                    <span>Butir Kriteria</span>
                </a>
            @endforeach
        @endif
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#sub-butir" aria-expanded="true"
            aria-controls="sub-butir">
            <i class="fa-solid fa-folder-tree"></i>
            <span>Sub Butir Kriteria</span>
        </a>
        <div id="sub-butir" class="collapse" aria-labelledby="heading1" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="{{ route('level2') }}">Level 2 (C1.x)</a>
                <a class="collapse-item" href="{{ route('level3') }}">Level 3 (C1.x.x)</a>
                <a class="collapse-item" href="{{ route('level4') }}">Level 4 (C1.x.x.x)</a>
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#indikator" aria-expanded="true"
            aria-controls="indikator">
            <i class="fa-solid fa-chart-bar"></i>
            <span>Indikator Penilaian</span></a>
        </a>
        <div id="indikator" class="collapse" aria-labelledby="heading1" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                @if(isset($data['j']))
                    @foreach ($data['j'] as $j)
                        <a class="collapse-item" href="{{ route('indikator-' . $j->kode) }}">{{ $j->name }}</a>
                    @endforeach
                @endif
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#element" aria-expanded="true"
            aria-controls="element">
            <i class="fa-brands fa-elementor"></i>
            <span>Element & Berkas</span></a>
        </a>
        <div id="element" class="collapse" aria-labelledby="heading1" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                @if(isset($data['p']))
                    @foreach ($data['p'] as $pr)
                        <a class="collapse-item" href="{{ route('element-' . $pr->kode) }}">{{ $pr->name }}</a>
                    @endforeach
                @endif
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="{{ route('berkas') }}">
            <i class="fa-solid fa-magnifying-glass"></i>
            <span>Multi Search</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pengaturan" aria-expanded="true"
            aria-controls="pengaturan">
            <i class="fas fa-fw fa-cog"></i>
            <span>Pengaturan</span>
        </a>
        <div id="pengaturan" class="collapse" aria-labelledby="heading2" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="{{ route('jenjang') }}">Jenjang Pendidikan</a>
                <a class="collapse-item" href="{{ route('prodi') }}">Program Studi</a>
                <a class="collapse-item" href="{{ route('target') }}">Target Pencapaian</a>
                <a class="collapse-item" href="{{ route('users') }}">Tambah User</a>
            </div>
        </div>
    </li>

    <hr class="sidebar-divider d-none d-md-block">

    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>