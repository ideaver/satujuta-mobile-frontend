import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_typhography.dart';

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
          style: darkJakartaText.copyWith(fontSize: 24, fontWeight: bold),
        ),
      ],
    );
  }
}

class OnBoardingTitleNext extends StatelessWidget {
  const OnBoardingTitleNext({
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
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [kColorPinkLight, kColorPurple],
          ).createShader(bounds),
          child: Text(
            textTitle,
            style: FoundationTyphography.lightFontBold
                .copyWith(fontSize: FoundationTyphography.fontSizeH1 * 2),
          ),
        ),
        Text(
          textSubTitle,
          textAlign: TextAlign.center,
          style: FoundationTyphography.darkFontBold.copyWith(
              fontSize: FoundationTyphography.fontSizeH1, fontWeight: bold),
        ),
      ],
    );
  }
}
