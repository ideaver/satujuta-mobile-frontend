import 'package:flutter/material.dart';

import '../../../constant.dart';

class OnBoardingTitle extends StatelessWidget {
  const OnBoardingTitle({
    super.key,
    required this.textTitle,
    required this.textSubTitle,
  });
  final String textTitle;
  final String textSubTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [kColorBlueDark, kColorBlueLight],
          ).createShader(bounds),
          child: Text(
            textTitle,
            style: whiteJakartaText.copyWith(fontSize: 48, fontWeight: bold),
          ),
        ),
        Text(
          textSubTitle,
          style: darkJakartaText.copyWith(fontSize: 32, fontWeight: bold),
        ),
      ],
    );
  }
}
