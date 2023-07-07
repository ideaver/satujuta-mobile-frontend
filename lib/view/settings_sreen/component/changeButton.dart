import 'package:flutter/cupertino.dart';

import '../../../app/const/app_sizes.dart';
import '../../../app/widget/app_button.dart';

Widget changeButton(String text, dynamic functionButton) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: AppSizes.padding * 5,
      vertical: AppSizes.padding / 2,
    ),
    child: AppButton(text: text, onTap: functionButton),
  );
}
