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

    // Mengambil data yang dikirim dari method pencapaian() di Controller
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
                borderRadius: 4 // Membuat sudut atas batang sedikit melengkung
            }]
        },
        options: {
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: true,
                    // max: 4.0, // Hilangkan komentar jika ingin mematok nilai maksimal sumbu Y
                }
            },
            plugins: {
                legend: {
                    display: false // Disembunyikan karena label di bawah sudah mewakili nama Prodi
                }
            },
            // Fitur klik bawaan Chart.js (Menggantikan fungsi clickableScale yang rumit)
            onClick: (e, activeElements) => {
                if (activeElements.length > 0) {
                    const dataIndex = activeElements[0].index;
                    const url = linksProdi[dataIndex];
                    if(url) {
                        window.location.href = url; // Pindah ke halaman detail
                    }
                }
            },
            // Mengubah kursor panah menjadi bentuk tangan (pointer) saat menyorot batang grafik
            onHover: (event, chartElement) => {
                event.native.target.style.cursor = chartElement[0] ? 'pointer' : 'default';
            }
        }
    });
</script>
@endsection