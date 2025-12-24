<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // 1. Jenis Akreditasi (SPAK, INFOKOM, WISATA)
        Schema::create('accreditation_models', function (Blueprint $table) {
            $table->id();
            $table->string('name', 50); // "LAM-INFOKOM"
            $table->integer('max_score')->default(4);
            $table->timestamps();
        });

        // 2. Pengelompokan (Klaster/Standar)
        // Menggantikan tabel 'standards' dan 'elements' lama
        Schema::create('assessment_clusters', function (Blueprint $table) {
            $table->id();
            $table->foreignId('model_id')->constrained('accreditation_models')->onDelete('cascade');
            $table->string('name', 255); // "C. Pendidikan"
            $table->string('code', 20)->nullable();
            $table->decimal('weight', 5, 2)->default(0);
            $table->integer('order_index')->default(0);
            $table->timestamps();
        });

        // 3. Butir / Indikator
        // Menggantikan tabel 'element_indicators' lama
        Schema::create('indicators', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cluster_id')->constrained('assessment_clusters')->onDelete('cascade');
            $table->string('code', 50); // "C.1.a"
            $table->text('description'); // Pertanyaan
            $table->enum('type', ['QUALITATIVE', 'QUANTITATIVE']);
            $table->string('calculation_code', 100)->nullable(); // Logic rumus (Strategy Pattern)
            $table->decimal('weight', 5, 2)->default(0);
            $table->timestamps();
        });

        // 4. Rubrik (Pilihan Jawaban Kualitatif)
        Schema::create('indicator_rubrics', function (Blueprint $table) {
            $table->id();
            $table->foreignId('indicator_id')->constrained('indicators')->onDelete('cascade');
            $table->integer('score_value'); // 0, 1, 2, 3, 4
            $table->text('description')->nullable(); // Penjelasan rubrik
            $table->timestamps();
        });

        // 5. Definisi Variabel Data Mentah (Input Angka)
        Schema::create('raw_data_variables', function (Blueprint $table) {
            $table->id();
            $table->string('code', 50)->unique();
            $table->string('name', 250);
            $table->text('description')->nullable();
            $table->enum('type', ['static', 'formula'])->default('static');
            $table->text('calculation_formula')->nullable(); 
            $table->timestamps();
        });

        // 6. Pivot Indikator ke Variabel
        Schema::create('indicator_variables', function (Blueprint $table) {
            $table->foreignId('indicator_id')->constrained('indicators')->onDelete('cascade');
            $table->foreignId('variable_id')->constrained('raw_data_variables')->onDelete('cascade');
            $table->primary(['indicator_id', 'variable_id']);
        });

        // 7. Nilai Data Mentah Prodi
        Schema::create('prodi_raw_values', function (Blueprint $table) {
            $table->id();

            // Relasi ke tabel 'prodis' LAMA Anda
            $table->foreignId('prodi_id')->constrained('prodis')->onDelete('cascade');

            $table->foreignId('variable_id')->constrained('raw_data_variables')->onDelete('cascade');
            $table->integer('year');
            $table->decimal('value', 12, 2)->default(0);
            $table->index(['prodi_id', 'variable_id', 'year']);
            $table->timestamps();
        });

        // 8. Skor Akhir & Bukti
        // Menggantikan tabel 'scores' lama
        Schema::create('assessment_scores', function (Blueprint $table) {
            $table->id();

            // Relasi ke tabel 'prodis' LAMA Anda
            $table->foreignId('prodi_id')->constrained('prodis')->onDelete('cascade');

            $table->foreignId('indicator_id')->constrained('indicators')->onDelete('cascade');
            $table->foreignId('selected_rubric_id')->nullable()->constrained('indicator_rubrics');

            $table->decimal('final_score', 5, 2);

            // --- Kolom Tambahan (Adaptasi dari PDF tabel 'scores' lama) ---
            $table->text('notes')->nullable(); // Catatan asesor
            $table->string('proof_file_url')->nullable(); // Upload file
            $table->string('proof_link')->nullable(); // Link GDrive dll
            $table->enum('status', ['DRAFT', 'SUBMITTED', 'VERIFIED', 'REJECTED'])->default('DRAFT');
            // -------------------------------------------------------------

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('assessment_scores');
        Schema::dropIfExists('prodi_raw_values');
        Schema::dropIfExists('indicator_variables');
        Schema::dropIfExists('raw_data_variables');
        Schema::dropIfExists('indicator_rubrics');
        Schema::dropIfExists('indicators');
        Schema::dropIfExists('assessment_clusters');
        Schema::dropIfExists('accreditation_models');
    }
};
