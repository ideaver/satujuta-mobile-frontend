import 'package:flutter/material.dart';

import '../../../app/const/app_sizes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';
import '../../atoms/my_elevated_button.dart';

class ObButtonElevated extends StatelessWidget {
  const ObButtonElevated({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MyElevatedButton(
      padding: AppSizes.kHeight,
      text: "Mulai",
      textStyle: AppTextStyle.medium(context).copyWith(letterSpacing: 1),
      onPressed: onPressed,
      buttonStyle: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          AppColors.base,
        ),
      ),
    );
  }
}
