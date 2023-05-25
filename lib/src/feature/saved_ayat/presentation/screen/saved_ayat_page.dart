import 'package:flutter/material.dart';

import '../../../../const/app_color.dart';
import '../../../home/presentation/widget/app_bar_home.dart';

class SavedAyatPage extends StatelessWidget {
  const SavedAyatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarHomeWidget(),
      
    );
  }
}
