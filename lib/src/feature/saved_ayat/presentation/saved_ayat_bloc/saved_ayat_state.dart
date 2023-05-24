part of 'saved_ayat_bloc.dart';

@immutable
abstract class SavedAyatState extends Equatable {
  const SavedAyatState();

  @override
  List<Object> get props => [];
}

class SavedAyatInitial extends SavedAyatState {}

class SavedAyatLoading extends SavedAyatState {}

class SavedAyatLoaded extends SavedAyatState {
  final List<SuratDetailModel> listSavedAyat;
  final bool isSaved;

  const SavedAyatLoaded({required this.isSaved,
    required this.listSavedAyat,
  });

  @override
  // TODO: implement props
  List<Object> get props => [listSavedAyat, isSaved];
}
