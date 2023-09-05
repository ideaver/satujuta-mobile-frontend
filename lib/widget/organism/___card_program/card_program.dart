// import 'package:flutter/material.dart';

// import '../../../app/theme/app_colors.dart';
// import '../../../app/theme/app_sizes.dart';
// import '../../../app/theme/app_text_style.dart';
// import '../../atom/app_icon_button.dart';

// class CardProgram extends StatefulWidget {
//   final String? title;
//   final String? subtitle;
//   final String? bottomTitle;
//   final String? bottomsubtitle;
//   final IconData? iconProgram;
//   final Color? bottomTitleColor;
//   final Color? bottomSubtitleColor;
//   final List<BoxShadow>? boxShadow;
//   final void Function()? onTapCard;
//   final void Function()? onTapInfo;

//   const CardProgram({
//     super.key,
//     this.title,
//     this.bottomTitle,
//     this.bottomSubtitleColor,
//     this.bottomTitleColor,
//     this.bottomsubtitle,
//     this.subtitle,
//     this.iconProgram,
//     this.onTapCard,
//     this.onTapInfo,
//     this.boxShadow,
//   });

//   @override
//   State<CardProgram> createState() => _CardProgramState();
// }

// class _CardProgramState extends State<CardProgram> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
//       child: Ink(
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(AppSizes.radius * 2),
//           boxShadow: widget.boxShadow ?? [],
//         ),
//         child: InkWell(
//           onTap: widget.onTapCard ?? () {},
//           splashColor: AppColors.baseLv6.withOpacity(0.95),
//           borderRadius: BorderRadius.circular(AppSizes.radius),
//           child: Padding(
//             padding: const EdgeInsets.all(AppSizes.padding),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     AppIconButton(
//                       onPressed: () {
//                         // TODO
//                       },
//                       icon: widget.iconProgram ?? Icons.campaign_rounded,
//                       iconSize: 24,
//                       backgroundColor: AppColors.baseLv7,
//                       padding: const EdgeInsets.all(AppSizes.padding / 1.5),
//                     ),
//                     AppIconButton(
//                       onPressed: widget.onTapInfo ??
//                           () {
//                             // TODO
//                           },
//                       icon: Icons.info_outline,
//                       iconSize: 16,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: AppSizes.padding / 2),
//                 Text(
//                   widget.title ?? '',
//                   style: AppTextStyle.bold(
//                     context,
//                     fontSize: 18,
//                     color: AppColors.baseLv4,
//                   ),
//                 ),
//                 const SizedBox(height: AppSizes.padding / 4),
//                 Text(
//                   widget.subtitle ?? '',
//                   style: AppTextStyle.extraBold(
//                     context,
//                     fontSize: 36,
//                   ),
//                 ),
//                 const SizedBox(height: AppSizes.padding / 2),
//                 Row(
//                   children: [
//                     Text(widget.bottomTitle ?? '',
//                         style: AppTextStyle.bold(
//                           context,
//                           fontSize: 16,
//                           color: widget.bottomTitleColor ?? Color(0xFF36D362),
//                         )),
//                     const SizedBox(
//                       width: AppSizes.padding / 2,
//                     ),
//                     Text(
//                       widget.bottomsubtitle ?? '',
//                       style: AppTextStyle.medium(
//                         context,
//                         fontSize: 16,
//                         color: AppColors.baseLv5,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
