import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myquran/src/feature/all_surah/domain/model/surat_model.dart';

import 'feature/home/presentation/widget/bottom_navigation_widget.dart';
import 'feature/surah_detail/presentation/screen/surah_detail.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Quran',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const BottomNavigationWidget(),
      routes: {
        SurahDetailPage.routeName: (context) => SurahDetailPage(
              surat: ModalRoute.of(context)?.settings.arguments as SuratModel,
            ),
      },
    );
  }
}
