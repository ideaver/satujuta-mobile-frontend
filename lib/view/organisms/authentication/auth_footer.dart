import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../app/widget/my_custom_text.dart';
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
              style: AppTextStyle.medium(
                context,
                color: AppColors.base,
              ).copyWith(fontSize: 14),
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
                style: AppTextStyle.medium(
                  context,
                  color: AppColors.base,
                ).copyWith(fontSize: 14, color: AppColors.primary),
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
