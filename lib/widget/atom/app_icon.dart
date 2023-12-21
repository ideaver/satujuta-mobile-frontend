import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.size, required this.iconData});

  final double size;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size,
    );
  }
}
