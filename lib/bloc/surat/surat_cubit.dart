import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'surat_state.dart';

class SuratCubit extends Cubit<SuratState> {
  SuratCubit() : super(SuratInitial());
}
