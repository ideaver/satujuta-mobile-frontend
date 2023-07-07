import 'package:flutter/material.dart';

import '../../../app/const/app_sizes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';

class SettingItem extends StatelessWidget {
  SettingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.rightButton,
    this.subTitle,
  });

  final IconData? icon;
  final String? title;
  final String? subTitle;
  final Widget? rightButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius * 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon!,
                  color: AppColors.base,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppSizes.padding / 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: AppTextStyle.bold(
                      context,
                    ),
                  ),
                  subTitle == null
                      ? SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.only(top: AppSizes.height / 2),
                          child: Text(
                            subTitle!,
                            style: AppTextStyle.regular(
                              context,
                              fontSize: 12,
                              color: AppColors.baseLv5,
                            ),
                          ),
                        )
                ],
              ),
            ],
          ),
          rightButton!
        ],
      ),
    );
  }
}
