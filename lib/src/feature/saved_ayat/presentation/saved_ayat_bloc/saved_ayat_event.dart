part of 'saved_ayat_bloc.dart';

@immutable
abstract class SavedAyatEvent extends Equatable {
  const SavedAyatEvent();

  List<Object?> get props => [];
}

class OnSavedAyatEvent extends SavedAyatEvent {}

class AddSavedAyatEvent extends SavedAyatEvent {
  // final int idSurah;
  final SuratDetailModel surahDetailModel;
  final bool isSaved;

  const AddSavedAyatEvent({
    required this.surahDetailModel,
    required this.isSaved,
    // required this.idSurah,
  });
}
