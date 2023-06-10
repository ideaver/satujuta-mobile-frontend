import 'package:flutter/material.dart';

import '../../foundations/foundation_typhography.dart';

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
            style: FoundationTyphography.lightFontBold.copyWith(fontSize: 48),
          ),
        ),
        Text(
          textSubTitle,
          style: FoundationTyphography.darkFontBold.copyWith(fontSize: 24),
        ),
      ],
    );
  }
}
