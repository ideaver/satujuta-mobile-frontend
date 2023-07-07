import 'package:flutter/material.dart';

import '../../../app/const/app_assets.dart';
import '../../../app/const/app_sizes.dart';
import '../../../app/widget/app_text_field.dart';
import '../../../app/widget/app_text_fields_wrapper.dart';

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
      child: Column(
        children: [
          AppTextFieldsWrapper(
            textFields: [
              AppTextField(
                suffixIcon: Image.asset(
                  AppAssets.lockFormIconPath,
                ),
                keyboardtype: TextInputType.visiblePassword,
                lableText: 'Password Lama',
              ),
              AppTextField(
                suffixIcon: Image.asset(
                  AppAssets.lockFormIconPath,
                ),
                keyboardtype: TextInputType.visiblePassword,
                lableText: 'Password Baru',
              ),
              AppTextField(
                onTap: () {
                  // TODO
                },
                suffixIcon: Image.asset(
                  AppAssets.successIconPath,
                ),
                keyboardtype: TextInputType.visiblePassword,
                lableText: 'Ulangi Password',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
