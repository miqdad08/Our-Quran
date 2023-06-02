import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/src/common/surah_item.dart';
import '../cubit/surat_cubit.dart';

class SuratPage extends StatefulWidget {
  const SuratPage({Key? key}) : super(key: key);

  @override
  State<SuratPage> createState() => _SuratPageState();
}

class _SuratPageState extends State<SuratPage> {
  @override
  void initState() {
    context.read<SuratCubit>().getAllSurat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuratCubit, SuratState>(
      builder: (context, state) {
        if (state is SuratLoading) {
          //adaptive untuk tampilan di IOS
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is SuratLoaded) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final surat = state.listSurat[index];
              return SurahItem(
                surah: surat,
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: const Color(0xFF7B80AD).withOpacity(.35),
            ),
            itemCount: state.listSurat.length,
          );
        }
        if (state is SuratError) {
          print(state.message);
          return Center(
            child: Text(state.message),
          );
        }
        return const Center(
          child: Text(
            'Data tidak ditemukan',
          ),
        );
      },
    );
  }
}
