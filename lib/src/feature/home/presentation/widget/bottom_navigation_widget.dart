import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myquran/src/feature/home/presentation/screen/home_page.dart';
import 'package:myquran/src/feature/saved_ayat/presentation/screen/saved_ayat_page.dart';

import '../../../../const/app_color.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onBottomNavTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.gray,
        showSelectedLabels: false,
        currentIndex: _bottomNavIndex,
        showUnselectedLabels: false,
        items: bottomNavBarItems,
      ),
    );
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  final List<Widget> _listWidget = [

    const HomePage(),
    const Scaffold(body: Center(child: Text("Tips"))),
    const Scaffold(body: Center(child: Text("Tips"))),
    const Scaffold(body: Center(child: Text("Tips"))),
    const SavedAyatPage(),
  ];

  final List<BottomNavigationBarItem> bottomNavBarItems = [
    _bottomBarItem(icon: "assets/svgs/quran-icon.svg", label: "Quran"),
    _bottomBarItem(icon: "assets/svgs/lamp-icon.svg", label: "Tips"),
    _bottomBarItem(icon: "assets/svgs/pray-icon.svg", label: "Prayer"),
    _bottomBarItem(icon: "assets/svgs/doa-icon.svg", label: "Doa"),
    _bottomBarItem(icon: "assets/svgs/bookmark-icon.svg", label: "Bookmark"),
  ];

  static BottomNavigationBarItem _bottomBarItem({
    required String icon,
    required String label,
  }) =>
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
