import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../const/app_color.dart';

class AppBarDetailWidget extends StatelessWidget implements PreferredSizeWidget {
  final String surah;

  const AppBarDetailWidget({Key? key, required this.surah}) : super(key: key);

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
            onPressed: (() => {}),
            icon: SvgPicture.asset('assets/svgs/search-icon.svg')),
      ]),
    );
  }
}
