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
        Schema::table('prodis', function (Blueprint $table) {
            // Default 1 (misal LAM-INFOKOM) atau nullable
            $table->foreignId('accreditation_model_id')->nullable()
                ->constrained('accreditation_models')->onDelete('set null');
        });
    }

    public function down()
    {
        Schema::table('prodis', function (Blueprint $table) {
            $table->dropForeign(['accreditation_model_id']);
            $table->dropColumn('accreditation_model_id');
        });
    }
};
