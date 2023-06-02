part of 'last_read_bloc.dart';

@immutable
abstract class LastReadEvent {}

class OnLastReadEvent extends LastReadEvent {}

class AddLastReadEvent extends LastReadEvent {
  final Ayat ayat;

  AddLastReadEvent({required this.ayat});
}

class RemoveLastReadEvent extends LastReadEvent {
  final Ayat ayat;

  RemoveLastReadEvent({required this.ayat});
}
