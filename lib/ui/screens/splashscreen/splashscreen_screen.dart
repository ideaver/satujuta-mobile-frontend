import 'package:flutter/material.dart';

import '../../organisms/splashscreen/sp_content.dart';
import '../../ui.dart';

class SplashScreenScreen extends StatefulWidget {
  const SplashScreenScreen({super.key});

  @override
  State<SplashScreenScreen> createState() => _SplashScreenScreenState();
}

class _SplashScreenScreenState extends State<SplashScreenScreen> {
  _loadNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
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
      body: SpContent(sizeQuery: size),
    );
  }
}
