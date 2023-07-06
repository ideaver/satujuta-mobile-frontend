import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:satujuta_app_mobile/app/const/app_assets.dart';
import 'package:satujuta_app_mobile/app/widget/app_expansion_list_tile.dart';
import 'package:satujuta_app_mobile/app/widget/my_custom_text.dart';
import 'package:satujuta_app_mobile/app/widget/my_separated.dart';
import 'package:satujuta_app_mobile/view/molecules/referral_Invitation/my_invite_button.dart';
import 'package:satujuta_app_mobile/view/organisms/referral_inivitation/wrap._code_referral.dart';

import '../../app/const/app_consts.dart';
import '../../app/const/app_sizes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../app/widget/my_icon_button.dart';
import '../molecules/referral_Invitation/circle_user.dart';
import '../molecules/referral_Invitation/my_text_line.dart';
import '../organisms/referral_inivitation/background_referral.dart';

class ReferralInvitationView extends StatefulWidget {
  final PageStateEnum pageState;

  const ReferralInvitationView({Key? key, required this.pageState})
      : super(key: key);

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
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            sliverAppBarWidget(),
          ];
        },
        body: body(),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
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
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Column(
        children: [
          wrapContentReferral(),
          wrapInviteFriend(context),
          wrapReferralCard(),
          wrapListQuestion(),
        ],
      ),
    );
  }

  SliverAppBar sliverAppBarWidget() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            appBar(),
            background(),
          ],
        ),
        expandedTitleScale: 1,
      ),
    );
  }

  Widget background() {
    return BackgroudReferral();
  }

  Widget wrapContentReferral() {
    return WrapContentCodeRef(
      title: 'Dapatkan Komisi 10%',
      subtitle: 'Dengan Cara Mengundang Member Baru',
      // button
      textButton: 'Copy Kode Referral',
      icon: CustomIcon.copy_document,
      functionButton: () {},
      functionShareButton: () {},
      functionRefButton: () {},
    );
  }

Widget wrapListQuestion() {
  return AppExpansionListTile(
    title: 'Pertanyaan yang sering ditanyakan',
    backgroundColor: Colors.white,
    icon: CustomIcon.forum_outlined,
    expand: true,
    children: [
      QuestionCard(
        titleQuestion: 'Bagaimana Cara Gabung Jadi Member SatuJuta?',
        question: 'Lorem ipsum dolor sit amet consectetur. Ipsum in ornare vestibulum sit et ipsum euismod integer sem. In sed turpis arcu est nulla rutrum tortor. Dignissim at vel.',
      ),
      SizedBox(height: AppSizes.height / 3),
      QuestionCard(
        titleQuestion: 'Apa Yang Akan Saya Dapatkan Kalau Bergabung Dengan Komunitas SatuJuta?',
        question: 'Lorem ipsum dolor sit amet consectetur. Ipsum in ornare vestibulum sit et ipsum euismod integer sem. In sed turpis arcu est nulla rutrum tortor. Dignissim at vel.',
      ),
      SizedBox(height: AppSizes.height / 3),
      QuestionCard(
        titleQuestion: 'Bagaimana Cara Dapatkan Poin?',
        question: 'Lorem ipsum dolor sit amet consectetur. Ipsum in ornare vestibulum sit et ipsum euismod integer sem. In sed turpis arcu est nulla rutrum tortor. Dignissim at vel.',
      ),
      SizedBox(height: AppSizes.height / 3),
      QuestionCard(
        titleQuestion: 'Siapa Saja Yang Bisa Daftar Jadi Member SatuJuta?',
        question: 'Lorem ipsum dolor sit amet consectetur. Ipsum in ornare vestibulum sit et ipsum euismod integer sem. In sed turpis arcu est nulla rutrum tortor. Dignissim at vel.',
      ),
    ],
  );
}

Widget wrapReferralCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 2),
    child: Container(
      child:  Column(
        children: [
          ReferralCard(
            title: 'KOMISI BULAN INI',
            subtitle: 'RP 50.000',
          ),
          SizedBox(
            height: AppSizes.padding / 4,
          ),
          ReferralCard(
            title: 'TOTAL REFERRAL ANDA',
            subtitle: '45',
          ),
          SizedBox(
            height: AppSizes.padding / 4,
          ),
          ReferralCard(
            title: 'REFERRAL AKTIF',
            subtitle: '20',
          ),
        ],
      ),
    ),
  );
}

Widget wrapInviteFriend(BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.radius * 2),
    ),
    child: Padding(
      padding: const EdgeInsets.all(AppSizes.padding),
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
              padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
              child: MyInviteButton(
                functionButton: () {},
                leadingButton: CircleUser(
                  imageFriend1: AppAssets.userImage1Path,
                  imageFriend2: AppAssets.userImage2Path,
                  imageFriend3: AppAssets.userImage3Path,
                  countFriend: '9',
                ),
                textButton: 'Undang Lebih Banyak',
              ),
            )
          ],
        ),
      ),
    ),
  );
  
}

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    super.key,
    this.titleQuestion,
    this.question,
  });

  final String? titleQuestion;
  final String? question;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool showQuestion = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppSizes.padding / 8,
        horizontal: AppSizes.padding / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppSizes.radius * 1.5,
        ),
        color: AppColors.baseLv7,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.padding - 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    widget.titleQuestion!,
                    style: AppTextStyle.bold(
                      context,
                      fontSize: 14,
                      color: AppColors.base,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showQuestion ? showQuestion = false : showQuestion = true;
                    });
                  },
                  child: Icon(
                    showQuestion
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                ),
              ],
            ),
          ),
          subtitle: Visibility(
            visible: showQuestion,
            child: MyCustomText(
              text: widget.question!,
              style: AppTextStyle.regular(
                context,
                fontSize: 13,
                color: AppColors.base,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReferralCard extends StatelessWidget {
  const ReferralCard({
    super.key,
    this.title,
    this.subtitle,
  });

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: AppSizes.padding,
        horizontal: AppSizes.padding,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        AppSizes.radius,
      )),
      tileColor: AppColors.baseLv6,
      title: MyCustomText(
          text: title!,
          style: AppTextStyle.bold(
            context,
            fontSize: 12,
            color: AppColors.baseLv4,
          )),
      subtitle: MyCustomText(
          text: subtitle!,
          style: AppTextStyle.bold(
            context,
            fontSize: 24,
            color: AppColors.base,
          )),
      trailing: const CircleAvatar(
        backgroundColor: AppColors.white,
        maxRadius: 25,
        child: Icon(
          CustomIcon.inventory,
          color: AppColors.base,
          size: 20,
        ),
      ),
    );
  }
}




class QuestionCard {
}