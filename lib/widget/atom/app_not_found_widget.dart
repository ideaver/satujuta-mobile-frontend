import 'package:flutter/cupertino.dart';

import '../../app/asset/app_assets.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class AppNotFoundWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? image;

  const AppNotFoundWidget({
    Key? key,
    this.title,
    this.subtitle,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.padding * 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image ?? AppAssets.emptyEmojiPath,
            height: 172,
          ),
          const SizedBox(
            height: AppSizes.padding,
          ),
          Text(
            title ?? "Oops, Content Not Found",
            textAlign: TextAlign.center,
            style: AppTextStyle.bold(
              context,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: AppSizes.padding / 2),
          Text(
            subtitle ?? "Try again later",
            textAlign: TextAlign.center,
            style: AppTextStyle.regular(
              context,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
