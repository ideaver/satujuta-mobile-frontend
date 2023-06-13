import 'package:flutter/material.dart';

import '../../../app/const/app_sizes.dart';
import '../../atoms/my_custom_form.dart';

class FormStudentRegistration extends StatelessWidget {
  const FormStudentRegistration({
    super.key,
    required this.label,
    required this.onPressed,
    required this.path,
  });

  final String label;
  final VoidCallback onPressed;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MyCustomForm(
        suffixIcon: IconButton(
          icon: Image.asset(
            path,
            height: AppSizes.sizeIconMini,
          ),
          onPressed: () {},
        ),
        click: onPressed,
        lableText: label,
      ),
    );
  }
}
