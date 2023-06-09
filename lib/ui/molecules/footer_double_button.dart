import 'package:flutter/material.dart';

import '../atoms/my_button_left.dart';
import '../atoms/my_button_right.dart';
import '../foundations/foundation_size.dart';

class FooterDoubleButton extends StatelessWidget {
  const FooterDoubleButton({
    super.key,
    required this.textLeftButton,
    required this.textRightButton,
    required this.onPressedLeftButton,
    required this.onPressedRightButton,
  });
  final String textLeftButton;
  final String textRightButton;
  final VoidCallback onPressedLeftButton;
  final VoidCallback onPressedRightButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onPressedLeftButton,
            child: MyButtonLeft(textLeftButton: textLeftButton),
          ),
        ),
        const SizedBox(
          width: FoundationSize.sizeHeightDefault / 2,
        ),
        Expanded(
          child: InkWell(
            onTap: onPressedRightButton,
            child: MyButtonRight(textRightButton: textRightButton),
          ),
        ),
      ],
    );
  }
}
