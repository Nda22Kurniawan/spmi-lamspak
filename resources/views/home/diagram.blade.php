@extends('template.HomeView')

@section('content')
<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Capaian Mutu: {{ $prodi->name }}</h1>
    <p class="mb-4">Instrumen: <strong>{{ $model->name }}</strong></p>

    <div class="row">
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Radar Chart Per Klaster</h6>
                </div>
                <div class="card-body">
                    <div class="chart-area" style="height: 400px;">
                        <canvas id="myRadarChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Detail Capaian</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-sm table-bordered">
                            <thead>
                                <tr>
                                    <th>Klaster</th>
                                    <th>Skor</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($labels as $index => $label)
                                <tr>
                                    <td>{{ $label }}</td>
                                    <td class="font-weight-bold 
                                        {{ $dataScores[$index] > 3 ? 'text-success' : 'text-warning' }}">
                                        {{ $dataScores[$index] }}
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
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    var ctx = document.getElementById("myRadarChart");
    var myRadarChart = new Chart(ctx, {
        type: 'radar',
        data: {
            labels: {!! json_encode($labels) !!},
            datasets: [{
                label: 'Capaian Prodi {{ $prodi->kode }}',
                data: {!! json_encode($dataScores) !!},
                backgroundColor: "rgba(78, 115, 223, 0.2)",
                borderColor: "rgba(78, 115, 223, 1)",
                pointBackgroundColor: "rgba(78, 115, 223, 1)",
                pointBorderColor: "#fff",
                pointHoverBackgroundColor: "#fff",
                pointHoverBorderColor: "rgba(78, 115, 223, 1)",
            }, {
                label: 'Target Maksimal',
                data: {!! json_encode($maxScores) !!}, // Garis 4.0
                fill: false,
                borderColor: "rgba(200, 200, 200, 0.5)",
                pointRadius: 0,
                borderDash: [5, 5]
            }]
        },
        options: {
            maintainAspectRatio: false,
            scale: {
                ticks: {
                    beginAtZero: true,
                    max: {{ $model->max_score }},
                    stepSize: 1
                }
            }
        }
    });
</script>
@endsection