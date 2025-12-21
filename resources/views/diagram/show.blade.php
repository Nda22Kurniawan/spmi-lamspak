@extends('template.BaseView')

@section('content')
<div class="container-fluid">
    
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Capaian Mutu: {{ $prodi->name }}</h1>
        <a href="{{ route('diagram.index') }}" class="btn btn-sm btn-secondary shadow-sm">
            <i class="fas fa-arrow-left fa-sm text-white-50"></i> Kembali
        </a>
    </div>

    <div class="row">
        
        <div class="col-lg-8">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Radar Chart (Spider Chart)</h6>
                </div>
                <div class="card-body">
                    <div class="chart-area" style="height: 450px;">
                        <canvas id="myRadarChart"></canvas>
                    </div>
                    <div class="mt-4 text-center small text-muted">
                        * Grafik menunjukkan rata-rata capaian skor indikator pada setiap klaster.
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Detail Skor Per Klaster</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-sm">
                            <thead class="thead-light">
                                <tr>
                                    <th>Klaster / Kriteria</th>
                                    <th class="text-center">Skor</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($labels as $index => $label)
                                <tr>
                                    <td>{{ $label }}</td>
                                    <td class="text-center font-weight-bold">
                                        @php $val = $scores[$index]; @endphp
                                        
                                        @if($val >= 3.0)
                                            <span class="badge badge-success">{{ $val }}</span>
                                        @elseif($val >= 2.0)
                                            <span class="badge badge-warning">{{ $val }}</span>
                                        @else
                                            <span class="badge badge-danger">{{ $val }}</span>
                                        @endif
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                            <tfoot>
                                <tr class="bg-gray-100">
                                    <td class="font-weight-bold">Rata-rata Total</td>
                                    <td class="text-center font-weight-bold">
                                        {{ count($scores) > 0 ? round(array_sum($scores) / count($scores), 2) : 0 }}
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    var ctx = document.getElementById("myRadarChart").getContext('2d');
    
    // Data dari Controller
    var labels = {!! json_encode($labels) !!};
    var dataScores = {!! json_encode($scores) !!};
    var maxScore = {{ $model->max_score }};

    var myRadarChart = new Chart(ctx, {
        type: 'radar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Capaian Saat Ini',
                data: dataScores,
                backgroundColor: "rgba(78, 115, 223, 0.4)", // Warna Isi (Biru Transparan)
                borderColor: "rgba(78, 115, 223, 1)",      // Warna Garis
                pointBackgroundColor: "rgba(78, 115, 223, 1)",
                pointBorderColor: "#fff",
                pointHoverBackgroundColor: "#fff",
                pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                borderWidth: 2
            },
            {
                label: 'Target Maksimal (' + maxScore + ')',
                data: Array(labels.length).fill(maxScore), // Garis Target Luar
                backgroundColor: "rgba(200, 200, 200, 0)", // Transparan
                borderColor: "rgba(200, 200, 200, 0.5)",   // Abu-abu tipis
                pointRadius: 0,
                borderDash: [5, 5], // Garis putus-putus
                borderWidth: 1
            }]
        },
        options: {
            maintainAspectRatio: false,
            scale: {
                ticks: {
                    beginAtZero: true,
                    max: maxScore, // Batas atas grafik sesuai Max Score LAM
                    stepSize: 1,   // Kelipatan angka (0, 1, 2, 3, 4)
                    backdropColor: 'transparent' // Hilangkan background kotak pada angka
                },
                pointLabels: {
                    fontSize: 12,
                    fontStyle: "bold"
                }
            },
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                caretPadding: 10,
            },
            legend: {
                position: 'bottom'
            }
        }
    });
</script>
@endsection