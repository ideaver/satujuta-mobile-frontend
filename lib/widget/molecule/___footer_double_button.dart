// import 'package:flutter/material.dart';

// import '../../app/theme/app_sizes.dart';
// import '../atom/app_button_left.dart';
// import '../atom/app_button_right.dart';

// class FooterDoubleButton extends StatelessWidget {
//   const FooterDoubleButton({
//     super.key,
//     required this.textLeftButton,
//     required this.textRightButton,
//     required this.onPressedLeftButton,
//     required this.onPressedRightButton,
//   });

//   final String textLeftButton;
//   final String textRightButton;
//   final VoidCallback onPressedLeftButton;
//   final VoidCallback onPressedRightButton;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: InkWell(
//             onTap: onPressedLeftButton,
//             child: AppButtonLeft(textLeftButton: textLeftButton),
//           ),
//         ),
//         const SizedBox(
//           width: AppSizes.height / 2,
//         ),
//         Expanded(
//           child: InkWell(
//             onTap: onPressedRightButton,
//             child: AppButtonRight(textRightButton: textRightButton),
//           ),
//         ),
//       ],
//     );
//   }
// }
