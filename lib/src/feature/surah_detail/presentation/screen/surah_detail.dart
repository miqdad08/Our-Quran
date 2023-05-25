import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/src/feature/surah_detail/presentation/widget/appbar_detail_widget.dart';
import 'package:myquran/src/feature/surah_detail/presentation/widget/ayat_item.dart';
import 'package:myquran/src/feature/surah_detail/presentation/widget/detail_banner_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../../const/app_color.dart';
import '../../../all_surah/domain/model/surat_model.dart';
import '../bloc/ayat_bloc.dart';

class SurahDetailPage extends StatefulWidget {
  static const String routeName = '/surah-detail-page';
  final SuratModel surat;


  const SurahDetailPage({Key? key, required this.surat}) : super(key: key);

  @override
  State<SurahDetailPage> createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  @override
  void initState() {
    // context.read<AyatCubit>().getDetailSurat(widget.surat.nomor);
    context.read<AyatBloc>().add(GetAyatEvent(noSurat: widget.surat.nomor));
    super.initState();
  }

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  final TextEditingController searchAyatController = TextEditingController();

  @override
  void dispose() {
    searchAyatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarDetailWidget(
        surah: widget.surat.namaLatin, controller: searchAyatController, itemScrollController: itemScrollController,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: DetailBannerWidget(
              ayatSurat: widget.surat,
            ),
          )
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocBuilder<AyatBloc, AyatState>(
            builder: (context, state) {
              if (state is AyatLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is AyatError) {
                return Scaffold(
                  body: Center(
                    child: Text(state.message),
                  ),
                );
              }
              if (state is AyatLoaded) {
                var ayatSurat = state.detail;
                return ListView(
                  children: [
                    Expanded(
                      child: ScrollablePositionedList.builder(
                        shrinkWrap: true,
                        itemCount: ayatSurat.jumlahAyat! + (ayatSurat.nomor == 1 ? -1 : 0),
                        itemScrollController: itemScrollController,
                        itemPositionsListener: itemPositionsListener,
                        itemBuilder: (context, index) {
                          return AyatItem(
                            detail: ayatSurat,
                            index: index,
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: Text('No Data Exist'),
              );
            },
          ),
        ),
      ),
    );
  }
}

// _ayatItem(
//     ayat: surat.ayat!.elementAt(index + (noSurat == 1 ? 1 : 0))),