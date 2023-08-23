import 'package:flutter/material.dart';

import '../../../app/theme/app_sizes.dart';
import '../../atom/app_text_field.dart';

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
      child: AppTextField(
        suffixIcon: IconButton(
          icon: Image.asset(
            path,
            height: AppSizes.padding * 2,
          ),
          onPressed: () {},
        ),
        onTap: onPressed,
        lableText: label,
      ),
    );
  }
}
