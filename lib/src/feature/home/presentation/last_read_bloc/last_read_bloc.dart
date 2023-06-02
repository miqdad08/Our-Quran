import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../surah_detail/domain/model/ayat.dart';

part 'last_read_event.dart';
part 'last_read_state.dart';

class LastReadBloc extends Bloc<LastReadEvent, LastReadState> {
  LastReadBloc() : super(LastReadInitial()) {
    on<LastReadEvent>((event, emit) {
    });
  }
}
