import 'package:flutter/material.dart';

import 'app/theme/app_theme.dart';
import 'view/menu_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SatuJuta',
      theme: AppTheme.getTheme(),
      home: const MenuView(),
    );
  }
}
