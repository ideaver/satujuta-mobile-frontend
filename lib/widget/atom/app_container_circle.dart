import "package:flutter/material.dart";

class AppContainerCircle extends StatelessWidget {
  const AppContainerCircle({
    super.key,
    this.size,
    this.border,
    this.imageUrl,
    this.color,
  });

  final double? size;
  final String? imageUrl;
  final BoxBorder? border;
  final Color? color;

  @override
  Widget build(BuildContext context) {
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
