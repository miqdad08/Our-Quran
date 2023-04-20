part of 'ayat_bloc.dart';

@immutable
abstract class AyatEvent extends Equatable {
  const AyatEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetAyatEvent extends AyatEvent {
  final int noSurat;

  const GetAyatEvent({required this.noSurat});
}
