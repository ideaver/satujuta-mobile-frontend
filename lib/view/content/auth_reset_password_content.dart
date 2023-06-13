import 'package:flutter/material.dart';

import '../../app/const/app_assets.dart';
import '../../app/const/app_sizes.dart';
import '../../app/theme/app_colors.dart';
import '../atoms/my_custom_button.dart';
import '../atoms/my_separated.dart';
import '../organisms/auth_header.dart';
import '../organisms/authentication/auth_form_reset_password.dart';
import '../screens/authentication/login_screen.dart';

class AuthResetPasswordContent extends StatelessWidget {
  const AuthResetPasswordContent({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.sizePadding * 2),
          child: Column(
            children: [
              AuthHeader(
                sizeWidth: sizeWidth,
                textButtonHeader: "Login",
                pathLogo: AppAssets.shortLogoPath,
                textTitle: "Reset Kata Sandi",
                textSubTitle: "Tolong isi untuk membuat kata sandi baru",
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                )),
              ),
              const MySeparated(
                sizeHeight: AppSizes.sizeHeightDefault + 2,
                sizeWidth: AppSizes.sizeHeightDefault,
              ),
              const AuthFormResetPassword(),
              const SizedBox(
                height: AppSizes.sizePadding * 5,
              ),
              MyCustomButton(
                  text: "Reset Kata Sandi",
                  onPressed: () {},
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
