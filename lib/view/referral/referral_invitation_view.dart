import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:satujuta_app_mobile/app/widget/my_button_with_icon.dart';
import 'package:satujuta_app_mobile/app/widget/my_container_circle.dart';
import 'package:satujuta_app_mobile/app/widget/my_custom_text.dart';
import 'package:satujuta_app_mobile/app/widget/my_icon.dart';
import 'package:satujuta_app_mobile/app/widget/my_separated.dart';
import 'package:satujuta_app_mobile/app/widget/my_short_card.dart';
import 'package:satujuta_app_mobile/view/molecules/referral_Invitation/my_invite_button.dart';
import 'package:satujuta_app_mobile/view/organisms/referral_inivitation/wrap._code_referral.dart';

import '../../app/const/app_consts.dart';
import '../../app/const/app_sizes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../molecules/referral_Invitation/circle_user.dart';
import '../molecules/referral_Invitation/my_button_with_custom_icon.dart';
import '../../app/widget/my_icon_button.dart';
import '../molecules/referral_Invitation/my_text_line.dart';

class ReferralInvitationView extends StatefulWidget {
  final PageStateEnum pageState;

  const ReferralInvitationView({Key? key, required this.pageState}) : super(key: key);

  static const String viewAsMeRouteName = '/my-referral-invitation';

  const ReferralInvitationView.viewAsMe({
    Key? key,
    this.pageState = PageStateEnum.viewAsMe,
  }) : super(key: key);

  @override
  State<ReferralInvitationView> createState() => _ReferralInvitationViewState();
}

class _ReferralInvitationViewState extends State<ReferralInvitationView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.baseLv7,
      ),
    );

    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.baseLv7,
      title: title(),
    );
  }

  Widget title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        backButton(),
        Text(
          'Undang Teman',
          style: AppTextStyle.bold(context, fontSize: 18),
        ),
        moreButton(),
      ],
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
      icon: Icons.more_horiz,
      iconSize: 18,
      iconColor: AppColors.base,
      backgroundColor: AppColors.white,
      padding: const EdgeInsets.all(AppSizes.padding / 2),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WrapContentCodeRef(
            title: 'Dapatkan Komisi 10%',
            subtitle: 'Dengan Cara Mengundang Member Baru',
            // button
            textButton: 'Copy Kode Referral',
            icon: Icons.copy,
            functionButton: () {},
          ),
          WrapInviteFriend(
            context: context,
          )
        ],
      ),
    );
  }

  Widget background() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/background/bg-ref')),
      ),
    );
  }
}

class WrapInviteFriend extends StatelessWidget {
  const WrapInviteFriend({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          child: Column(
            children: [
              MyTextLine(
                title: MyCustomText(
                  text: 'Undang Teman Anda',
                  style: AppTextStyle.bold(context, color: AppColors.base, fontSize: 20),
                ),
                gap: 8,
                subTitle: MyCustomText(
                  text: 'Lorem ipsum dolor sit amet, consectetur',
                  style: AppTextStyle.regular(context, color: AppColors.baseLv5, fontSize: 14),
                ),
              ),
              MySeparated(sizeWidth: 0, sizeHeight: 8),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: MyInviteButton(
                  functionButton: () {},
                  leadingButton: CircleUser(),
                  textButton: 'Undang Lebih Banyak',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
