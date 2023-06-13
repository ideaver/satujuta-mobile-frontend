import 'package:flutter/material.dart';

import '../../app/const/app_sizes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../atoms/my_asset_image.dart';
import '../atoms/my_custom_text.dart';
import '../atoms/my_separated.dart';
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
            margin:
                const EdgeInsets.symmetric(vertical: AppSizes.sizePadding * 4),
            child: MyAssetImage(
              path: pathLogo,
              widthImage: AppSizes.sizeHeightDefault * 15,
            ),
          ),
        ),
        MyCustomText(
            text: textTitle,
            style: AppTextStyle.bold(
              context,
              color: AppColors.base,
            ).copyWith(fontSize: 24)),
        const MySeparated(
          sizeHeight: AppSizes.sizeHeightDefault / 2,
          sizeWidth: AppSizes.sizeHeightDefault,
        ),
        MyCustomText(
          text: textSubTitle,
          style: AppTextStyle.regular(
            context,
            fontSize: 14,
          ),
        ),
        const MySeparated(
          sizeHeight: AppSizes.sizeHeightDefault * 4 + 2,
          sizeWidth: AppSizes.sizeHeightDefault,
        ),
      ],
    );
  }
}
