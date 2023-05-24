part of 'ayat_cubit.dart';

abstract class AyatState extends Equatable {
  const AyatState();

  @override
  List<Object> get props => [];
}

class AyatInitial extends AyatState {}

class IndexAyatLoading extends AyatState {}


class IndexAyatLoaded extends AyatState {
  final int indexAyat;

  const IndexAyatLoaded({required this.indexAyat});

  @override
  List<Object> get props => [indexAyat];
}
