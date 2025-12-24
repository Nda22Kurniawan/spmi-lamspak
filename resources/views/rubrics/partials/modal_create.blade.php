<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addModalLabel">Tambah Rubrik Penilaian</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            
            <form action="{{ route('rubrics.store') }}" method="POST">
                @csrf
                <div class="modal-body">
                    {{-- Input Indikator --}}
                    <div class="form-group">
                        <label for="selectIndicator" class="font-weight-bold">Pilih Indikator</label>
                        <select name="indicator_id" id="selectIndicator" class="form-control" required>
                            <option value="">-- Pilih Indikator --</option>
                            @foreach($all_indicators as $ind)
                                <option value="{{ $ind->id }}">
                                    {{ $ind->code }} - {{ \Illuminate\Support\Str::limit($ind->name, 50) }}
                                </option>
                            @endforeach
                        </select>
                        <small class="text-muted">Hanya indikator di halaman ini yang muncul.</small>
                    </div>

                    {{-- Input Nilai Skor --}}
                    <div class="form-group">
                        <label class="font-weight-bold">Nilai Skor</label>
                        <select name="score_value" class="form-control" required>
                            <option value="4">4 (Sangat Baik)</option>
                            <option value="3">3 (Baik)</option>
                            <option value="2">2 (Cukup)</option>
                            <option value="1">1 (Kurang)</option>
                            <option value="0">0 (Sangat Kurang)</option>
                        </select>
                    </div>

                    {{-- Input Deskripsi --}}
                    <div class="form-group">
                        <label class="font-weight-bold">Deskripsi Penilaian</label>
                        <textarea name="description" class="form-control" rows="5" placeholder="Contoh: Dokumen lengkap, valid, dan linier..." required></textarea>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>