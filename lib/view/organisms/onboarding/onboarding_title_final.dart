import 'package:flutter/material.dart';

import '../../atoms/my_text_gradient_color.dart';
import '../../foundations/foundation_colors.dart';
import '../../foundations/foundation_typhography.dart';

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
          listColor: const [
            FoundationColor.bgColorTextPink,
            FoundationColor.bgColorTextPurple
          ],
          fontSize: FoundationTyphography.fontSizeH1 * 2,
          textAlign: TextAlign.center,
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
