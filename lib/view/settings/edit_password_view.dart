import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../app/service/locator/service_locator.dart';
import '../../app/utility/validator.dart';
import '../../view_model/edit_profile_view_model.dart';
import '../../widget/atom/app_icon_button.dart';
import '../../widget/atom/app_text_field.dart';
import '../../widget/atom/app_text_fields_wrapper.dart';

class EditPasswordView extends StatefulWidget {
  const EditPasswordView({super.key});

  static const String routeName = '/edit-password';

  @override
  State<EditPasswordView> createState() => _EditPasswordViewState();
}

class _EditPasswordViewState extends State<EditPasswordView> {
  final _editProfileViewModel = locator<EditProfileViewModel>();

  @override
  void initState() {
    _editProfileViewModel.passwordCtrl = TextEditingController();
    _editProfileViewModel.newPasswordCtrl = TextEditingController();
    _editProfileViewModel.confirmPasswordCtrl = TextEditingController();

    _editProfileViewModel.initEditProfileView();
    super.initState();
  }

  @override
  void dispose() {
    _editProfileViewModel.passwordCtrl.dispose();
    _editProfileViewModel.newPasswordCtrl.dispose();
    _editProfileViewModel.confirmPasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: title(),
      elevation: 0.5,
    );
  }

  Widget title() {
    return Text(
      'Ubah Password',
      style: AppTextStyle.bold(context, fontSize: 18),
    );
  }

  Widget backButton() {
    return AppIconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icons.arrow_back,
      iconSize: 18,
      iconColor: AppColors.base,
      backgroundColor: AppColors.white,
      padding: const EdgeInsets.all(AppSizes.padding / 2),
    );
  }

  Widget body() {
    return Consumer<EditProfileViewModel>(builder: (context, model, _) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          children: [
            const SizedBox(height: AppSizes.padding / 2),
            AppTextFieldsWrapper(
              textFields: [
                AppTextField(
                  controller: model.passwordCtrl,
                  type: AppTextFieldType.password,
                  lableText: 'Password Lama',
                  onChanged: (val) {
                    setState(() {});
                  },
                ),
                AppTextField(
                  controller: model.newPasswordCtrl,
                  type: AppTextFieldType.password,
                  showSuffixButton: false,
                  lableText: 'Password Baru',
                  onChanged: (val) {
                    setState(() {});
                  },
                ),
                AppTextField(
                  controller: model.confirmPasswordCtrl,
                  type: AppTextFieldType.password,
                  showSuffixButton: false,
                  lableText: 'Ulangi Password',
                  onChanged: (val) {
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(height: AppSizes.padding),
            validatorInfo(model),
            const SizedBox(height: AppSizes.padding),
            changeButton(model),
          ],
        ),
      );
    });
  }

  Widget changeButton(EditProfileViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSizes.padding / 2,
        bottom: AppSizes.padding * 2,
      ),
      child: AppButton(
        onTap: () {
          final navigator = Navigator.of(context);
          model.onTapUpdatePassword(navigator);
        },
        text: 'Change',
        enable: enableButton(model),
      ),
    );
  }

  bool enableButton(EditProfileViewModel model) {
    if (Validator.isPasswordValid(model.newPasswordCtrl.text) &&
        model.newPasswordCtrl.text.isNotEmpty &&
        model.newPasswordCtrl.text == model.confirmPasswordCtrl.text) {
      return true;
    } else {
      return false;
    }
  }

  Widget validatorInfo(EditProfileViewModel model) {
    bool isLengthMoreThan5 = model.newPasswordCtrl.text.length > 5;
    bool isContainUppercase = Validator.isContainsUppercase(model.newPasswordCtrl.text);
    bool isContainerNumber = Validator.isContainsNumber(model.newPasswordCtrl.text);
    bool isConfirmPassValid =
        model.newPasswordCtrl.text.isNotEmpty && model.newPasswordCtrl.text == model.confirmPasswordCtrl.text;

    return Column(
      children: [
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
