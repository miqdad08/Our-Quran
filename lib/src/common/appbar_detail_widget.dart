import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myquran/src/common/search_ayat_box.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../const/app_color.dart';

class AppBarDetailWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String surah;
  final ItemScrollController itemScrollController;
  final TextEditingController controller;

  const AppBarDetailWidget(
      {Key? key,
      required this.surah,
      required this.controller,
      required this.itemScrollController})
      : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(children: [
        IconButton(
            onPressed: (() => Navigator.of(context).pop()),
            icon: SvgPicture.asset('assets/svgs/back-icon.svg')),
        const SizedBox(
          width: 24,
        ),
        Text(
          surah,
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
            onPressed: (() {
              showDialog(
                context: context,
                builder: (context) {
                  return SearchAyatBox(
                    controller: controller,
                    onCancel: () {
                      Navigator.pop(context);
                    },
                    itemScrollController: itemScrollController,
                  );
                },
              );
            }),
            icon: SvgPicture.asset('assets/svgs/search-icon.svg')),
      ]),
    );
  }
}
