import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myquran/src/feature/all_surah/presentation/screen/surat_page.dart';
import 'package:myquran/src/feature/home/presentation/widget/app_bar_home.dart';

import '../../../../const/app_color.dart';
import '../widget/bottom_navigation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppBarHomeWidget(),
      bottomNavigationBar: const BottomNavigationWidget(),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: _greeting(),
                    ),
                    SliverAppBar(
                      pinned: true,
                      elevation: 0,
                      backgroundColor: AppColors.background,
                      automaticallyImplyLeading: false,
                      shape: Border(
                          bottom: BorderSide(
                              width: 3,
                              color: const Color(0xFFAAAAAA).withOpacity(.1))),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(0),
                        child: _tab(),
                      ),
                    )
                  ],
              body: const TabBarView(children: [
                SuratPage(),
                Text('data'),
                Text('data'),
                Text('data')
              ])),
        ),
      ),
    );
  }

  TabBar _tab() {
    return TabBar(
        unselectedLabelColor: AppColors.text,
        labelColor: Colors.white,
        indicatorColor: AppColors.primary,
        indicatorWeight: 3,
        tabs: [
          _tabItem(label: "Surah"),
          _tabItem(label: "Para"),
          _tabItem(label: "Page"),
          _tabItem(label: "Hijb"),
        ]);
  }

  Tab _tabItem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Column _greeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assalamualaikum',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.text),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Ahmad Miqdad',
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        const SizedBox(
          height: 24,
        ),
        _lastRead()
      ],
    );
  }

  Stack _lastRead() {
    return Stack(
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0,
                    .6,
                    1
                  ],
                  colors: [
                    Color(0xFFDF98FA),
                    Color(0xFFB070FD),
                    Color(0xFF9055FF)
                  ])),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset('assets/svgs/quran.svg')),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svgs/book.svg'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Last Read',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Al-Fatihah',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Ayat No: 1',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
