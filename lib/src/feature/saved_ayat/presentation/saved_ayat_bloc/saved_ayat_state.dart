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
  final List<SavedAyat> savedAyat;

  const SavedAyatLoaded({
    required this.savedAyat,
  });

  @override
  // TODO: implement props
  List<Object> get props => [savedAyat];
}

class SavedAyatError extends SavedAyatState {
  final String message;

  const SavedAyatError({required this.message});

  @override
  List<Object> get props => [message];
}