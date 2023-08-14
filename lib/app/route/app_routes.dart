import 'package:flutter/material.dart';

import '../../view/dashboard/dashboard_view.dart';
import '../../view/login/login_view.dart';
import '../../view/login/reset_pass_view.dart';
import '../../view/main/main_view.dart';
import '../../view/register/register_view.dart';
import '../../view/splash/splash_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SplashView.routeName: (context) => const SplashView(),
    MainView.routeName: (context) => const MainView(),
    LoginView.routeName: (context) => const LoginView(),
    ResetPassView.routeName: (context) => const ResetPassView(),
    RegisterView.routeName: (context) => const RegisterView(),
    DashboardView.routeName: (context) => const DashboardView(),
  };
}
