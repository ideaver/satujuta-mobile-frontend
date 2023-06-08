import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_colors.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_typhography.dart';

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
            // colors: [kColorPinkLight, kColorPurple],
            colors: [
              FoundationColor.bgColorTextPink,
              FoundationColor.bgColorTextPurple
            ],
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
          style: FoundationTyphography.darkFontBold
              .copyWith(fontSize: FoundationTyphography.fontSizeH1),
        ),
      ],
    );
  }
}
