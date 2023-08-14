import 'package:flutter/cupertino.dart';

import '../../../../app/theme/app_sizes.dart';
import '../../../../widget/atom/app_button.dart';

Widget changeButton(String text, dynamic functionButton) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: AppSizes.padding / 1.5,
    ),
    child: AppButton(text: text, onTap: functionButton),
  );
}
