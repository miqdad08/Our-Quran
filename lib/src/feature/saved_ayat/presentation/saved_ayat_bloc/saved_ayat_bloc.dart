import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myquran/src/feature/saved_ayat/data/data_ayat_local.dart';

import '../../../surah_detail/domain/model/ayat.dart';

part 'saved_ayat_event.dart';

part 'saved_ayat_state.dart';

class SavedAyatBloc extends Bloc<SavedAyatEvent, SavedAyatState> {
  SavedAyatBloc() : super(SavedAyatInitial()) {
    on<OnSavedAyatEvent>((event, emit) async {
      emit(SavedAyatLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(
        SavedAyatLoaded(
          listSavedAyat: DataAyatLocal.listDataSavedAyatLocal,
          isSaved: false,
        ),
      );
    });

    on<RemoveSavedAyatEvent>((event, emit){
      emit(SavedAyatLoading());
      SavedAyatLocal.savedAyatRemove();
      DataAyatLocal.listDataSavedAyatLocal.remove(event.ayat);
      print(DataAyatLocal.listDataSavedAyatLocal.remove(event.ayat));
      emit(SavedAyatLoaded(
        listSavedAyat: DataAyatLocal.listDataSavedAyatLocal,
        isSaved: false,
      ));
    });

    on<AddSavedAyatEvent>((event, emit) {
      emit(SavedAyatLoading());
      DataAyatLocal.listDataSavedAyatLocal.add(event.ayat);
      emit(
        SavedAyatLoaded(
          listSavedAyat: DataAyatLocal.listDataSavedAyatLocal,
          isSaved: event.isSaved,
        ),
      );
    });
  }
}
