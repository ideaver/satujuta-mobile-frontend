import 'package:flutter/material.dart';

import '../../screens/authentication/login_screen.dart';
import '../../screens/checkout/checkout_screen.dart';
import '../../screens/hotel_picker/hotel_picker_screen.dart';
import '../../screens/onboarding/onboarding_screen.dart';
import '../../screens/register/register_screen.dart';
import '../../screens/reset_password/reset_password_screen.dart';
import '../../screens/splashscreen/splashscreen_screen.dart';
import '../../screens/student_registration/student_registration_screen.dart';

class ListCheckScreen extends StatelessWidget {
  const ListCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          ListContent(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SplashScreen(),
            )),
            title: "Splashscreen",
          ),
          ListContent(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const OnBoardingScreen(),
            )),
            title: "OnBoarding",
          ),
          ListContent(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            )),
            title: "Login",
          ),
          ListContent(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ResetPasswordScreen(),
            )),
            title: "Forgot Password",
          ),
          ListContent(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RegisterScreen(),
            )),
            title: "Register",
          ),
          ListContent(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HotelPickerScreen(),
            )),
            title: "Hotel Picker",
          ),
          ListContent(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const StudentRegistrationScreen(),
            )),
            title: "Student Registration",
          ),
          ListContent(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CheckoutScreen(),
            )),
            title: "Checkout",
          ),
        ],
      )),
    ));
  }
}

class ListContent extends StatelessWidget {
  const ListContent({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward),
    );
  }
}
