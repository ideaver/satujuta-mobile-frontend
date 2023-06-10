import 'package:flutter/material.dart';

import '../../../app/const/app_assets.dart';
import '../../atoms/my_custom_button.dart';
import '../../atoms/my_custom_form.dart';
import '../../atoms/my_separated.dart';
import '../../foundations/foundation_colors.dart';
import '../../foundations/foundation_size.dart';

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
                  color: FoundationColor.bgWhite,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border:
                      Border.all(width: 1, color: FoundationColor.bgColorGrey),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: MyCustomForm(
                        suffixIcon: IconButton(
                          icon: Image.asset(AppAssets.contactFormIconPath),
                          onPressed: () {},
                        ),
                        click: () {},
                        lableText: 'Email',
                      ),
                    ),
                    const Divider(
                      color: FoundationColor.bgColorGrey,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: MyCustomForm(
                        suffixIcon: IconButton(
                          icon: Image.asset(AppAssets.lockFormIconPath),
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
        const MySeparated(
          sizeHeight: FoundationSize.sizeHeightDefault * 6,
          sizeWidth: FoundationSize.sizeHeightDefault,
        ),
        MyCustomButton(
          onPressed: () {},
          text: "Masuk",
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
        ),
        const MySeparated(
          sizeHeight: FoundationSize.sizeHeightDefault * 2,
          sizeWidth: FoundationSize.sizeHeightDefault,
        ),
      ],
    );
  }
}
