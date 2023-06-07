import 'package:flutter/material.dart';

class ObSeparated extends StatelessWidget {
  const ObSeparated({super.key, required this.width, required this.height});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
