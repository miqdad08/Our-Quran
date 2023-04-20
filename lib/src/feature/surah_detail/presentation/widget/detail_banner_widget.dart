import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myquran/src/feature/surah_detail/domain/model/surat_detail_model.dart';

class DetailBannerWidget extends StatelessWidget {
  final SuratDetailModel ayatSurat;
  const DetailBannerWidget({Key? key, required this.ayatSurat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(children: [
        Container(
          height: 257,
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
            child: Opacity(
                opacity: .2,
                child: SvgPicture.asset(
                  'assets/svgs/quran.svg',
                  width: 324 - 55,
                ))),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              Text(
                '${ayatSurat.namaLatin}',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 26),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "${ayatSurat.arti}",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              Divider(
                color: Colors.white.withOpacity(.35),
                thickness: 2,
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${ayatSurat.tempatTurun}',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${ayatSurat.jumlahAyat} Ayat",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              SvgPicture.asset('assets/svgs/bismillah.svg')
            ],
          ),
        )
      ]),
    );
  }
}
