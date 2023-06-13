import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';

class OnBoardingTitle extends StatelessWidget {
  const OnBoardingTitle({
    super.key,
    required this.textTitle,
    required this.textSubTitle,
    required this.listColor,
  });
  final String textTitle;
  final String textSubTitle;
  final List<Color> listColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: listColor,
          ).createShader(bounds),
          child: Text(
            textTitle,
            style: AppTextStyle.bold(context).copyWith(fontSize: 48),
          ),
        ),
        Text(
          textSubTitle,
          style: AppTextStyle.bold(
            context,
            color: AppColors.base,
          ).copyWith(fontSize: 24),
        ),
      ],
    );
  }
}
