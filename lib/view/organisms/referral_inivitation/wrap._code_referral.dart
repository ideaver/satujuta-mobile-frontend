import 'package:flutter/material.dart';

import '../../../app/const/app_sizes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../app/widget/my_custom_text.dart';
import '../../../app/widget/my_icon_button.dart';
import '../../molecules/referral_Invitation/my_button_with_custom_icon.dart';
import '../../molecules/referral_Invitation/my_text_line.dart';

class WrapContentCodeRef extends StatelessWidget {
  final bool userConditionInvite = false;

  WrapContentCodeRef({
    required this.title,
    required this.subtitle,
    required this.functionButton,
    required this.icon,
    required this.textButton,
  });

  String? title;
  String? subtitle;
  String? textButton;
  IconData? icon;
  dynamic functionButton;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          userConditionInvite
              ? SizedBox.shrink()
              : MyTextLine(
                  title: MyCustomText(
                    text: title!,
                    style: AppTextStyle.bold(context, color: AppColors.base, fontSize: 24),
                  ),
                  gap: AppSizes.height * 2,
                  subTitle: MyCustomText(text: subtitle!, style: AppTextStyle.regular(context, fontSize: 14)),
                ),
          WrapCodeReferral(
            functionButton: functionButton,
            textButton: textButton,
            icon: icon,
          )
        ],
      ),
    );
  }
}

class WrapCodeReferral extends StatelessWidget {
  WrapCodeReferral({
    required this.functionButton,
    required this.icon,
    required this.textButton,
  });

  dynamic functionButton;
  IconData? icon;
  String? textButton;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        MyButtonWithCustomIcon(
          onPressed: functionButton!,
          text: textButton!,
          icon: icon!,
        ),
        Container(
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIconButton(
                icon: Icons.share_outlined,
                backgroundColor: AppColors.baseLv5,
                iconSize: 25,
                padding: EdgeInsets.all(AppSizes.padding),
              ),
              SizedBox(
                width: AppSizes.padding,
              ),
              AppIconButton(
                icon: Icons.inventory_2_outlined,
                backgroundColor: AppColors.baseLv6,
                iconSize: 25,
                padding: EdgeInsets.all(AppSizes.padding),
                iconColor: AppColors.baseLv4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
