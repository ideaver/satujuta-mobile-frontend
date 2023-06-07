import 'package:flutter/material.dart';

import 'my_asset_image.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton(
      {super.key,
      required this.onPressed,
      required this.path,
      required this.sizeImage});
  final VoidCallback onPressed;
  final String path;
  final double sizeImage;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: MyAssetImage(
          path: path,
          widthImage: sizeImage,
        ));
  }
}
