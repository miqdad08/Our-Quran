part of 'saved_ayat_bloc.dart';

@immutable
abstract class SavedAyatEvent extends Equatable {
  const SavedAyatEvent();

  @override
  List<Object?> get props => [];
}

class OnSavedAyatEvent extends SavedAyatEvent {}



class AddSavedAyatEvent extends SavedAyatEvent {
  final Ayat ayat;
  final String surah;
  final int indexAyat;
  final bool lastRead;

  const AddSavedAyatEvent({
    required this.surah,
    required this.indexAyat,
    required this.lastRead,
    required this.ayat,
    // required this.idSurah,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [ayat,indexAyat,lastRead, surah];
}

class RemoveSavedAyatEvent extends SavedAyatEvent {
  final String id;

  const RemoveSavedAyatEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

