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
        Schema::table('raw_data_variables', function (Blueprint $table) {
            $table->foreignId('model_id')->nullable()->after('id')
                ->constrained('accreditation_models')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::table('raw_data_variables', function (Blueprint $table) {
            $table->dropForeign(['model_id']);
            $table->dropColumn('model_id');
        });
    }
};
