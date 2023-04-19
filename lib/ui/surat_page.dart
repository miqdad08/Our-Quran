import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/cubit/surat/surat_cubit.dart';
import 'package:myquran/ui/ayat_page.dart';
import 'package:myquran/ui/const.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Surat'),
      ),
      body: BlocBuilder<SuratCubit, SuratState>(
        builder: (context, state) {
          if (state is SuratLoading) {
            //adaptive untuk tampilan di IOS
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is SuratLoaded) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final surat = state.listSurat[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AyatPage(
                            surat: surat,
                          );
                        },
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: Text(
                          '${surat.nomor}',
                          style: const TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      title: Text(
                        '${surat.namaLatin},${surat.nama}',
                      ),
                      subtitle: Text(
                        '${surat.arti}, ${surat.jumlahAyat} Ayat',
                      ),
                    ),
                  ),
                );
              },
              itemCount: state.listSurat.length,
            );
          }
          if (state is SuratError) {
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
      ),
    );
  }
}
