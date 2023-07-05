import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextLine extends StatelessWidget {
  MyTextLine({Key? key, this.title, this.subTitle, this.gap}) : super(key: key);

  Widget? title;
  Widget? subTitle;
  double? gap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
