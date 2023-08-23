import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import 'app_widget_list_wrapper.dart';

class AppExpansionListTile extends StatefulWidget {
  final String title;
  final IconData? icon;
  final Color? backgroundColor;
  final bool expand;
  final List<Widget> children;

  const AppExpansionListTile({
    Key? key,
    required this.children,
    required this.title,
    this.icon,
    this.backgroundColor,
    this.expand = false,
  }) : super(key: key);

  @override
  State<AppExpansionListTile> createState() => _AppExpansionListTileState();
}

class _AppExpansionListTileState extends State<AppExpansionListTile> {
  bool isExpanded = true;

  @override
  void initState() {
    isExpanded = widget.expand;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isExpanded ? null : 54,
      duration: const Duration(milliseconds: 300),
      child: AppWidgetListWrapper(
        backgroundColor: widget.backgroundColor,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                isExpanded = !isExpanded;
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.all(AppSizes.padding),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        widget.icon != null
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  right: AppSizes.padding / 2,
                                ),
                                child: Icon(
                                  widget.icon!,
                                  color: AppColors.baseLv4,
                                  size: 12,
                                ),
                              )
                            : const SizedBox.shrink(),
                        Text(
                          widget.title,
                          style: AppTextStyle.medium(
                            context,
                            fontSize: 12,
                            color: AppColors.baseLv4,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                      color: AppColors.baseLv4,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSizes.padding / 4),
            ...widget.children,
          ],
        ),
      ),
    );
  }
}
