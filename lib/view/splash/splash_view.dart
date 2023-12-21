import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/asset/app_assets.dart';
import '../../app/theme/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String routeName = '/splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.primary),
    );

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: AppColors.primary,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Center(
              child: Transform.rotate(
                angle: .6,
                child: Container(
                  width: size.width * 2.6,
                  height: size.width * 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: AppColors.white.withAlpha(10),
                  ),
                ),
              ),
            ),
            Center(
              child: Image.asset(
                AppAssets.shortLogoPath,
              ),
            )
          ],
        ),
      ),
    );
  }
}
