import 'package:flutter/material.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../widget/atom/app_text_field.dart';
import '../../../../widget/atom/app_text_fields_wrapper.dart';

class SettingsPassword extends StatefulWidget {
  const SettingsPassword({Key? key}) : super(key: key);

  @override
  State<SettingsPassword> createState() => _SettingsPasswordState();
}

class _SettingsPasswordState extends State<SettingsPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
      child: Container(
        color: AppColors.white,
        child: AppTextFieldsWrapper(
          textFields: [
            AppTextField(
              suffixIcon: Image.asset(
                AppAssets.passwordIconPath,
              ),
              obscureText: true,
              lableText: 'Password Lama',
            ),
            AppTextField(
              suffixIcon: Image.asset(
                AppAssets.passwordIconPath,
              ),
              obscureText: true,
              lableText: 'Password Baru',
            ),
            AppTextField(
              onTap: () {
                // TODO
              },
              suffixIcon: Image.asset(
                AppAssets.successIconPath,
              ),
              obscureText: true,
              lableText: 'Ulangi Password',
            ),
          ],
        ),
      ),
    );
  }
}
