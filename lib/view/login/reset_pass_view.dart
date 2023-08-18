import 'package:flutter/material.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_image.dart';
import '../../../widget/atom/app_text_field.dart';
import '../../../widget/atom/app_text_fields_wrapper.dart';
import '../../widget/atom/app_icon_button.dart';
import '../onboarding/onboarding_view.dart';
import 'login_view.dart';

class ResetPassView extends StatefulWidget {
  const ResetPassView({Key? key}) : super(key: key);

  static const String routeName = '/reset-pass';

  @override
  State<ResetPassView> createState() => _ResetPassViewState();
}

class _ResetPassViewState extends State<ResetPassView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          children: [
            logo(),
            resetText(),
            form(),
            resetButton(),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIconButton(
            onPressed: () {
              // TODO
            },
            imgIcon: AppAssets.lockIconPath,
          ),
          AppButton(
            onTap: () {
              // TODO
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginView.routeName,
                ModalRoute.withName(OnboardingView.routeName),
              );
            },
            textColor: AppColors.primary,
            buttonColor: AppColors.primary.withOpacity(0.12),
            text: 'Login',
            fontSize: 12,
            rightIcon: Icons.arrow_forward_ios_rounded,
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget logo() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.padding * 2,
        vertical: AppSizes.padding * 4,
      ),
      constraints: const BoxConstraints(maxWidth: 500),
      child: const AppImage(
        image: AppAssets.shortLogoPath,
        imgProvider: ImgProvider.assetImage,
      ),
    );
  }

  Widget resetText() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reset Kata Sandi',
            style: AppTextStyle.bold(
              context,
              fontSize: 26,
            ),
          ),
          const SizedBox(height: AppSizes.padding / 2),
          Text(
            'Masukkan email untuk membuat kata sandi baru',
            style: AppTextStyle.medium(
              context,
              fontSize: 14,
              color: AppColors.baseLv4,
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 2),
      child: AppTextFieldsWrapper(
        textFields: [
          AppTextField(
            suffixIcon: Image.asset(AppAssets.contactFormIconPath),
            lableText: 'Email',
          ),
        ],
      ),
    );
  }

  Widget resetButton() {
    return AppButton(
      text: 'Reset Kata Sandi',
      onTap: () {
        // TODO
      },
    );
  }
}
