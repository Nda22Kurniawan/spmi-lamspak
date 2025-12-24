<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('assessment_scores', function (Blueprint $table) {
            // Kita hanya menambah kolom untuk hasil perkalian (Nilai x Bobot)
            $table->decimal('weighted_score', 10, 2)->default(0)->after('final_score');
        });
    }

    public function down(): void
    {
        Schema::table('assessment_scores', function (Blueprint $table) {
            $table->dropColumn('weighted_score');
        });
    }
};