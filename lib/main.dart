import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/constant.dart';
import 'package:satujuta_app_mobile/ui/authentication/login_page.dart';

import 'ui/ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kColorPrimary),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
