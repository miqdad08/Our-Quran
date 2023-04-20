import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myquran/src/feature/surah_detail/data/surah_detail_service.dart';

import '../../domain/model/surat_detail_model.dart';

part 'ayat_event.dart';

part 'ayat_state.dart';

class AyatBloc extends Bloc<AyatEvent, AyatState> {
  final SurahDetailService surahDetailService;

  AyatBloc(this.surahDetailService) : super(AyatInitial()) {
    on<GetAyatEvent>((event, emit) async {
      emit(AyatLoading());
      final result = await surahDetailService.getDetailSurat(event.noSurat);
      result.fold((error) => emit(AyatError(message: error)),
          (r) => emit(AyatLoaded(detail: r)));
    });
  }
}
