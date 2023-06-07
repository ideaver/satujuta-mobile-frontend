import 'package:flutter/material.dart';

class Separated extends StatelessWidget {
  const Separated({super.key, required this.width, required this.height});
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
