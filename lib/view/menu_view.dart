import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/theme/app_text_style.dart';
import 'package:satujuta_app_mobile/view/splash/splash_view.dart';

import '../app/theme/app_colors.dart';
import 'screens/../list_menu_view.dart';

// TODO REMOVE
// DEV PUSPOSE ONLY
class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashView(),
                ),
              ),
              child: Text(
                "Main app",
                style: AppTextStyle.bold(context, color: AppColors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListMenuView(),
                ),
              ),
              child: Text(
                "List Page",
                style: AppTextStyle.bold(context, color: AppColors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
