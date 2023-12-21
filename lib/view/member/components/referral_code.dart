import 'package:flutter/material.dart';

import '../../../app/asset/app_icons.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_custom_text.dart';
import '../../../widget/atom/app_icon_button.dart';
import '../../../widget/molecule/referral_Invitation/ref_button_with_custom_icon.dart';
import '../../../widget/molecule/referral_Invitation/ref_text_line.dart';

class ReferralCode extends StatelessWidget {
  final bool userConditionInvite = false;

  const ReferralCode({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.textButton,
    required this.onTapCopyButton,
    required this.onTapShareButton,
    required this.onTapTaskButton,
  });

  final String? title;
  final String? subtitle;
  final String? textButton;
  final IconData? icon;
  final Function() onTapCopyButton;
  final Function() onTapShareButton;
  final Function() onTapTaskButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppSizes.padding),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          userConditionInvite
              ? const SizedBox.shrink()
              : RefTextLine(
                  title: AppCustomText(
                    text: title!,
                    style: AppTextStyle.bold(context, color: AppColors.base, fontSize: 24),
                  ),
                  gap: AppSizes.height * 2,
                  subTitle: AppCustomText(
                    text: subtitle!,
                    style: AppTextStyle.regular(
                      context,
                      fontSize: 14,
                    ),
                  ),
                ),
          Column(
            children: [
              RefButtonWithCustomIcon(
                onPressed: onTapCopyButton,
                text: textButton!,
                icon: icon!,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIconButton(
                    onPressed: onTapShareButton,
                    icon: Icons.share_outlined,
                    backgroundColor: AppColors.baseLv7,
                    iconSize: 24,
                    iconColor: AppColors.baseLv4,
                    padding: const EdgeInsets.all(AppSizes.padding),
                  ),
                  const SizedBox(
                    width: AppSizes.padding,
                  ),
                  AppIconButton(
                    onPressed: onTapTaskButton,
                    icon: CustomIcon.inventory,
                    backgroundColor: AppColors.baseLv7,
                    iconSize: 24,
                    padding: const EdgeInsets.all(AppSizes.padding),
                    iconColor: AppColors.baseLv4,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
