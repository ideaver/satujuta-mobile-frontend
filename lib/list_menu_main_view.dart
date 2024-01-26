import 'package:flutter/material.dart';

import 'app/theme/app_sizes.dart';
import 'app/theme/app_text_style.dart';
import 'list_menu_view.dart';
import 'view/onboarding/onboarding_view.dart';
import 'widget/atom/app_button.dart';

class ListMenuMainView extends StatefulWidget {
  const ListMenuMainView({Key? key}) : super(key: key);

  static const String routeName = '/list-menu-main-view';

  @override
  State<ListMenuMainView> createState() => _ListMenuMainViewState();
}

class _ListMenuMainViewState extends State<ListMenuMainView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body(),
      ),
    );
  }

// TODO REMOVE
// DEV PUSPOSE ONLY
  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LaundryNet',
                    style: AppTextStyle.extraBold(context),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'LaundryNet Mobile Customer',
                    style: AppTextStyle.medium(context, fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: AppButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnboardingView(),
                  ),
                ),
                text: "Main View",
              ),
            ),
            const SizedBox(height: AppSizes.padding),
            SizedBox(
              width: double.infinity,
              child: AppButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListMenuView(),
                  ),
                ),
                text: "List Pages",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
