import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ayat_state.dart';

class AyatCubit extends Cubit<AyatState> {
  AyatCubit() : super(AyatInitial());

  void getIndexAyat(int indexAyat) async {
    emit(IndexAyatLoading());
    emit(
      IndexAyatLoaded(indexAyat: indexAyat),
    );
  }
}
