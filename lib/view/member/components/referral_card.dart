import 'package:flutter/material.dart';

import '../../../app/asset/app_icons.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_custom_text.dart';

class ReferralCard extends StatelessWidget {
  const ReferralCard({
    super.key,
    this.title,
    this.subtitle,
  });

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: AppSizes.padding,
        horizontal: AppSizes.padding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.radius,
        ),
      ),
      tileColor: AppColors.baseLv6,
      title: AppCustomText(
        text: title!,
        style: AppTextStyle.bold(
          context,
          fontSize: 12,
          color: AppColors.baseLv4,
        ),
      ),
      subtitle: AppCustomText(
        text: subtitle!,
        style: AppTextStyle.bold(
          context,
          fontSize: 24,
          color: AppColors.base,
        ),
      ),
      trailing: const CircleAvatar(
        backgroundColor: AppColors.white,
        maxRadius: 25,
        child: Icon(
          CustomIcon.inventory,
          color: AppColors.base,
          size: 20,
        ),
      ),
    );
  }
}
