import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_asset_image.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_text_custom.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_links.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_typhography.dart';

import '../../../constant.dart';
import '../../../tokens/links.dart';
import '../../molecules/authentications/auth_separated.dart';
import '../../molecules/auth_topbar.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.sizeWidth});

  final double sizeWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AuthTopBar(),
        Container(
          width: sizeWidth * .7,
          margin: const EdgeInsets.symmetric(vertical: kPadding * 4),
          child: const MyAssetImage(
            path: FoundationLinks.linkShortLogo,
            widthImage: 50,
          ),
        ),
        MyTextCustom(
            text: "Selamat Datang",
            style: FoundationTyphography.darkFontBold
                .copyWith(fontSize: kFontSizeTitleLarge)),
        const AuthSeparated(
          height: kHeight / 2,
          width: kHeight,
        ),
        MyTextCustom(
          text: "Masukkan Info login untuk Akses Member Area",
          style: FoundationTyphography.darkFontRegular
              .copyWith(fontSize: kFontSizeMedium),
        ),
        const AuthSeparated(
          height: kHeight * 4 + 2,
          width: kHeight,
        ),
      ],
    );
  }
}
