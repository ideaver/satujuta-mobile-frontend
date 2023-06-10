import 'package:flutter/material.dart';

import '../../atoms/my_custom_text.dart';
import '../../foundations/foundation_colors.dart';
import '../../foundations/foundation_typhography.dart';
import '../../screens/register/register_screen.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCustomText(
              text: "Belum memiliki Akses?",
              style: FoundationTyphography.darkFontSemibold
                  .copyWith(fontSize: FoundationTyphography.fontSizeH4),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RegisterScreen(),
                  ),
                );
              },
              child: MyCustomText(
                text: " Daftar",
                style: FoundationTyphography.darkFontSemibold.copyWith(
                    fontSize: FoundationTyphography.fontSizeH4,
                    color: FoundationColor.bgPrimary),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
