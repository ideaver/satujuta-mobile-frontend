import 'package:flutter/material.dart';

import '../../../../constant.dart';

class FooterLogin extends StatelessWidget {
  const FooterLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Belum memiliki Akses?",
              style: darkJakartaText.copyWith(
                  fontSize: kFontSizeMedium, fontWeight: semiBold),
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
              child: Text(
                " Daftar",
                style: darkJakartaText.copyWith(
                    color: kColorPrimary,
                    fontSize: kFontSizeMedium,
                    fontWeight: semiBold),
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
