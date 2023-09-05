// import 'package:flutter/material.dart';

// import '../../app/asset/app_assets.dart';
// import '../../app/theme/app_sizes.dart';
// import '../atom/app_button_with_icon.dart';
// import '../atom/app_icon_button.dart';

// class AuthTopBar extends StatelessWidget {
//   const AuthTopBar({
//     super.key,
//     required this.onPressed,
//     required this.text,
//   });

//   final String text;

//   final VoidCallback onPressed;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           AppIconButton(
//             onPressed: () {},
//             imgIcon: AppAssets.lockIconPath,
//             imgIconSize: AppSizes.padding * 3,
//           ),
//           AppButtonWithIcon(
//             onPressed: onPressed,
//             text: text,
//             buttonStyle: const ButtonStyle(),
//           )
//         ],
//       ),
//     );
//   }
// }
