import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  const MyIcon({super.key, required this.size, required this.iconData});

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
