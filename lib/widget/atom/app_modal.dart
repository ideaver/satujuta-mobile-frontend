import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import 'app_icon_button.dart';

class AppModal {
  static Future show({
    required BuildContext context,
    required String title,
    required Widget child,
    Color? backgroundColor,
  }) async {
    return await showModalBottomSheet(
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
          padding: EdgeInsets.fromLTRB(
            AppSizes.padding,
            AppSizes.padding,
            AppSizes.padding,
            MediaQuery.of(context).viewInsets.bottom + AppSizes.padding,
          ),
          child: SingleChildScrollView(
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
          ),
        );
      },
    );
  }
}
