import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../app/service/locator/service_locator.dart';
import '../app/service/network_checker/network_checker_service.dart';
import '../widget/atom/app_dialog.dart';

class LoginViewModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  final network = locator<NetworkCheckerService>();

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

    showDialog(
      context: navigator.context,
      barrierDismissible: false,
      builder: (context) {
        return AppDialogWidget(
          title: 'Oops! Something Went Wrong',
          text: '$message\n\n$errorMessage',
        );
      },
    );
  }

  void logOut(NavigatorState navigator) async {}
}
