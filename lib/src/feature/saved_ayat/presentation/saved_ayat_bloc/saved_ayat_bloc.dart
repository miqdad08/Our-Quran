import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myquran/src/feature/surah_detail/domain/model/surat_detail_model.dart';

import '../../../surah_detail/domain/model/ayat.dart';
import '../../data/db/database_manager.dart';
import '../../domain/saved_ayat.dart';

part 'saved_ayat_event.dart';

part 'saved_ayat_state.dart';

class SavedAyatBloc extends Bloc<SavedAyatEvent, SavedAyatState> {
  DataBaseManager database = DataBaseManager.instance;
  SuratDetailModel surat = SuratDetailModel();

  List<SavedAyat> _listDataSavedAyatLocal = [];

  List<SavedAyat> get listDataSavedAyatLocal => _listDataSavedAyatLocal;

  SavedAyatBloc() : super(SavedAyatInitial()) {
    on<OnSavedAyatEvent>(
      (event, emit) async {
        emit(SavedAyatLoading());
        await Future.delayed(const Duration(seconds: 1));
        // database.clearBookmark();
        final result = await database.getBookmarks();
        result.fold(
          (error) {
            emit(SavedAyatError(message: error));
          },
          (data) {
            print(data);
            _listDataSavedAyatLocal = data;
            emit(
              SavedAyatLoaded(
                savedAyat: _listDataSavedAyatLocal,
              ),
            );
          },
        );
      },
    );

    on<RemoveSavedAyatEvent>(
      (event, emit) async {
        // emit(SavedAyatLoading());
        await database.removeBookmark(event.id);
        final result = await database.getBookmarks();
        result.fold(
          (error) {
            emit(SavedAyatError(message: error));
          },
          (data) {
            _listDataSavedAyatLocal = data;
            emit(
              SavedAyatLoaded(
                savedAyat: _listDataSavedAyatLocal,
              ),
            );
          },
        );
      },
    );

    on<AddSavedAyatEvent>(
      (event, emit) async {
        final insertAyat = await database.insertAyat(
          SavedAyat(
            id: event.ayat.id.toString(),
            surah: event.surah,
            ayat: event.ayat.nomor!,
            indexAyat: event.indexAyat,
            lastRead: event.lastRead ? 1 : 0,
            ayatText: event.ayat.ar!,
            ayatTranslate: event.ayat.idn!,
          ),
        );
        insertAyat.fold(
          (error) {
            emit(SavedAyatError(message: error));
          },
          (r) {
            emit(
              SavedAyatLoaded(
                savedAyat: _listDataSavedAyatLocal,
              ),
            );
          },
        );
      },
    );
  }
}
