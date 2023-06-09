import 'package:flutter/material.dart';

import '../../atoms/my_custom_form.dart';
import '../../foundations/foundation_size.dart';

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
            height: FoundationSize.sizeIconMini,
          ),
          onPressed: () {},
        ),
        click: onPressed,
        lableText: label,
      ),
    );
  }
}
