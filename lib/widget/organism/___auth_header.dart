// import 'package:flutter/material.dart';

// import '../../../app/theme/app_colors.dart';
// import '../../../app/theme/app_sizes.dart';
// import '../../../app/theme/app_text_style.dart';
// import '../atom/app_asset_image.dart';
// import '../atom/app_custom_text.dart';
// import '../atom/app_separated.dart';
// import '../molecule/auth_topbar.dart';

// class AuthHeader extends StatelessWidget {
//   const AuthHeader(
//       {super.key,
//       required this.sizeWidth,
//       required this.textTitle,
//       required this.textSubTitle,
//       required this.onPressed,
//       required this.textButtonHeader,
//       required this.pathLogo});

//   final double sizeWidth;
//   final String textTitle;
//   final String textSubTitle;
//   final String textButtonHeader;
//   final VoidCallback onPressed;
//   final String pathLogo;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         AuthTopBar(
//           onPressed: onPressed,
//           text: textButtonHeader,
//         ),
//         Center(
//           child: Container(
//             width: sizeWidth * .7,
//             margin: const EdgeInsets.symmetric(vertical: AppSizes.padding * 4),
//             child: AppAssetImage(
//               path: pathLogo,
//               widthImage: AppSizes.height * 15,
//             ),
//           ),
//         ),
//         AppCustomText(
//           text: textTitle,
//           style: AppTextStyle.bold(
//             context,
//             color: AppColors.base,
//           ).copyWith(fontSize: 24),
//         ),
//         const AppSeparated(
//           sizeHeight: AppSizes.height / 2,
//           sizeWidth: AppSizes.height,
//         ),
//         AppCustomText(
//           text: textSubTitle,
//           style: AppTextStyle.regular(
//             context,
//             fontSize: 14,
//           ),
//         ),
//         const AppSeparated(
//           sizeHeight: AppSizes.height * 4 + 2,
//           sizeWidth: AppSizes.height,
//         ),
//       ],
//     );
//   }
// }
