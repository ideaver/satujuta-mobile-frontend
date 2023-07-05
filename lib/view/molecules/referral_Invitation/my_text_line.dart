import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/const/app_sizes.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../app/widget/my_custom_text.dart';

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
