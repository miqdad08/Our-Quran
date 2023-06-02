import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myquran/src/feature/saved_ayat/domain/saved_ayat.dart';

import '../const/app_color.dart';

class SavedAyatWidget extends StatelessWidget {
  final SavedAyat savedAyat;
  final int index;
  final VoidCallback? onTap;

  const SavedAyatWidget(
      {Key? key, required this.savedAyat, required this.index, this.onTap})
      : super(key: key);

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
                      '${index + 1}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  '${savedAyat.surah} : Ayat ${savedAyat.ayat}',
                  style: GoogleFonts.poppins(color: AppColors.text, fontSize: 16),
                ),
                const Spacer(),
                IconButton(
                  onPressed: onTap,
                  icon: const Icon(
                    // isSaved ? Icons.bookmark :
                    Icons.bookmark_remove,
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
            savedAyat.ayatText,
            style: GoogleFonts.amiri(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.right,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            savedAyat.ayatTranslate,
            style: GoogleFonts.poppins(color: AppColors.text, fontSize: 16),
          )
        ],
      ),
    );
  }
}
//
// class SavedIconWidget extends StatelessWidget {
//   final String id;
//
//   const SavedIconWidget({
//     super.key,
//     required this.id,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SavedAyatBloc, SavedAyatState>(
//         builder: (context, state) {
//       var isBookmarked = context.read<SavedAyatBloc>().add(
//             IsBookmarkedEvent(id: id)
//           );
//       return FutureBuilder(
//           future: isBookmarked,
//           builder: (context) {
//             return const Icon(
//               Icons.bookmark_outline,
//               color: Colors.white,
//             );
//           });
//     });
//   }
// }
