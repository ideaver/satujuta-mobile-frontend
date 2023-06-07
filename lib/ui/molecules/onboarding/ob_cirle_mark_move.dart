import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_colors.dart';
import 'package:satujuta_app_mobile/ui/foundations/foundation_size.dart';

class ObCircleMarkMove extends StatelessWidget {
  const ObCircleMarkMove({super.key, required this.state});
  final bool state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          color: state
              ? FoundationColor.markedColorOnboarding
              : FoundationColor.unmarkedColorOnboarding,
          border: Border.all(
            color: FoundationColor.primaryApp,
            width: FoundationSize.sizeWidthBorder,
          ),
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
