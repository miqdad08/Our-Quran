import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ayat_event.dart';
part 'ayat_state.dart';

class AyatBloc extends Bloc<AyatEvent, AyatState> {
  AyatBloc() : super(AyatInitial()) {
    on<AyatEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
