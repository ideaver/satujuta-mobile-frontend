import 'package:flutter/material.dart';

import '../../organisms/splashscreen/sp_content.dart';
import '../../ui.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
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
      body: SpContent(sizeQuery: size),
    );
  }
}
