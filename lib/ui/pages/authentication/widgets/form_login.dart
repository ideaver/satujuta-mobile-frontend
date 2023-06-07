import 'package:flutter/material.dart';

import '../../../../constant.dart';
import '../../../../tokens/links.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/my_text_field.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
  });

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
                        child: MyTextField(
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
                        child: MyTextField(
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
        const SizedBox(
          height: kHeight * 6,
        ),
        ButtonWidget(onPressed: () {}, text: "Masuk"),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
