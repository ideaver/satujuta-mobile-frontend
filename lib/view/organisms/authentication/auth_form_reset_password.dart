import 'package:flutter/material.dart';

import '../../../app/const/app_assets.dart';
import '../../../app/const/app_sizes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/widget/my_custom_form.dart';

class AuthFormResetPassword extends StatelessWidget {
  const AuthFormResetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding + 8),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.baseLv4),
          borderRadius: BorderRadius.circular(AppSizes.height)),
      child: MyCustomForm(
        lableText: "Email",
        suffixIcon: Image.asset(AppAssets.contactFormIconPath),
        click: () {},
      ),
    );
  }
}
