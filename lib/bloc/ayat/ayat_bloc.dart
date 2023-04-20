import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/surat_detail_model.dart';
import '../../data/services/quran_service.dart';

part 'ayat_event.dart';

part 'ayat_state.dart';

class AyatBloc extends Bloc<AyatEvent, AyatState> {
  final QuranService quranService;

  AyatBloc(this.quranService) : super(AyatInitial()) {
    on<GetAyatEvent>((event, emit) async {
      emit(AyatLoading());
      final result = await quranService.getDetailSurat(event.noSurat);
      result.fold((error) => emit(AyatError(message: error)),
          (r) => emit(AyatLoaded(detail: r)));
    });
  }
}
