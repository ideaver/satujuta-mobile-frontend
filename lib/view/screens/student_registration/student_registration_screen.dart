import 'package:flutter/material.dart';

import '../../../app/const/app_assets.dart';
import '../../../app/const/app_sizes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../app/widget/my_custom_text.dart';
import '../../organisms/student_registration/sr_form.dart';

class StudentRegistrationScreen extends StatelessWidget {
  const StudentRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: AppSizes.padding * 2,
              right: AppSizes.padding * 2,
              left: AppSizes.padding * 2),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Image.asset(
                      AppAssets.warningIconPath,
                      width: AppSizes.padding * 3,
                    ),
                  ],
                ),
                MyCustomText(
                  text: "Daftarkan Siswa",
                  style: AppTextStyle.bold(
                    context,
                    color: AppColors.base,
                  ).copyWith(fontSize: 24 + 8),
                ),
                MyCustomText(
                  text: "Harap mengisi data siswa",
                  style: AppTextStyle.regular(
                    context,
                    color: AppColors.base,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: AppSizes.height * 4,
                ),
                const SRForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
