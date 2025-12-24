<div class="modal fade" id="editModal{{ $rubric->id }}" tabindex="-1" role="dialog" aria-labelledby="editModalLabel{{ $rubric->id }}" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h5 class="modal-title text-white" id="editModalLabel{{ $rubric->id }}">Edit Rubrik Penilaian</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <form action="{{ route('rubrics.update', $rubric->id) }}" method="POST">
                @csrf
                @method('PUT')
                
                <div class="modal-body">
                    {{-- Info Indikator (Read Only) --}}
                    <div class="form-group">
                        <label class="font-weight-bold">Indikator</label>
                        <input type="text" class="form-control bg-light" 
                               value="{{ $rubric->indicator->code }} - {{ $rubric->indicator->name }}" 
                               readonly>
                    </div>

                    {{-- Edit Skor --}}
                    <div class="form-group">
                        <label class="font-weight-bold">Nilai Skor</label>
                        <select name="score_value" class="form-control" required>
                            @foreach([4, 3, 2, 1, 0] as $score)
                                <option value="{{ $score }}" {{ $rubric->score_value == $score ? 'selected' : '' }}>
                                    {{ $score }} 
                                    @if($score==4) (Sangat Baik) 
                                    @elseif($score==3) (Baik)
                                    @elseif($score==2) (Cukup)
                                    @elseif($score==1) (Kurang)
                                    @else (Sangat Kurang)
                                    @endif
                                </option>
                            @endforeach
                        </select>
                    </div>

                    {{-- Edit Deskripsi --}}
                    <div class="form-group">
                        <label class="font-weight-bold">Deskripsi Penilaian</label>
                        <textarea name="description" class="form-control" rows="6" required>{{ $rubric->description }}</textarea>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-warning">Update Perubahan</button>
                </div>
            </form>
        </div>
    </div>
</div>