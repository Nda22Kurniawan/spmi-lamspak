@extends('template.HomeView', ['title' => "Diagram Pencapaian"])

@section('content')
<main id="main">

    <section>
        <div class="container">

            <div class="section-title">
                <h2>Diagram Pencapaian</h2>
                <p>Berikut ini adalah diagram pencapaian nilai asessmen setiap Program Studi di FTIK</p>
            </div>

            <div class="row border p-4 shadow-sm rounded">
                <div class="col">
                    {{-- Tambahkan wrapper dengan height agar grafik responsif dan tidak kebesaran --}}
                    <div style="height: 400px; width: 100%;">
                        <canvas id="barChart"></canvas>
                    </div>
                    <div class="mt-3 text-center small text-muted font-italic">
                        * Arahkan kursor dan klik pada batang grafik untuk melihat detail laporan mutu Program Studi.
                    </div>
                </div>
            </div>

        </div>
    </section>
    </main>
@endsection

@section('script')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById('barChart').getContext('2d');

    const labelsProdi = {!! json_encode($daftarProdi ?? []) !!};
    const dataSkor = {!! json_encode($skorTotalProdi ?? []) !!};
    const linksProdi = {!! json_encode($linkProdi ?? []) !!};

    const myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labelsProdi,
            datasets: [{
                label: 'Nilai Assesmen Terbobot',
                data: dataSkor,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.7)',
                    'rgba(54, 162, 235, 0.7)',
                    'rgba(255, 205, 86, 0.7)',
                    'rgba(75, 192, 192, 0.7)',
                    'rgba(153, 102, 255, 0.7)'
                ],
                borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(153, 102, 255)'
                ],
                borderWidth: 1,
                borderRadius: 4 
            }]
        },
        options: {
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: true,
                }
            },
            plugins: {
                legend: {
                    display: false 
                }
            },
            onClick: (e, activeElements) => {
                if (activeElements.length > 0) {
                    const dataIndex = activeElements[0].index;
                    const url = linksProdi[dataIndex];
                    if(url) {
                        window.location.href = url; 
                    }
                }
            },
            onHover: (event, chartElement) => {
                event.native.target.style.cursor = chartElement[0] ? 'pointer' : 'default';
            }
        }
    });
</script>
@endsection