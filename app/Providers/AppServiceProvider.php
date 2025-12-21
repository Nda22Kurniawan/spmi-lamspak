<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View; // <--- Tambahkan ini
use Illuminate\Pagination\Paginator;
use App\Models\AccreditationModel; // <--- Tambahkan model ini

class AppServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        //
    }

    public function boot(): void
    {
        Paginator::useBootstrap(); // Jika Anda pakai pagination bootstrap

        // --- TAMBAHKAN KODE INI ---
        // Agar variabel $global_lams bisa dibaca di sidebar.blade.php
        try {
            $lams = AccreditationModel::all();
            View::share('global_lams', $lams);
        } catch (\Exception $e) {
            // Biar tidak error saat migrate pertama kali (saat tabel belum ada)
            View::share('global_lams', []);
        }
        // ---------------------------
    }
}