import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_custom_text.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    super.key,
    this.titleQuestion,
    this.question,
  });

  final String? titleQuestion;
  final String? question;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool showQuestion = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppSizes.padding / 8,
        horizontal: AppSizes.padding / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppSizes.radius * 1.5,
        ),
        color: AppColors.baseLv7,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.padding - 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    widget.titleQuestion!,
                    style: AppTextStyle.bold(
                      context,
                      fontSize: 14,
                      color: AppColors.base,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showQuestion ? showQuestion = false : showQuestion = true;
                    });
                  },
                  child: Icon(
                    showQuestion ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  ),
                ),
              ],
            ),
          ),
          subtitle: Visibility(
            visible: showQuestion,
            child: AppCustomText(
              text: widget.question!,
              style: AppTextStyle.regular(
                context,
                fontSize: 13,
                color: AppColors.base,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
