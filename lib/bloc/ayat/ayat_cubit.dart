import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myquran/data/models/surat_detail_model.dart';
import 'package:myquran/data/services/quran_service.dart';

part 'ayat_state.dart';

class AyatCubit extends Cubit<AyatState> {
  AyatCubit(this.quranService) : super(AyatInitial());

  final QuranService quranService;

  void getDetailSurat(int noSurat) async {
    emit(AyatLoading());
    final result = await quranService.getDetailSurat(noSurat);
    result.fold(
        (error) => emit(AyatError(message: error)), (r) => emit(AyatLoaded(detail: r)));
  }
}
