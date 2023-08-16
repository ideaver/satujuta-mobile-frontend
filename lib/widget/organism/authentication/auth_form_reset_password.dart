import 'package:flutter/material.dart';

import '../../../app/asset/app_assets.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../atom/app_text_field.dart';

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
        borderRadius: BorderRadius.circular(
          AppSizes.height,
        ),
      ),
      child: AppTextField(
        lableText: "Email",
        suffixIcon: Image.asset(AppAssets.contactFormIconPath),
        onTap: () {},
      ),
    );
  }
}
