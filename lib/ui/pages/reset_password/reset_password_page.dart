import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/widgets/button_widget.dart';
import 'package:satujuta_app_mobile/widgets/my_text_field.dart';

import '../../../constant.dart';
import '../../../tokens/links.dart';
import '../../ui.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResetPasswordContent();
  }
}

class ResetPasswordContent extends StatelessWidget {
  const ResetPasswordContent({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            children: [
              headerSection(sizeWidth, context),
              const SizedBox(
                height: kHeight * 4 + 2,
              ),
              Container(
                padding: const EdgeInsets.all(kPadding + 8),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: kColorGrey),
                    borderRadius: BorderRadius.circular(kHeight)),
                child: MyTextField(
                  lableText: "Email",
                  suffixIcon: Image.asset(Links.contactFormIconUrl),
                  click: () {},
                ),
              ),
              const SizedBox(
                height: kPadding * 10,
              ),
              ButtonWidget(
                text: "Reset Kata Sandi",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Column headerSection(double sizeWidth, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {}, icon: Image.asset(Links.lockIconUrl)),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      )),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Login"),
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
        Center(
          child: Container(
            width: sizeWidth * .7,
            margin: const EdgeInsets.symmetric(vertical: kPadding * 4),
            child: Image.asset(
              Links.longLogoUrl,
              width: double.infinity,
            ),
          ),
        ),
        Text(
          "Reset Kata Sandi",
          style: darkJakartaText.copyWith(
              fontSize: kFontSizeTitleLarge, fontWeight: bold),
        ),
        const SizedBox(
          height: kHeight / 2,
        ),
        Text(
          "Tolong isi untuk membuat kata sandi baru",
          style: darkJakartaText.copyWith(
              fontSize: kFontSizeMedium, fontWeight: regular),
        ),
      ],
    );
  }
}
