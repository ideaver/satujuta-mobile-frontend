import 'package:flutter/material.dart';

import '../../../app/const/app_assets.dart';
import '../../../app/const/app_sizes.dart';
import '../../../app/theme/app_colors.dart';
import '../../atoms/my_custom_button.dart';
import '../../atoms/my_custom_form.dart';
import '../../atoms/my_separated.dart';

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
                  color: AppColors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border.all(width: 1, color: AppColors.baseLv4),
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
                      color: AppColors.baseLv4,
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
          sizeHeight: AppSizes.sizeHeightDefault * 6,
          sizeWidth: AppSizes.sizeHeightDefault,
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
          sizeHeight: AppSizes.sizeHeightDefault * 2,
          sizeWidth: AppSizes.sizeHeightDefault,
        ),
      ],
    );
  }
}
