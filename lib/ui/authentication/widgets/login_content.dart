import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/constant.dart';
import 'package:satujuta_app_mobile/shared/link_images_utils.dart';
import 'package:satujuta_app_mobile/ui/ui.dart';

import 'footer_login.dart';
import 'form_login.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              headerSection(sizeWidth, context),
              const FormLogin(),
              const FooterLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Column headerSection(double sizeWidth, BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kPadding * 2, vertical: kPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(LinkImageUtils.lockIconUrl)),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ResetPasswordPage(),
                      )),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Lupa Password"),
                      SizedBox(
                        width: kHeight,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: kHeight,
                      )
                    ],
                  ))
            ],
          ),
        ),
        Container(
          width: sizeWidth * .7,
          margin: const EdgeInsets.symmetric(vertical: kPadding * 4),
          child: Image.asset(
            LinkImageUtils.longLogoUrl,
            width: double.infinity,
          ),
        ),
        Text(
          "Selamat Datang",
          style: darkJakartaText.copyWith(
              fontSize: kFontSizeTitleLarge, fontWeight: bold),
        ),
        const SizedBox(
          height: kHeight / 2,
        ),
        Text(
          "Masukkan Info login untuk Akses Member Area",
          style: darkJakartaText.copyWith(
              fontSize: kFontSizeMedium, fontWeight: regular),
        ),
        const SizedBox(
          height: kHeight * 4 + 2,
        ),
      ],
    );
  }
}
