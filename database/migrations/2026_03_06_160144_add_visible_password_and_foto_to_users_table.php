<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddVisiblePasswordAndFotoToUsersTable extends Migration
{
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            // Menambahkan kolom visible_password
            $table->string('visible_password')->nullable()->after('password');
            
            // Menambahkan kolom foto dengan tipe longText karena Base64 sangat panjang
            $table->longText('foto')->nullable()->after('visible_password');
        });
    }

    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            // Menghapus kolom jika di-rollback
            $table->dropColumn(['visible_password', 'foto']);
        });
    }
}