import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/src/feature/saved_ayat/presentation/saved_ayat_bloc/saved_ayat_bloc.dart';
import '../../../../const/app_color.dart';
import '../../../home/presentation/widget/app_bar_home.dart';
import '../../../surah_detail/presentation/widget/ayat_item.dart';

class SavedAyatPage extends StatefulWidget {
  const SavedAyatPage({Key? key}) : super(key: key);

  @override
  State<SavedAyatPage> createState() => _SavedAyatPageState();
}

class _SavedAyatPageState extends State<SavedAyatPage> {
  @override
  void initState() {
    super.initState();
    context.read<SavedAyatBloc>().add(OnSavedAyatEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppBarHomeWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: BlocBuilder<SavedAyatBloc, SavedAyatState>(
            builder: (context, state) {
          if (state is SavedAyatLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is SavedAyatLoaded) {
            var savedAyat = state.listSavedAyat;
            return savedAyat.isEmpty
                ? const Center(
                    child: Text(
                      'No Ayat Saved',
                      style: TextStyle(
                        color: AppColors.text,
                        fontSize: 16,
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: savedAyat.length,
                    itemBuilder: (context, index) {
                      return AyatItem(
                        ontap: () {
                          context.read<SavedAyatBloc>().add(
                                RemoveSavedAyatEvent(ayat: savedAyat[index]),
                              );
                        },
                        ayat: savedAyat[index],
                        isSaved: true,
                      );
                    },
                  );
          }
          return Container();
        }),
      ),
    );
  }
}
