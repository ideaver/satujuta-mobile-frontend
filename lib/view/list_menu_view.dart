import 'package:flutter/material.dart';

import '../app/route/app_routes.dart';
import '../app/theme/app_colors.dart';
import '../app/theme/app_text_style.dart';

// TODO REMOVE
// DEV PUSPOSE ONLY
class ListMenuView extends StatelessWidget {
  const ListMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          ...List.generate(AppRoutes.routes.length, (index) {
            return ListTile(
              tileColor: index.isOdd ? AppColors.baseLv7 : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 12,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.routes.entries.elementAt(index).key,
                );
              },
              title: Text(
                AppRoutes.routes.entries
                    .elementAt(index)
                    .key
                    .substring(1)
                    .replaceAll('-', ' ')
                    .toUpperCase(),
                style: AppTextStyle.bold(context),
              ),
              trailing: const Icon(
                Icons.arrow_forward,
                color: AppColors.base,
              ),
            );
          }),
          // ListContent(
          //   onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => const LoginScreen(),
          //   )),
          //   title: "Login",
          // ),
          // ListContent(
          //   onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => const ResetPasswordScreen(),
          //   )),
          //   title: "Forgot Password",
          // ),
          // ListContent(
          //   onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => const RegisterScreen(),
          //   )),
          //   title: "Register",
          // ),
          // ListContent(
          //   onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => const HotelPickerScreen(),
          //   )),
          //   title: "Hotel Picker",
          // ),
          // ListContent(
          //   onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => const StudentRegistrationScreen(),
          //   )),
          //   title: "Student Registration",
          // ),
          // ListContent(
          //   onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => const CheckoutScreen(),
          //   )),
          //   title: "Checkout",
          // ),
        ],
      )),
    ));
  }
}

// class ListContent extends StatelessWidget {
//   const ListContent({
//     super.key,
//     required this.onPressed,
//     required this.title,
//   });

//   final VoidCallback onPressed;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: onPressed,
//       title: Text(title),
//       trailing: const Icon(Icons.arrow_forward),
//     );
//   }
// }
