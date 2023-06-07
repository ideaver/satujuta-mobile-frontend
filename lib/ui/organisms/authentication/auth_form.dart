import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_custom_button.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_form_custom.dart';
import 'package:satujuta_app_mobile/ui/molecules/authentications/auth_separated.dart';

import '../../../constant.dart';
import '../../../tokens/links.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 220, minHeight: 220),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: kPadding * 2),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: kColorGrey,
                ),
                borderRadius: BorderRadius.circular(kHeight)),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: 210,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: kColorWhite,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: MyFormCustom(
                          suffixIcon: IconButton(
                            icon: Image.asset(Links.contactFormIconUrl),
                            onPressed: () {},
                          ),
                          click: () {},
                          lableText: 'Email',
                        ),
                      ),
                      const Divider(
                        color: kColorGrey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: MyFormCustom(
                          suffixIcon: IconButton(
                            icon: Image.asset(Links.lockFormIconUrl),
                            onPressed: () {},
                          ),
                          click: () {},
                          lableText: 'Password',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const AuthSeparated(
          height: kHeight * 6,
          width: kHeight,
        ),
        MyCustomButton(onPressed: () {}, text: "Masuk"),
        const AuthSeparated(
          height: kHeight * 2,
          width: kHeight,
        ),
      ],
    );
  }
}
