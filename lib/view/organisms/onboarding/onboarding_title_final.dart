import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';
import '../../atoms/my_text_gradient_color.dart';

class OnBoardingTitleFinal extends StatelessWidget {
  const OnBoardingTitleFinal({
    super.key,
    required this.textTitle,
    required this.textSubTitle,
  });
  final String textTitle;
  final String textSubTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyTextGradientColor(
          textTitle: textTitle,
          listColor: const [AppColors.pink, AppColors.darkBlue],
          fontSize: 16 * 2,
          textAlign: TextAlign.center,
        ),
        Text(
          textSubTitle,
          textAlign: TextAlign.center,
          style: AppTextStyle.bold(
            context,
            color: AppColors.base,
          ).copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
