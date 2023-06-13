import 'package:flutter/material.dart';

import '../../app/theme/app_text_style.dart';

class MyTextGradientColor extends StatelessWidget {
  const MyTextGradientColor({
    super.key,
    required this.textTitle,
    required this.listColor,
    required this.textAlign,
    required this.fontSize,
  });

  final String textTitle;
  final List<Color> listColor;
  final TextAlign textAlign;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: listColor,
      ).createShader(bounds),
      child: Text(
        textTitle,
        textAlign: textAlign,
        style: AppTextStyle.medium(
          context,
          fontSize: fontSize,
          color: listColor.first,
        ),
      ),
    );
  }
}
