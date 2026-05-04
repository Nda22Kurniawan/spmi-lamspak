@extends('template.BaseView')

@section('content')
    <style>
        @media print {
            body {
                background-color: #fff !important;
                margin: 0 !important;
                padding: 0 !important;
            }

            #accordionSidebar,
            .topbar,
            footer.sticky-footer,
            .btn,
            a.btn,
            #sidebarToggleTop,
            .scroll-to-top {
                display: none !important;
            }

            #content-wrapper,
            #content,
            .container-fluid {
                width: 100% !important;
                margin: 0 !important;
                padding: 0 !important;
                box-shadow: none !important;
            }

            .card {
                border: none !important;
                box-shadow: none !important;
            }

            .card-header {
                background-color: #fff !important;
                border-bottom: 2px solid #000 !important;
                padding-left: 0 !important;
                padding-right: 0 !important;
            }

            .border-left-primary,
            .border-left-success,
            .border-left-warning {
                border-left: none !important;
                border: 1px solid #ddd !important;
            }

            .row {
                display: flex !important;
                flex-wrap: wrap !important;
            }

            .col-xl-3,
            .col-md-6 {
                flex: 0 0 33.333333% !important;
                max-width: 33.333333% !important;
            }

            .col-lg-8 {
                flex: 0 0 60% !important;
                max-width: 60% !important;
            }

            .col-lg-4 {
                flex: 0 0 40% !important;
                max-width: 40% !important;
            }

            .chart-area {
                height: 350px !important;
            }

            canvas {
                max-width: 100% !important;
                height: auto !important;
            }

            table {
                border-collapse: collapse !important;
            }

            .table-bordered th,
            .table-bordered td {
                border: 1px solid #000 !important;
            }

            .thead-dark th,
            .bg-primary,
            .bg-gray-200 {
                background-color: #f2f2f2 !important;
                color: #000 !important;
                border-color: #000 !important;
            }

            .badge {
                border: 1px solid #000 !important;
                color: #000 !important;
            }

            .badge-success {
                background-color: #d4edda !important;
                -webkit-print-color-adjust: exact;
            }

            .badge-warning {
                background-color: #fff3cd !important;
                -webkit-print-color-adjust: exact;
            }

            .badge-danger {
                background-color: #f8d7da !important;
                -webkit-print-color-adjust: exact;
            }

            .badge-info {
                background-color: #d1ecf1 !important;
                -webkit-print-color-adjust: exact;
            }

            .badge-primary {
                background-color: #cce5ff !important;
                -webkit-print-color-adjust: exact;
            }

            .bg-success {
                background-color: #d4edda !important;
                color: #000 !important;
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
            }

            tfoot td,
            tfoot th,
            .text-white {
                color: #000 !important;
            }
        }
    </style>

    <div class="container-fluid">

        {{-- Header --}}
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Laporan Capaian Mutu: {{ $prodi->name }}</h1>

            @if (auth()->check() && !in_array(auth()->user()->role, ['Ketua Program Studi', 'Sekretaris Program Studi']))
                <a href="{{ route('assessment.pilih_prodi') }}" class="btn btn-sm btn-secondary shadow-sm">
                    <i class="fas fa-arrow-left fa-sm text-white-50"></i> Kembali ke Pilih Prodi
                </a>
            @endif
        </div>

        {{-- Info Card --}}
        <div class="row mb-4">
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Instrumen</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $model->name }}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-file-alt fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Skor Rata-rata
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    {{ number_format(array_sum($scores) / (count($scores) > 0 ? count($scores) : 1), 2) }}
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-chart-line fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                    Nilai Keseluruhan (Terbobot)
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    {{ number_format(array_sum($weightedScores), 2) }}
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-award fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- BAGIAN 1: GRAFIK RADAR --}}
        <div class="row">
            <div class="col-lg-8">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Peta Capaian (Radar Chart)</h6>
                    </div>
                    <div class="card-body">
                        <div class="chart-area" style="height: 400px;">
                            <canvas id="myRadarChart"></canvas>
                        </div>
                        <div class="mt-3 text-center small text-muted font-italic">
                            * Grafik ini menggambarkan kekuatan dan kelemahan prodi pada setiap kriteria penilaian.
                            Semakin luas area biru, semakin baik performa prodi.
                        </div>
                    </div>
                </div>
            </div>

            {{-- BAGIAN 2: RINGKASAN SKOR PER KLASTER (Dengan Dropdown/Accordion) --}}
            <div class="col-lg-4">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Skor Per Kriteria</h6>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-borderless mb-0 accordion" id="accordionKriteria">
                                <thead class="bg-gray-200 text-gray-900">
                                    <tr>
                                        <th class="pl-4">Kriteria (Klik untuk detail)</th>
                                        <th class="text-center">Skor</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($model->clusters as $index => $cluster)
                                        @php
                                            $val = $scores[$index] ?? 0;
                                            $color = $val >= 3.0 ? 'success' : ($val >= 2.0 ? 'warning' : 'danger');
                                            $targetId = 'collapse-' . $cluster->id;
                                        @endphp

                                        <tr data-toggle="collapse" data-target="#{{ $targetId }}" aria-expanded="false"
                                            style="cursor: pointer;">
                                            <td class="pl-4 font-weight-bold text-gray-800">
                                                <i class="fas fa-chevron-down fa-xs text-gray-400 mr-2"></i>
                                                {{ $cluster->kode ?? '' }} {{ $cluster->nama ?? $labels[$index] }}
                                            </td>
                                            <td class="text-center">
                                                <span class="badge badge-{{ $color }} px-2 py-1"
                                                    style="min-width: 40px;">
                                                    {{ number_format($val, 2) }}
                                                </span>
                                            </td>
                                        </tr>

                                        <tr id="{{ $targetId }}" class="collapse bg-light"
                                            data-parent="#accordionKriteria">
                                            <td colspan="2" class="p-0 border-bottom">
                                                <div class="px-3 py-2">
                                                    <table class="table table-sm table-bordered m-0 text-xs">
                                                        <thead class="bg-white text-gray-700">
                                                            <tr>
                                                                <th>Butir Asesmen</th>
                                                                <th class="text-center" width="25%">Skor Akhir</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @forelse($cluster->indicators as $indicator)
                                                                @php
                                                                    $indScore = isset($detailScores[$indicator->id])
                                                                        ? $detailScores[$indicator->id]->final_score
                                                                        : 0;
                                                                @endphp
                                                                <tr>
                                                                    <td class="text-gray-800">
                                                                        @if (!empty($indicator->code))
                                                                            <strong>{{ $indicator->code }}</strong> -
                                                                        @else
                                                                            <span class="text-muted font-italic"
                                                                                style="font-size: 0.85em;">[Belum
                                                                                dikodekan]</span> -
                                                                        @endif

                                                                        <span
                                                                            title="{{ $indicator->description ?? 'Deskripsi tidak tersedia' }}"
                                                                            style="cursor: help; border-bottom: 1px dotted #a8a8a8;">
                                                                            {{ Str::limit($indicator->description ?? 'Deskripsi tidak tersedia', 60) }}
                                                                        </span>
                                                                    </td>
                                                                    <td class="text-center font-weight-bold text-primary">
                                                                        {{ number_format($indScore, 2) }}
                                                                    </td>
                                                                </tr>
                                                            @empty
                                                                <tr>
                                                                    <td colspan="2"
                                                                        class="text-center text-muted font-italic">Belum ada
                                                                        butir penilaian.</td>
                                                                </tr>
                                                            @endforelse
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- BAGIAN 3: LAPORAN RINGKASAN DETAIL (SUMMARY REPORT) --}}
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    <i class="fas fa-table mr-1"></i> Laporan Ringkasan Detail
                </h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover" width="100%" cellspacing="0">
                        <thead class="thead-dark">
                            <tr>
                                <th width="5%">No</th>
                                <th>Elemen / Kriteria Penilaian</th>
                                <th width="10%" class="text-center">Jml. Butir</th>
                                <th width="15%" class="text-center">Rata-rata Skor</th>
                                <th width="15%" class="text-center bg-primary text-white">Skor Terbobot</th>
                                <th width="20%" class="text-center">Predikat</th>
                                <th width="20%" class="text-center">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($labels as $index => $label)
                                @php
                                    $score = $scores[$index];
                                    $weighted = $weightedScores[$index];

                                    if ($score >= 3.5) {
                                        $predikat = 'Sangat Baik';
                                        $badge = 'success';
                                    } elseif ($score >= 3.0) {
                                        $predikat = 'Baik Sekali';
                                        $badge = 'primary';
                                    } elseif ($score >= 2.0) {
                                        $predikat = 'Baik';
                                        $badge = 'info';
                                    } else {
                                        $predikat = 'Kurang';
                                        $badge = 'danger';
                                    }
                                @endphp
                                <tr>
                                    <td class="text-center">{{ $index + 1 }}</td>
                                    <td class="font-weight-bold">{{ $label }}</td>
                                    <td class="text-center">{{ $clusterCounts[$index] }}</td>

                                    <td class="text-center font-weight-bold">
                                        {{ $score }}
                                    </td>

                                    <td class="text-center font-weight-bold text-primary bg-light"
                                        style="font-size: 1.1em;">
                                        {{ number_format($weighted, 2) }}
                                    </td>

                                    <td class="text-center">
                                        <span
                                            class="badge badge-{{ $badge }} px-2 py-1">{{ $predikat }}</span>
                                    </td>
                                    <td class="text-center">
                                        @if ($score < 2.0)
                                            <span class="text-danger font-weight-bold"><i
                                                    class="fas fa-exclamation-triangle"></i> Perbaiki</span>
                                        @else
                                            <span class="text-success"><i class="fas fa-check"></i> OK</span>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                        <tfoot class="bg-gray-200">
                            <tr>
                                <td colspan="4" class="text-right font-weight-bold text-uppercase">Total Keseluruhan:
                                </td>

                                <td class="text-center font-weight-bold text-white bg-success" style="font-size: 1.2em;">
                                    {{ number_format(array_sum($weightedScores), 2) }}
                                </td>

                                <td colspan="2"></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <div class="mt-3">
                    <button class="btn btn-secondary btn-sm" onclick="window.print()">
                        <i class="fas fa-print"></i> Cetak Laporan
                    </button>
                </div>
            </div>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        var ctx = document.getElementById("myRadarChart").getContext('2d');

        var labels = {!! json_encode($labels) !!};
        var dataScores = {!! json_encode($scores) !!};
        var maxScore = {{ $model->max_score ?? 4 }};

        var myRadarChart = new Chart(ctx, {
            type: 'radar',
            data: {
                labels: labels,
                datasets: [{
                        label: 'Capaian Saat Ini',
                        data: dataScores,
                        backgroundColor: "rgba(78, 115, 223, 0.2)",
                        borderColor: "rgba(78, 115, 223, 1)",
                        pointBackgroundColor: "rgba(78, 115, 223, 1)",
                        pointBorderColor: "#fff",
                        pointHoverBackgroundColor: "#fff",
                        pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                        borderWidth: 2
                    },
                    {
                        label: 'Target Ideal',
                        data: Array(labels.length).fill(maxScore),
                        backgroundColor: "transparent",
                        borderColor: "rgba(200, 200, 200, 0.5)",
                        pointRadius: 0,
                        borderDash: [5, 5],
                        borderWidth: 1
                    }
                ]
            },
            options: {
                maintainAspectRatio: false,
                scale: {
                    ticks: {
                        beginAtZero: true,
                        max: maxScore,
                        stepSize: 1,
                        backdropColor: 'transparent'
                    },
                    pointLabels: {
                        fontSize: 11,
                        fontStyle: "bold",
                        fontColor: "#6e707e"
                    }
                },
                tooltips: {
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    xPadding: 10,
                    yPadding: 10,
                    displayColors: true,
                    caretPadding: 10,
                    callbacks: {
                        label: function(tooltipItem, data) {
                            return data.datasets[tooltipItem.datasetIndex].label + ': ' + tooltipItem.yLabel;
                        }
                    }
                },
                legend: {
                    position: 'bottom',
                    labels: {
                        padding: 20,
                        boxWidth: 10
                    }
                }
            }
        });
    </script>
@endsection
