import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_colors.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_size.dart';
import 'package:satujuta_app_mobile/ui/organisms/authentication/auth_footer.dart';
import 'package:satujuta_app_mobile/ui/organisms/authentication/auth_form.dart';
import 'package:satujuta_app_mobile/ui/screens/reset_password/reset_password_screen.dart';

import '../foundations/foundation_links.dart';
import '../organisms/auth_header.dart';

class AuthLoginContent extends StatelessWidget {
  const AuthLoginContent({super.key});

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
                pathLogo: FoundationLinks.linkLongLogo,
                textButtonHeader: "Lupa Password",
                textTitle: "Selamat Datang",
                textSubTitle: "Masukkan Info login untuk Akses Member Area",
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ResetPasswordScreen(),
                )),
              ),
              const AuthForm(),
              const AuthFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
