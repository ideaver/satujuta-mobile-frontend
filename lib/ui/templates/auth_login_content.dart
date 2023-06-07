import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/organisms/authentication/auth_footer.dart';
import 'package:satujuta_app_mobile/ui/organisms/authentication/auth_form.dart';

import '../organisms/authentication/auth_header.dart';

class AuthLoginContent extends StatelessWidget {
  const AuthLoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AuthHeader(
                sizeWidth: sizeWidth,
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
