part of 'last_read_bloc.dart';

@immutable
abstract class LastReadState extends Equatable {

  const LastReadState();

  @override
  List<Object> get props => [];
}

class LastReadInitial extends LastReadState {}

class LastReadLoading extends LastReadState {}

class LastReadError extends LastReadState {}

class LastReadLoaded extends LastReadState {
  final bool lastRead;

  const LastReadLoaded({required this.lastRead});

  @override
  List<Object> get props => [lastRead];

}
