// import 'package:flutter/material.dart';

// import '../../../app/asset/app_assets.dart';
// import '../../../app/theme/app_colors.dart';
// import '../../../app/theme/app_sizes.dart';
// import '../../atom/app_custom_button.dart';
// import '../../atom/app_separated.dart';
// import '../../atom/app_text_field.dart';

// class AuthForm extends StatelessWidget {
//   const AuthForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ConstrainedBox(
//           constraints: const BoxConstraints(maxHeight: 200, minHeight: 200),
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: [
//               Container(
//                 height: 200,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: AppColors.white,
//                   borderRadius: const BorderRadius.all(Radius.circular(30)),
//                   border: Border.all(width: 1, color: AppColors.baseLv4),
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(15),
//                       child: AppTextField(
//                         suffixIcon: IconButton(
//                           icon: Image.asset(AppAssets.contactFormIconPath),
//                           onPressed: () {},
//                         ),
//                         onTap: () {},
//                         lableText: 'Email',
//                       ),
//                     ),
//                     const Divider(
//                       color: AppColors.baseLv4,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(15),
//                       child: AppTextField(
//                         suffixIcon: IconButton(
//                           icon: Image.asset(AppAssets.lockFormIconPath),
//                           onPressed: () {},
//                         ),
//                         onTap: () {},
//                         lableText: 'Password',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const AppSeparated(
//           sizeHeight: AppSizes.height * 6,
//           sizeWidth: AppSizes.height,
//         ),
//         AppCustomButton(
//           onPressed: () {},
//           text: "Masuk",
//           decoration: BoxDecoration(
//             color: Theme.of(context).primaryColor,
//             borderRadius: const BorderRadius.all(Radius.circular(30)),
//           ),
//         ),
//         const AppSeparated(
//           sizeHeight: AppSizes.height * 2,
//           sizeWidth: AppSizes.height,
//         ),
//       ],
//     );
//   }
// }
