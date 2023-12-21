import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../../widget/atom/app_text_field.dart';
import '../../../../widget/atom/app_text_fields_wrapper.dart';
import '../../../app/utility/validator.dart';
import '../../../view_model/register_view_model.dart';
import '../../../widget/atom/app_button.dart';

class RegAccount extends StatefulWidget {
  const RegAccount({Key? key}) : super(key: key);

  @override
  State<RegAccount> createState() => _RegAccountState();
}

class _RegAccountState extends State<RegAccount> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterViewModel>(
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
                      type: AppTextFieldType.phone,
                      suffixIcon: const Icon(
                        CupertinoIcons.phone_circle,
                      ),
                      lableText: 'Nomor WhatsApp',
                      hintText: "085366226633",
                      onChanged: (val) {
                        setState(() {});
                      },
                    ),
                    AppTextField(
                      controller: model.emailCtrl,
                      suffixIcon: const Icon(
                        CupertinoIcons.mail,
                      ),
                      lableText: 'Email',
                      hintText: "agus@gmail.com",
                      onChanged: (val) {
                        setState(() {});
                      },
                    ),
                    AppTextField(
                      controller: model.passwordCtrl,
                      type: AppTextFieldType.password,
                      lableText: 'Kata Sandi',
                      onChanged: (val) {
                        setState(() {});
                      },
                    ),
                    AppTextField(
                      controller: model.confirmPasswordCtrl,
                      type: AppTextFieldType.password,
                      lableText: 'Konfirmasi Kata Sandi',
                      onChanged: (val) {
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.padding),
                validatorInfo(model),
                const SizedBox(height: AppSizes.padding),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              model.tabController.animateTo(model.tabController.index - 1);
                            },
                            text: 'Sebelumnya',
                            textColor: AppColors.primary,
                            buttonColor: AppColors.primary.withOpacity(0.12),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(100),
                              bottomLeft: Radius.circular(100),
                              topRight: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: AppButton(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              model.tabController.animateTo(model.tabController.index + 1);
                            },
                            enable: model.isAccountFormValid(),
                            text: 'Berikutnya',
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              bottomLeft: Radius.circular(32),
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget validatorInfo(RegisterViewModel model) {
    bool isEmailValid = Validator.isEmailValid(model.emailCtrl.text);
    bool isWhatsappNumberValid = Validator.isPhoneNumberValid(model.whatsappNumberCtrl.text);
    bool isLengthMoreThan5 = model.passwordCtrl.text.length > 5;
    bool isContainUppercase = Validator.isContainsUppercase(model.passwordCtrl.text);
    bool isContainerNumber = Validator.isContainsNumber(model.passwordCtrl.text);
    bool isConfirmPassValid =
        model.passwordCtrl.text.isNotEmpty && model.passwordCtrl.text == model.confirmPasswordCtrl.text;

    return Column(
      children: [
        Opacity(
          opacity: isEmailValid ? 1.0 : 0.5,
          child: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: isEmailValid ? AppColors.greenLv1 : AppColors.baseLv4,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                'Email valid',
                style: AppTextStyle.medium(context),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.padding / 2),
        Opacity(
          opacity: isWhatsappNumberValid ? 1.0 : 0.5,
          child: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: isWhatsappNumberValid ? AppColors.greenLv1 : AppColors.baseLv4,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                'Nomor WhatsApp valid',
                style: AppTextStyle.medium(context),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.padding / 2),
        Opacity(
          opacity: isContainUppercase ? 1.0 : 0.5,
          child: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: isContainUppercase ? AppColors.greenLv1 : AppColors.baseLv4,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                'Password menngandung karakter besar atau kecil',
                style: AppTextStyle.medium(context),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.padding / 2),
        Opacity(
          opacity: isLengthMoreThan5 ? 1.0 : 0.5,
          child: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: isLengthMoreThan5 ? AppColors.greenLv1 : AppColors.baseLv4,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                'Password 6 atau lebih karakter',
                style: AppTextStyle.medium(context),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.padding / 2),
        Opacity(
          opacity: isContainerNumber ? 1.0 : 0.5,
          child: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: isContainerNumber ? AppColors.greenLv1 : AppColors.baseLv4,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                'Password mengandung setidaknya 1 angka',
                style: AppTextStyle.medium(context),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.padding / 2),
        Opacity(
          opacity: isConfirmPassValid ? 1.0 : 0.5,
          child: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: isConfirmPassValid ? AppColors.greenLv1 : AppColors.baseLv4,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                'Ulangi password harus sama',
                style: AppTextStyle.medium(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
