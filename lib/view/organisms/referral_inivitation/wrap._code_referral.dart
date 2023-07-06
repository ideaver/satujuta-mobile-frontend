import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/const/app_assets.dart';

import '../../../app/const/app_sizes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../app/widget/my_custom_text.dart';
import '../../../app/widget/my_icon_button.dart';
import '../../molecules/referral_Invitation/my_button_with_custom_icon.dart';
import '../../molecules/referral_Invitation/my_text_line.dart';

// ignore: must_be_immutable
class WrapContentCodeRef extends StatelessWidget {
  final bool userConditionInvite = false;

  WrapContentCodeRef({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.textButton,
    required this.functionButton,
    required this.functionShareButton,
    required this.functionRefButton,
  });

  String? title;
  String? subtitle;
  String? textButton;
  IconData? icon;
  dynamic functionButton;
  dynamic functionShareButton;
  dynamic functionRefButton;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: AppSizes.padding),
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
            textButton: textButton,
            icon: icon,
            functionButton: functionButton,
            functionRefButton: functionRefButton,
            functionShareButton: functionShareButton,
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class WrapCodeReferral extends StatelessWidget {
  WrapCodeReferral({
    required this.functionButton,
    required this.functionShareButton,
    required this.functionRefButton,
    required this.icon,
    required this.textButton,
  });

  dynamic functionButton;
  dynamic functionShareButton;
  dynamic functionRefButton;
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: functionShareButton,
                child: AppIconButton(
                  icon: Icons.share_outlined,
                  backgroundColor: AppColors.baseLv5,
                  iconSize: 25,
                  padding: EdgeInsets.all(AppSizes.padding),
                ),
              ),
              SizedBox(
                width: AppSizes.padding,
              ),
              GestureDetector(
                onTap: functionRefButton,
                child: AppIconButton(
                  icon: CustomIcon.inventory,
                  backgroundColor: AppColors.baseLv6,
                  iconSize: 25,
                  padding: EdgeInsets.all(AppSizes.padding),
                  iconColor: AppColors.baseLv4,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
