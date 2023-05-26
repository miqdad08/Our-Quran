part of 'saved_ayat_bloc.dart';

@immutable
abstract class SavedAyatEvent extends Equatable {
  const SavedAyatEvent();

  List<Object?> get props => [];
}

class OnSavedAyatEvent extends SavedAyatEvent {}

class AddSavedAyatEvent extends SavedAyatEvent {
  // final int idSurah;
  final Ayat ayat;
  final bool isSaved;

  const AddSavedAyatEvent({
    required this.ayat,
    required this.isSaved,
    // required this.idSurah,
  });
}

class RemoveSavedAyatEvent extends SavedAyatEvent{
  final Ayat ayat;

  const RemoveSavedAyatEvent({required this.ayat});
}
