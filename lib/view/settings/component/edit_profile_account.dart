import 'package:flutter/material.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../widget/atom/app_text_field.dart';
import '../../../../widget/atom/app_text_fields_wrapper.dart';

class EditProfileAccount extends StatefulWidget {
  const EditProfileAccount({
    Key? key,
    this.noWa,
    this.email,
  });

  final String? noWa;
  final String? email;

  @override
  State<EditProfileAccount> createState() => _EditProfileAccountState();
}

class _EditProfileAccountState extends State<EditProfileAccount> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
      child: Container(
        color: AppColors.white,
        child: Column(
          children: [
            AppTextFieldsWrapper(
              textFields: [
                AppTextField(
                  suffixIcon: Image.asset(
                    AppAssets.phoneIconPath,
                  ),
                  lableText: 'Nomor WhatsApp',
                  hintText: widget.noWa,
                ),
                AppTextField(
                  suffixIcon: Image.asset(
                    AppAssets.dropdownRectangleFormIconPath,
                  ),
                  lableText: 'Email',
                  hintText: widget.email,
                ),
                AppTextField(
                  onTap: () {
                    // TODO
                  },
                  suffixIcon: Image.asset(
                    AppAssets.passwordIconPath,
                  ),
                  lableText: 'Kata Sandi',
                  obscureText: true,
                ),
                AppTextField(
                  onTap: () {
                    // TODO
                  },
                  suffixIcon: Image.asset(
                    AppAssets.passwordIconPath,
                  ),
                  obscureText: true,
                  lableText: 'Konfirmasi Kata Sandi',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
