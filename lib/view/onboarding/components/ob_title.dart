import 'package:flutter/material.dart';

import '../../../../app/theme/app_text_style.dart';
import '../../../../widget/atom/app_gradient_text.dart';

class ObTitle extends StatelessWidget {
  const ObTitle({
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppGradientText(
          textTitle: textTitle,
          listColor: listColor,
          fontSize: 48,
          textAlign: TextAlign.center,
        ),
        Text(
          textSubTitle,
          style: AppTextStyle.bold(
            context,
            fontSize: 24,
            height: 1,
          ),
        ),
      ],
    );
  }
}
