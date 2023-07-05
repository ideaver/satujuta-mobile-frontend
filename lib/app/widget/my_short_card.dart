import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class MyShortCard extends StatelessWidget {
  const MyShortCard({super.key, required this.state, required this.text});
  final bool state;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        color: state ? AppColors.primary : AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(66, 181, 178, 178),
            offset: Offset(1, 1),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: state
                ? AppTextStyle.bold(context)
                : AppTextStyle.bold(
                    context,
                    color: AppColors.base,
                  ),
          ),
        ],
      ),
    );
  }
}
