import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_colors.dart';
import 'package:satujuta_app_mobile/ui/screens/check_screen/check_screen.dart';
import 'package:satujuta_app_mobile/ui/screens/hotel_picker/hotel_picker_screen.dart';
import 'package:satujuta_app_mobile/ui/screens/list_check_screen/list_check_screen.dart';
import 'package:satujuta_app_mobile/ui/screens/student_registration/student_registration_screen.dart';

import 'ui/ui.dart';

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
