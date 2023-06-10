import 'package:flutter/material.dart';

import 'view/foundations/foundation_colors.dart';
import 'view/screens/check_screen/check_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: FoundationColor.bgPrimary),
        useMaterial3: true,
      ),
      home: const CheckScreen(),
    );
  }
}
