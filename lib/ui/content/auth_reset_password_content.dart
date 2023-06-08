import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_custom_button.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_separated.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_size.dart';

import '../foundations/foundation_colors.dart';
import '../foundations/foundation_links.dart';
import '../organisms/auth_header.dart';
import '../organisms/authentication/auth_form_reset_password.dart';
import '../ui.dart';

class AuthResetPasswordContent extends StatelessWidget {
  const AuthResetPasswordContent({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: FoundationColor.bgWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(FoundationSize.sizePadding * 2),
          child: Column(
            children: [
              AuthHeader(
                sizeWidth: sizeWidth,
                textButtonHeader: "Login",
                pathLogo: FoundationLinks.linkShortLogo,
                textTitle: "Reset Kata Sandi",
                textSubTitle: "Tolong isi untuk membuat kata sandi baru",
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                )),
              ),
              const MySeparated(
                sizeHeight: FoundationSize.sizeHeightDefault + 2,
                sizeWidth: FoundationSize.sizeHeightDefault,
              ),
              const AuthFormResetPassword(),
              const SizedBox(
                height: FoundationSize.sizePadding * 5,
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
