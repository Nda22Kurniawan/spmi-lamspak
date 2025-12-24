@extends('template.BaseView')

@section('content')
<div class="container-fluid">
    
    {{-- Header --}}
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Laporan Capaian Mutu: {{ $prodi->name }}</h1>
        <a href="{{ route('assessment.pilih_prodi') }}" class="btn btn-sm btn-secondary shadow-sm">
            <i class="fas fa-arrow-left fa-sm text-white-50"></i> Kembali ke Pilih Prodi
        </a>
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
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Skor Rata-rata</div>
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
                                {{-- Menjumlahkan semua weighted score dari controller --}}
                                {{ number_format(array_sum($weightedScores), 2) }}
                            </div>
                        </div>
                        <div class="col-auto">
                            {{-- Icon Piala/Award untuk Skor Akhir --}}
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

        {{-- BAGIAN 2: RINGKASAN SKOR PER KLASTER (Simple Table) --}}
        <div class="col-lg-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Skor Per Kriteria</h6>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped table-borderless mb-0">
                            <thead class="bg-gray-200 text-gray-900">
                                <tr>
                                    <th class="pl-4">Kriteria</th>
                                    <th class="text-center">Skor</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($labels as $index => $label)
                                @php 
                                    $val = $scores[$index]; 
                                    $color = $val >= 3.0 ? 'success' : ($val >= 2.0 ? 'warning' : 'danger');
                                @endphp
                                <tr>
                                    <td class="pl-4 font-weight-bold">{{ $label }}</td>
                                    <td class="text-center">
                                        <span class="badge badge-{{ $color }} px-2 py-1" style="min-width: 40px;">
                                            {{ $val }}
                                        </span>
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
                        <th width="15%" class="text-center bg-primary text-white">Skor Terbobot</th> {{-- KOLOM BARU --}}
                        <th width="20%" class="text-center">Predikat</th>
                        <th width="20%" class="text-center">Status</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($labels as $index => $label)
                    @php
                        $score = $scores[$index];         // Rata-rata
                        $weighted = $weightedScores[$index]; // Skor Terbobot
                        
                        // Logika Predikat Visual
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
                        
                        {{-- Rata-rata Skor --}}
                        <td class="text-center font-weight-bold">
                            {{ $score }}
                        </td>

                        {{-- [BARU] Skor Terbobot --}}
                        <td class="text-center font-weight-bold text-primary bg-light" style="font-size: 1.1em;">
                            {{ number_format($weighted, 2) }}
                        </td>

                        <td class="text-center">
                            <span class="badge badge-{{ $badge }} px-2 py-1">{{ $predikat }}</span>
                        </td>
                        <td class="text-center">
                            @if($score < 2.0) 
                                <span class="text-danger font-weight-bold"><i class="fas fa-exclamation-triangle"></i> Perbaiki</span>
                            @else
                                <span class="text-success"><i class="fas fa-check"></i> OK</span>
                            @endif
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot class="bg-gray-200">
                    <tr>
                        <td colspan="4" class="text-right font-weight-bold text-uppercase">Total Keseluruhan:</td>
                        
                        {{-- Total Skor Terbobot (Akumulasi) --}}
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

{{-- SCRIPT CHART JS --}}
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    var ctx = document.getElementById("myRadarChart").getContext('2d');
    
    // Data dari Controller
    var labels = {!! json_encode($labels) !!};
    var dataScores = {!! json_encode($scores) !!};
    var maxScore = {{ $model->max_score ?? 4 }}; // Default 4 jika null

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
            }]
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
                    fontSize: 11, // Ukuran font label biar muat
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