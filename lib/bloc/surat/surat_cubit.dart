import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/data/services/quran_service.dart';
import '../../data/models/surat_model.dart';

part 'surat_state.dart';

class SuratCubit extends Cubit<SuratState> {
  SuratCubit(this.quranService) : super(SuratInitial());

  final QuranService quranService;

  void getAllSurat() async {
    emit(SuratLoading());
    final result = await quranService.getAllSurat();
    result.fold(
      (error) => emit(SuratError(message: error)),
      (data) => emit(SuratLoaded(listSurat: data)),
    );
  }
}
