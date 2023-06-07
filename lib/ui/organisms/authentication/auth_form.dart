import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_custom_button.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_form_custom.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_colors.dart';
import 'package:satujuta_app_mobile/ui/molecules/separated.dart';

import '../../../constant.dart';
import '../../../tokens/links.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200, minHeight: 200),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kColorWhite,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border:
                      Border.all(width: 1, color: FoundationColor.bgColorGrey),
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
        // ConstrainedBox(
        //   constraints: const BoxConstraints(maxHeight: 220, minHeight: 220),
        //   child: Container(
        //     decoration: BoxDecoration(
        //         border: Border.all(
        //           width: 1,
        //           color: kColorGrey,
        //         ),
        //         borderRadius: BorderRadius.circular(kHeight)),
        //     child: ,
        //   ),
        // ),
        const Separated(
          height: kHeight * 6,
          width: kHeight,
        ),
        MyCustomButton(onPressed: () {}, text: "Masuk"),
        const Separated(
          height: kHeight * 2,
          width: kHeight,
        ),
      ],
    );
  }
}
