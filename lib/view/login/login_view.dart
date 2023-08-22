import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_image.dart';
import '../../../widget/atom/app_text_field.dart';
import '../../../widget/atom/app_text_fields_wrapper.dart';
import '../../app/service/locator/service_locator.dart';
import '../../view_model/login_view_model.dart';
import '../../widget/atom/app_icon_button.dart';
import '../main/main_view.dart';
import '../register/register_view.dart';
import 'reset_pass_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginViewModel = locator<LoginViewModel>();

  @override
  void initState() {
    _loginViewModel.emailController = TextEditingController();
    _loginViewModel.passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _loginViewModel.emailController.dispose();
    _loginViewModel.passwordController.dispose();
    _loginViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loginViewModel,
      builder: (context, snapshot) {
        return Consumer<LoginViewModel>(
          builder: (context, loginViewModel, _) {
            return Scaffold(
              appBar: appBar(),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.padding),
                child: Column(
                  children: [
                    logo(),
                    welcomeText(),
                    form(),
                    loginButton(),
                    registerTextButton(),
                  ],
                ),
              ),
            );
          },
        );
      },
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
              Navigator.pushNamed(context, ResetPassView.routeName);
            },
            textColor: AppColors.primary,
            buttonColor: AppColors.primary.withOpacity(0.12),
            text: 'Lupa Password',
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
        image: AppAssets.longLogoPath,
        imgProvider: ImgProvider.assetImage,
      ),
    );
  }

  Widget welcomeText() {
    return Column(
      children: [
        Text(
          'Selamat Datang',
          style: AppTextStyle.bold(
            context,
            fontSize: 26,
          ),
        ),
        const SizedBox(height: AppSizes.padding / 2),
        Text(
          'Masukkan Info login untuk Akses Member Area',
          style: AppTextStyle.medium(
            context,
            fontSize: 14,
            color: AppColors.baseLv4,
          ),
        ),
      ],
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
          const Divider(
            color: AppColors.baseLv6,
            thickness: 1.5,
            height: 0,
          ),
          AppTextField(
            type: AppTextFieldType.password,
            suffixIcon: AppIconButton(
              imgIcon: AppAssets.lockFormIconPath,
              onPressed: () {
                // TODO
              },
            ),
            lableText: 'Password',
          ),
        ],
      ),
    );
  }

  Widget loginButton() {
    return AppButton(
      text: 'Masuk',
      onTap: () {
        // TODO
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainView.routeName,
          (route) => false,
        );
      },
    );
  }

  Widget registerTextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
      child: Wrap(
        spacing: 2,
        children: [
          Text(
            'Belum memiliki Akses?',
            style: AppTextStyle.extraBold(context),
          ),
          InkWell(
            onTap: () {
              // TODO
              Navigator.pushNamedAndRemoveUntil(
                context,
                RegisterView.routeName,
                ModalRoute.withName(LoginView.routeName),
              );
            },
            child: Text(
              'Daftar',
              style: AppTextStyle.extraBold(
                context,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
