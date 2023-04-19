import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myquran/cubit/ayat/ayat_cubit.dart';
import 'package:myquran/cubit/surat/surat_cubit.dart';
import 'package:myquran/data/services/quran_service.dart';
import 'package:http/http.dart' as http;
import 'ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SuratCubit(
                QuranService(
                  client: http.Client(),
                ),
              ),
            ),
            BlocProvider(
              create: (context) => AyatCubit(
                QuranService(
                  client: http.Client(),
                ),
              ),
            ),
          ],
          child: MaterialApp(
            title: 'My Quran',
            theme: ThemeData(
              primarySwatch: Colors.brown,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            home: const HomePage(),
          ),
        );
      },
    );
  }
}
