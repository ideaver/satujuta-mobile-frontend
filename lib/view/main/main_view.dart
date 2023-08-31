import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_app_mobile/view/dashboard/dashboard_view.dart';
import 'package:satujuta_app_mobile/widget/molecule/app_navigation_bar.dart';

import '../../app/asset/app_icons.dart';
import '../../app/const/app_consts.dart';
import '../../app/service/locator/service_locator.dart';
import '../../app/service/network_checker/network_checker_service.dart';
import '../../view_model/main_view_model.dart';
import '../member/member_list_view.dart';
import '../onboarding/onboarding_view.dart';
import '../program_list/program_list_view.dart';
import '../settings/settings_view.dart';
import '../splash/splash_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = '/main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<IconData> navButtonIcons = [
    CustomIcon.dashboard_icon,
    CustomIcon.layer_icon,
    CustomIcon.contact_group_icon,
    CustomIcon.settings_icon,
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final navigator = Navigator.of(context);
      final mainViewModel = locator<MainViewModel>();

      mainViewModel.initMainView(navigator);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<MainViewModel, NetworkCheckerService>(
      builder: (context, mainViewModel, network, _) {
        if (!mainViewModel.isChecking) {
          if (!mainViewModel.isLoggedIn) {
            return const OnboardingView();
          }
        } else {
          return const SplashView();
        }

        return Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              screenSelector(mainViewModel.selectedPageIndex),
              AppNavigationBar(
                index: mainViewModel.selectedPageIndex,
                onTapIcon: mainViewModel.onChangedPage,
                icons: navButtonIcons,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget screenSelector(int i) {
    if (i == 0) {
      return const DashboardView();
    }
    if (i == 1) {
      return const ProgramListView();
    }
    if (i == 2) {
      return const MemberListView(pageState: PageStateEnum.viewAsMe);
    }
    if (i == 3) {
      return const SettingsView();
    }

    return const SizedBox.shrink();
  }
}
