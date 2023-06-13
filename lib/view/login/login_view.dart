import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/widget/app_button.dart';

import '../../app/const/app_assets.dart';
import '../../app/const/app_sizes.dart';
import '../../app/widget/my_icon_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyIconButton(
              onPressed: () {
                // TODO
              },
              path: AppAssets.lockIconPath,
              sizeImage: AppSizes.padding * 3,
            ),
            AppButton(
              text: 'Lupa Password',
              onTap: () {
                // TODO
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.padding * 2),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
