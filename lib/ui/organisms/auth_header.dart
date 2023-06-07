import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_asset_image.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_text_custom.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_size.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_typhography.dart';
import 'package:satujuta_app_mobile/ui/molecules/separated.dart';

import '../../constant.dart';
import '../molecules/auth_topbar.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader(
      {super.key,
      required this.sizeWidth,
      required this.textTitle,
      required this.textSubTitle,
      required this.onPressed,
      required this.textButtonHeader,
      required this.pathLogo});

  final double sizeWidth;
  final String textTitle;
  final String textSubTitle;
  final String textButtonHeader;
  final VoidCallback onPressed;
  final String pathLogo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuthTopBar(
          onPressed: onPressed,
          text: textButtonHeader,
        ),
        Center(
          child: Container(
            width: sizeWidth * .7,
            margin: const EdgeInsets.symmetric(vertical: kPadding * 4),
            child: MyAssetImage(
              path: pathLogo,
              widthImage: FoundationSize.sizeHeightDefault * 15,
            ),
          ),
        ),
        MyTextCustom(
            text: textTitle,
            style: FoundationTyphography.darkFontBold
                .copyWith(fontSize: kFontSizeTitleLarge)),
        const Separated(
          height: kHeight / 2,
          width: kHeight,
        ),
        MyTextCustom(
          text: textSubTitle,
          style: FoundationTyphography.darkFontRegular
              .copyWith(fontSize: kFontSizeMedium),
        ),
        const Separated(
          height: kHeight * 4 + 2,
          width: kHeight,
        ),
      ],
    );
  }
}
