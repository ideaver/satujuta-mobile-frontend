import 'package:flutter/material.dart';

import '../../view/checkout/checkout_view.dart';
import '../../view/hotel_picker/hotel_picker_view.dart';
import '../../view/login/login_view.dart';
import '../../view/login/reset_pass_view.dart';
import '../../view/onboarding/onboarding_view.dart';
import '../../view/register/register_view.dart';
import '../../view/splash/splash_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SplashView.routeName: (context) => const SplashView(),
    OnboardingView.routeName: (context) => const OnboardingView(),
    LoginView.routeName: (context) => const LoginView(),
    RegisterView.routeName: (context) => const RegisterView(),
    ResetPassView.routeName: (context) => const ResetPassView(),
    HotelPicker.routeName: (context) => const HotelPicker(),
    CheckoutView.routeName: (context) => const CheckoutView(),
  };
}
