import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/const/app_sizes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../app/widget/my_icon_button.dart';

class ReferralInvitationView extends StatefulWidget {
  const ReferralInvitationView({Key? key}) : super(key: key);

  static const String routeName = '/referral-invitation';

  @override
  State<ReferralInvitationView> createState() => _ReferralInvitationViewState();
}

class _ReferralInvitationViewState extends State<ReferralInvitationView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          background(),
          apppBar(),
          body(),
        ],
      ),
    );
  }

  Widget apppBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding,
          vertical: AppSizes.padding / 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            backButton(),
            Text(
              'Undang Teman',
              style: AppTextStyle.bold(context, fontSize: 18),
            ),
            moreButton(),
          ],
        ),
      ),
    );
  }

  Widget backButton() {
    return AppIconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icons.arrow_back_ios_rounded,
      iconSize: 18,
      iconColor: AppColors.base,
      backgroundColor: AppColors.white,
      padding: const EdgeInsets.all(AppSizes.padding / 2),
    );
  }

  Widget moreButton() {
    return AppIconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icons.more_vert_rounded,
      iconSize: 18,
      iconColor: AppColors.base,
      backgroundColor: AppColors.white,
      padding: const EdgeInsets.all(AppSizes.padding / 2),
    );
  }

  Widget body() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
      ],
    );
  }

  Widget background() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}
