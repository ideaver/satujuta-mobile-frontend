import 'package:flutter/material.dart';

import '../widget/atom/app_dialog.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<bool> login() async {
    // TODO
    return true;
  }

  void showLoginErrorDialog(NavigatorState navigator, {String? error, String? customMessage}) {
    var errorMessage = error.toString().length > 50 ? error.toString().substring(0, 50) : error.toString();

    var defaultMessage = "Something went wrong, please contact your system administrator or try restart the app";

    var message = customMessage ?? defaultMessage;

    logOut(navigator);

    AppDialog.showErrorDialog(navigator, message: message, error: errorMessage);
  }

  void logOut(NavigatorState navigator) async {}
}
