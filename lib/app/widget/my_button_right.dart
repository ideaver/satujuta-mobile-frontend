import 'package:flutter/material.dart';

import '../../app/theme/app_text_style.dart';

class MyButtonRight extends StatelessWidget {
  const MyButtonRight({
    super.key,
    required this.textRightButton,
  });

  final String textRightButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(30)),
        ),
        child: Center(
          child: Text(textRightButton, style: AppTextStyle.bold(context)),
        ),
      ),
    );
  }
}
