import "package:flutter/material.dart";

// ignore: must_be_immutable
class MyContainerCircle extends StatelessWidget {
  MyContainerCircle({
    this.size,
    this.border,
    this.imageUrl,
    this.color,
  });

  double? size;
  String? imageUrl;
  BoxBorder? border;
  Color? color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl!),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        border: border,
        color: color,
      ),
    );
  }
}
