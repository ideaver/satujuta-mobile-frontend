import 'package:flutter/material.dart';

import '../../../app/asset/app_assets.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';

class ContentNotReady extends StatelessWidget {
  const ContentNotReady({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      padding: const EdgeInsets.all(AppSizes.padding * 2),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.emptyEmojiPath),
            const SizedBox(
              height: AppSizes.height * 5,
            ),
            Text(
              "Maaf, belum ada hotel di kota ini.",
              style: AppTextStyle.bold(
                context,
                color: AppColors.base,
              ).copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: AppSizes.padding,
            ),
            Text(
              "Kami akan segera menambahkan daftar hotel yang kamu inginkan",
              textAlign: TextAlign.center,
              style: AppTextStyle.regular(
                context,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
