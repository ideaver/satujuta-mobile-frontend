import 'package:flutter/material.dart';

class MyAssetImage extends StatelessWidget {
  final String path;
  final double widthImage;

  const MyAssetImage({
    super.key,
    required this.path,
    required this.widthImage,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: widthImage,
      height: widthImage,
    );
  }
}
