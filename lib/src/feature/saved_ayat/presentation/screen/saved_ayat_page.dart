import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/src/common/saved_ayat_widget.dart';
import 'package:myquran/src/feature/saved_ayat/presentation/saved_ayat_bloc/saved_ayat_bloc.dart';
import '../../../../const/app_color.dart';
import '../../../home/presentation/widget/app_bar_home.dart';

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
            var savedAyat = state.savedAyat;
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
                : ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: const Color(0xFF7B80AD).withOpacity(.35),
                    ),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: savedAyat.length,
                    itemBuilder: (context, index) {
                      return SavedAyatWidget(
                        onTap: () {
                          context.read<SavedAyatBloc>().add(
                                RemoveSavedAyatEvent(
                                  id: savedAyat[index].id,
                                ),
                              );
                        },
                        savedAyat: state.savedAyat[index],
                        index: index,
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
