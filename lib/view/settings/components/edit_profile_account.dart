import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../widget/atom/app_text_field.dart';
import '../../../../widget/atom/app_text_fields_wrapper.dart';
import '../../../view_model/edit_profile_view_model.dart';

class EditProfileAccount extends StatefulWidget {
  const EditProfileAccount({
    super.key,
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
    return Consumer<EditProfileViewModel>(
      builder: (context, model, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
          child: Container(
            color: AppColors.white,
            child: Column(
              children: [
                AppTextFieldsWrapper(
                  textFields: [
                    AppTextField(
                      controller: model.whatsappNumberCtrl,
                      enabled: false,
                      type: AppTextFieldType.phone,
                      suffixIcon: const Icon(
                        CupertinoIcons.phone_circle,
                      ),
                      lableText: 'Nomor WhatsApp',
                      hintText: widget.noWa,
                    ),
                    AppTextField(
                      controller: model.emailCtrl,
                      enabled: false,
                      suffixIcon: const Icon(
                        CupertinoIcons.mail,
                      ),
                      lableText: 'Email',
                      hintText: widget.email,
                    ),
                    // AppTextField(
                    //   controller: model.password,
                    //   type: AppTextFieldType.password,
                    //   lableText: 'Kata Sandi',
                    // ),
                    // AppTextField(
                    //   controller: model.confirmPassword,
                    //   type: AppTextFieldType.password,
                    //   lableText: 'Konfirmasi Kata Sandi',
                    // ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
