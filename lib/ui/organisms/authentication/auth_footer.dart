import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/atoms/my_text_custom.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_typhography.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextCustom(
              text: "Belum memiliki Akses?",
              style: FoundationTyphography.darkFontSemibold
                  .copyWith(fontSize: FoundationTyphography.fontSizeH4),
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => RegisterScreen(),
                //   ),
                // );
              },
              child: MyTextCustom(
                text: " Daftar",
                style: FoundationTyphography.darkFontSemibold.copyWith(
                  fontSize: FoundationTyphography.fontSizeH4,
                ),
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
