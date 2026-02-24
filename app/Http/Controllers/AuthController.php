<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function index()
    {
        if (Auth::check()) {
            return redirect()->route('dashboard');
        }
        return view('auth.index');
    }

    public function proses(Request $request)
    {
        // 1. Validasi Input
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        $credentials = $request->only('email', 'password');

        // 2. Proses Login Otomatis Laravel (lebih ringkas & aman)
        // Attempt akan otomatis mencari user by email & hash check password
        if (Auth::attempt($credentials)) {
            $request->session()->regenerate(); // Mencegah Session Fixation

            return redirect()->intended('dashboard'); // Redirect ke dashboard atau halaman yang tadi mau diakses
        }

        // 3. Jika Gagal (Pesan Error Generik)
        return back()->with('pesan', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong>Login Gagal!</strong> Email atau password salah.
        </div>');
    }

    public function logout(Request $request)
    {
        Auth::logout();
        
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('login')->with('pesan', '<div class="alert alert-info alert-dismissible fade show" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong>Logout berhasil !!!</strong>
        </div>');
    }
}