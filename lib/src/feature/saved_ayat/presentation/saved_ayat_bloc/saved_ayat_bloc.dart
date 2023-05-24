import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myquran/src/feature/saved_ayat/data/data_ayat_local.dart';

import '../../../surah_detail/domain/model/surat_detail_model.dart';

part 'saved_ayat_event.dart';
part 'saved_ayat_state.dart';

class SavedAyatBloc extends Bloc<SavedAyatEvent, SavedAyatState> {

  SavedAyatBloc() : super(SavedAyatInitial()) {

    on<OnSavedAyatEvent>((event, emit) async {
      emit(SavedAyatLoading());
      await Future.delayed(Duration(seconds: 1));
      emit(const SavedAyatLoaded(listSavedAyat: [], isSaved: false));
    });

    on<AddSavedAyatEvent>((event, emit) {
      emit(SavedAyatLoading());
      // DataAyatLocal.setSavedAyat(event.surahDetailModel);
      // SavedAyatLocal.setSavedAyatLocal(event.isSaved);
      // List<SuratDetailModel> savedDataLocal;
      // List<SuratDetailModel> suratDetailModel = DataAyatLocal.listDataSavedAyatLocal;
      DataAyatLocal.listDataSavedAyatLocal.add(event.surahDetailModel);
      emit(
        SavedAyatLoaded(
          listSavedAyat: DataAyatLocal.listDataSavedAyatLocal, isSaved: event.isSaved,
        ),
      );
    });
  }
}
