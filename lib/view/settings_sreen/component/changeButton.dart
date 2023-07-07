import 'package:flutter/cupertino.dart';

import '../../../app/const/app_sizes.dart';
import '../../../app/widget/app_button.dart';

Widget changeButton(String text, dynamic functionButton) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: AppSizes.padding / 1.5,
    ),
    child: AppButton(text: text, onTap: functionButton),
  );
}
