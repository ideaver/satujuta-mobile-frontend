import 'package:flutter/material.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../onboarding/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String routeName = '/splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  _loadNextScreen() async {
    final navigator = Navigator.of(context);

    await Future.delayed(const Duration(milliseconds: 3000));
    navigator.push(
      MaterialPageRoute(
        builder: (context) => const OnboardingView(),
      ),
    );
  }

  @override
  void initState() {
    _loadNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
