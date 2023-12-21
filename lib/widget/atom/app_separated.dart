import 'package:flutter/material.dart';

class AppSeparated extends StatelessWidget {
  const AppSeparated({super.key, required this.sizeWidth, required this.sizeHeight});
  final double sizeWidth;
  final double sizeHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeWidth,
      height: sizeHeight,
    );
  }
}
