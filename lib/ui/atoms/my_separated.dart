import 'package:flutter/material.dart';

class MySeparated extends StatelessWidget {
  const MySeparated(
      {super.key, required this.sizeWidth, required this.sizeHeight});
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
