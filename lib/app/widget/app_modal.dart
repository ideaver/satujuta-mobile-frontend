import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/const/app_sizes.dart';
import 'package:satujuta_app_mobile/app/theme/app_colors.dart';
import 'package:satujuta_app_mobile/app/widget/my_icon_button.dart';

import '../theme/app_text_style.dart';

class AppModal {
  static Future<void> show({
    required BuildContext context,
    required String title,
    required Widget child,
    Color? backgroundColor,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: backgroundColor ?? AppColors.baseLv7,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.radius),
          topRight: Radius.circular(AppSizes.radius),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(AppSizes.padding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: AppSizes.padding / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 32),
                  Text(
                    title,
                    style: AppTextStyle.bold(context, fontSize: 18),
                  ),
                  AppIconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.cancel_outlined,
                  )
                ],
              ),
              const SizedBox(height: AppSizes.padding * 1.5),
              child,
            ],
          ),
        );
      },
    );
  }
}
