import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myquran/src/const/app_color.dart';
import '../feature/surah_detail/domain/model/ayat.dart';

class AyatItem extends StatelessWidget {
  final Ayat ayat;
  final bool isSaved;
  final VoidCallback? ontap;

  const AyatItem({
    Key? key,
    required this.ayat,
    this.ontap,
    required this.isSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.gray, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Container(
                  width: 27,
                  height: 27,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(27 / 2)),
                  child: Center(
                      child: Text(
                    '${ayat.nomor}',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  )),
                ),
                const Spacer(),
                const Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                const Icon(
                  Icons.play_arrow_outlined,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                IconButton(
                  onPressed: ontap,
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_outline,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            '${ayat.ar}',
            style: GoogleFonts.amiri(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.right,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            '${ayat.idn}',
            style: GoogleFonts.poppins(color: AppColors.text, fontSize: 16),
          )
        ],
      ),
    );
  }
}
