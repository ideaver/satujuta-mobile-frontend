import 'package:flutter/material.dart';

class RefTextLine extends StatelessWidget {
  const RefTextLine({
    super.key,
    this.title,
    this.subTitle,
    this.gap,
  });

  final Widget? title;
  final Widget? subTitle;
  final double? gap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title!,
          SizedBox(
            height: gap,
          ),
          subTitle!
        ],
      ),
    );
  }
}
