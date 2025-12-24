<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('indicators', function (Blueprint $table) {
            // Kolom untuk menyimpan rumus, misal: "(A / B) * 100"
            $table->text('custom_formula')->nullable()->after('calculation_code');
        });
    }

    public function down()
    {
        Schema::table('indicators', function (Blueprint $table) {
            $table->dropColumn('custom_formula');
        });
    }
};
