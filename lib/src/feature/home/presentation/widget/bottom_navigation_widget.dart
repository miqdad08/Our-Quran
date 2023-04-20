import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../const/app_color.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.gray,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        _bottomBarItem(icon: "assets/svgs/quran-icon.svg", label: "Quran"),
        _bottomBarItem(icon: "assets/svgs/lamp-icon.svg", label: "Tips"),
        _bottomBarItem(icon: "assets/svgs/pray-icon.svg", label: "Prayer"),
        _bottomBarItem(icon: "assets/svgs/doa-icon.svg", label: "Doa"),
        _bottomBarItem(
            icon: "assets/svgs/bookmark-icon.svg", label: "Bookmark"),
      ],
    );
  }

  BottomNavigationBarItem _bottomBarItem(
          {required String icon, required String label}) =>
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          icon,
          color: AppColors.text,
        ),
        activeIcon: SvgPicture.asset(
          icon,
          color: AppColors.primary,
        ),
        label: label,
      );
}
