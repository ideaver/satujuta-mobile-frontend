import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/constant.dart';
import 'package:satujuta_app_mobile/ui/onboarding/onboarding_page.dart';

import '../../../shared/link_images_utils.dart';

class SplashScreenContent extends StatefulWidget {
  const SplashScreenContent({super.key});

  @override
  State<SplashScreenContent> createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent> {
  _loadNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingPage(),
        ),
        (route) => false);
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
        color: kColorPrimary,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Center(
              child: Transform.rotate(
                angle: .6,
                child: Container(
                  width: size.width * .7,
                  height: size.width * .7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kHeight * 20),
                    color: kColorWhite.withAlpha(10),
                  ),
                ),
              ),
            ),
            Center(
              child: Image.asset(
                LinkImageUtils.shortLogoUrl,
              ),
            )
          ],
        ),
      ),
    );
  }
}
