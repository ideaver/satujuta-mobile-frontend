import 'package:flutter/material.dart';

import '../constant.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width * .8,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
          child: Center(
            child: Text(
              text,
              style: whiteJakartaText.copyWith(
                  fontSize: kFontSizeMediumLarge, fontWeight: semiBold),
            ),
          ),
        ),
      ),
    );
  }
}
