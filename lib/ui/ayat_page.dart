import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/ayat/ayat_cubit.dart';
import '../data/models/surat_model.dart';
import 'const.dart';

class AyatPage extends StatefulWidget {
  final SuratModel surat;

  const AyatPage({Key? key, required this.surat}) : super(key: key);

  @override
  State<AyatPage> createState() => _AyatPageState();
}

class _AyatPageState extends State<AyatPage> {
  @override
  void initState() {
    context.read<AyatCubit>().getDetailSurat(widget.surat.nomor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.surat.namaLatin}${widget.surat.nomor}',
        ),
      ),
      body: BlocBuilder<AyatCubit, AyatState>(
        builder: (context, state) {
          if (state is AyatLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AyatLoaded) {
            return ListView.builder(
                itemCount: state.detail.ayat!.length,
                itemBuilder: (context, index) {
                  final ayat = state.detail.ayat![index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: Text(
                          '${ayat.id}',
                          style: const TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      title: Text(
                        '${ayat.ar}',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${ayat.idn}',
                      ),
                    ),
                  );
                });
          }
          if (state is AyatError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(
            child: Text('No Data'),
          );
        },
      ),
    );
  }
}
