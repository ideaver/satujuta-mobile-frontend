import 'package:flutter/material.dart';

class MyAssetImage extends StatelessWidget {
  const MyAssetImage({super.key, required this.path, required this.widthImage});
  final String path;
  final double widthImage;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: widthImage,
      height: widthImage / 2,
    );
  }
}
