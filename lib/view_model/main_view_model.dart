import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/view_model/program_list_view_model.dart';

import '../app/service/auth/auth_service.dart';
import '../app/service/locator/service_locator.dart';
import '../app/service/network_checker/network_checker_service.dart';
import '../app/utility/console_log.dart';
import '../widget/atom/app_dialog.dart';
import 'login_view_model.dart';
import 'member_list_view_model.dart';
import 'user_view_model.dart';

class MainViewModel extends ChangeNotifier {
  // Singleton services
  final network = locator<NetworkCheckerService>();
  final userViewModel = locator<UserViewModel>();
  final programListViewModel = locator<ProgramListViewModel>();
  final memberListViewModel = locator<MemberListViewModel>();

  bool isChecking = true;
  bool isLoggedIn = true;

  int selectedPageIndex = 0;

  // For log out purpose
  void resetState() {
    isLoggedIn = false;
    selectedPageIndex = 0;

    // Reset singleton services
    userViewModel.resetState();
    programListViewModel.resetState();
    memberListViewModel.resetState();
  }

  Future<void> checkIsLoggedIn() async {
    await AuthService.initAuth();

    // TODO
    // login user
    // if (AuthService.auth != null) {
    //   isLoggedIn = true;
    // } else {
    //   isLoggedIn = false;
    // }

    isLoggedIn = true;

    cl('isLoggedIn = $isLoggedIn');

    isChecking = false;
    notifyListeners();
  }

  void initMainView(NavigatorState navigator) async {
    await network.initNetworkChecker(navigator: navigator, onHasInternet: (isHasInternet) {});
    await checkIsLoggedIn();
    await refreshMainView(navigator);
  }

  Future<void> refreshMainView(NavigatorState navigator) async {
    try {
      if (isLoggedIn) {
        await userViewModel.getUser();

        // check is user exist
        if (userViewModel.user == null) {
          showLoginErrorDialog(
            navigator,
            error: 'User Null',
          );
          return;
        }

        await programListViewModel.getAllPrograms();
        await memberListViewModel.getAllUserMembers();
      }
    } catch (e) {
      cl(e);
      showLoginErrorDialog(navigator, error: e.toString());
    }
  }

  void onChangedPage(int i) {
    selectedPageIndex = i;
    notifyListeners();
  }

  void showLoginErrorDialog(NavigatorState navigator, {String? error, String? customMessage}) {
    var errorMessage = error.toString().length > 50 ? error.toString().substring(0, 50) : error.toString();

    var defaultMessage = "Something went wrong, please contact your system administrator or try restart the app";

    var message = customMessage ?? defaultMessage;

    final loginViewModel = locator<LoginViewModel>();
    loginViewModel.logOut(navigator);

    AppDialog.showErrorDialog(
      navigator,
      error: '$message\n\n$errorMessage',
    );
  }
}
