import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/theme/app_colors.dart';
import 'package:satujuta_app_mobile/app/theme/app_text_style.dart';

import '../../../app/widget/my_icon.dart';
import '../../../app/const/app_sizes.dart';
import '../../../app/widget/my_separated.dart';

// ignore: must_be_immutable
class MyButtonWithCustomIcon extends StatelessWidget {
  MyButtonWithCustomIcon({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  IconData? icon;

  final VoidCallback onPressed;

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.padding * 2,
        horizontal: AppSizes.padding * 2,
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  text,
                  style: AppTextStyle.bold(context, fontSize: 16, color: AppColors.white),
                ),
                MySeparated(sizeWidth: 10, sizeHeight: 0),
                MyIcon(
                  iconData: icon!,
                  size: 25,
                )
              ],
            ),
          )),
    );
  }
}
