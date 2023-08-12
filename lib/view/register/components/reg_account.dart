import 'package:flutter/material.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../widget/atom/app_text_field.dart';
import '../../../../widget/atom/app_text_fields_wrapper.dart';

class RegAccount extends StatefulWidget {
  const RegAccount({Key? key}) : super(key: key);

  @override
  State<RegAccount> createState() => _RegAccountState();
}

class _RegAccountState extends State<RegAccount> {
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
                  AppAssets.phoneIconPath,
                ),
                lableText: 'Nomor WhatsApp',
              ),
              AppTextField(
                suffixIcon: Image.asset(
                  AppAssets.dropdownRectangleFormIconPath,
                ),
                lableText: 'Email',
              ),
              AppTextField(
                onTap: () {
                  // TODO
                },
                suffixIcon: Image.asset(
                  AppAssets.passwordIconPath,
                ),
                lableText: 'Kata Sandi',
              ),
              AppTextField(
                onTap: () {
                  // TODO
                },
                suffixIcon: Image.asset(
                  AppAssets.passwordIconPath,
                ),
                lableText: 'Konfirmasi Kata Sandi',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
