import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/ui/screens/authentication/login_screen.dart';
import 'package:satujuta_app_mobile/ui/screens/hotel_picker/hotel_picker_screen.dart';
import 'package:satujuta_app_mobile/ui/screens/onboarding/onboarding_screen.dart';
import 'package:satujuta_app_mobile/ui/screens/register/register_screen.dart';
import 'package:satujuta_app_mobile/ui/screens/reset_password/reset_password_screen.dart';
import 'package:satujuta_app_mobile/ui/screens/splashscreen/splashscreen_screen.dart';
import 'package:satujuta_app_mobile/ui/screens/student_registration/student_registration_screen.dart';

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
