import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/src/feature/all_surah/data/surah_service.dart';

import '../../domain/model/surat_model.dart';

part 'surat_state.dart';

class SuratCubit extends Cubit<SuratState> {
  SuratCubit(this.quranService) : super(SuratInitial());

  final SurahService quranService;

  void getAllSurat() async {
    emit(SuratLoading());
    final result = await quranService.getAllSurat();
    result.fold(
      (error) => emit(SuratError(message: error)),
      (data) => emit(SuratLoaded(listSurat: data)),
    );
  }
}
