import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_gql_client/gql_faq_service.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';

import '../../../../app/asset/app_icons.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../app/const/app_consts.dart';
import '../../../view_model/member_list_view_model.dart';
import '../../../widget/atom/app_expansion_list_tile.dart';
import '../../../widget/organism/referral_inivitation/background_referral.dart';
import '../../../widget/organism/referral_inivitation/wrap._code_referral.dart';
import '../../app/service/locator/service_locator.dart';
import '../../app/utility/currency_formatter.dart';
import '../../view_model/main_view_model.dart';
import '../../view_model/user_view_model.dart';
import '../../widget/atom/app_custom_text.dart';
import '../../widget/atom/app_icon_button.dart';
import '../../widget/atom/app_image.dart';
import '../../widget/atom/app_progress_indicator.dart';
import '../../widget/atom/app_snackbar.dart';
import '../../widget/molecule/referral_Invitation/ref_invite_button.dart';

class MemberInvitationView extends StatefulWidget {
  final PageStateEnum pageState;

  const MemberInvitationView({Key? key, required this.pageState}) : super(key: key);

  static const String viewAsMeRouteName = '/my-referral-invitation';

  const MemberInvitationView.viewAsMe({
    Key? key,
    this.pageState = PageStateEnum.viewAsMe,
  }) : super(key: key);

  @override
  State<MemberInvitationView> createState() => _MemberInvitationViewState();
}

class _MemberInvitationViewState extends State<MemberInvitationView> {
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
    return Consumer<UserViewModel>(builder: (context, model, _) {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
        child: Column(
          children: [
            wrapContentReferral(model),
            wrapInviteFriend(),
            wrapReferralCard(model),
            wrapListQuestion(),
            const SizedBox(height: AppSizes.height * 9)
          ],
        ),
      );
    });
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
    return const BackgroudReferral();
  }

  Widget wrapContentReferral(UserViewModel model) {
    return WrapContentCodeRef(
      title: 'Dapatkan Komisi 10%',
      subtitle: 'Dengan Cara Mengundang Member Baru',
      textButton: 'Copy Kode Referral',
      icon: CustomIcon.copy_document,
      onTapCopyButton: () async {
        final navigator = Navigator.of(context);
        await Clipboard.setData(ClipboardData(text: model.user!.referralCode));
        AppSnackbar.show(navigator, title: 'Kode referral disalin ke clipboard');
      },
      onTapShareButton: () {
        model.shareReferralCode();
      },
      onTapTaskButton: () {},
    );
  }

  Widget wrapListQuestion() {
    return FutureBuilder(
      future: GqlFaqService.faqFindMany(Enum$FaqType.REFERRAL_PAGE),
      builder: (context, snapshot) {
        if (snapshot.data == null || snapshot.data!.isLoading) {
          return const AppProgressIndicator();
        }

        if (snapshot.data!.parsedData == null || snapshot.data!.parsedData!.faqFindMany == null) {
          return const SizedBox.shrink();
        }

        return AppExpansionListTile(
          title: 'Pertanyaan yang sering ditanyakan',
          backgroundColor: Colors.white,
          icon: CustomIcon.forum_outlined,
          expand: true,
          children: [
            ...List.generate(snapshot.data!.parsedData!.faqFindMany!.length, (i) {
              return Padding(
                padding: EdgeInsets.only(top: i == 0 ? 0 : AppSizes.height / 3),
                child: QuestionCard(
                  titleQuestion: snapshot.data!.parsedData!.faqFindMany![i].name,
                  question: snapshot.data!.parsedData!.faqFindMany![i].description,
                ),
              );
            }),
            // SizedBox(height: AppSizes.height / 3),
            // QuestionCard(
            //   titleQuestion: 'Apa Yang Akan Saya Dapatkan Kalau Bergabung Dengan Komunitas SatuJuta?',
            //   question:
            //       'Lorem ipsum dolor sit amet consectetur. Ipsum in ornare vestibulum sit et ipsum euismod integer sem. In sed turpis arcu est nulla rutrum tortor. Dignissim at vel.',
            // ),
            // SizedBox(height: AppSizes.height / 3),
            // QuestionCard(
            //   titleQuestion: 'Bagaimana Cara Dapatkan Poin?',
            //   question:
            //       'Lorem ipsum dolor sit amet consectetur. Ipsum in ornare vestibulum sit et ipsum euismod integer sem. In sed turpis arcu est nulla rutrum tortor. Dignissim at vel.',
            // ),
            // SizedBox(height: AppSizes.height / 3),
            // QuestionCard(
            //   titleQuestion: 'Siapa Saja Yang Bisa Daftar Jadi Member SatuJuta?',
            //   question:
            //       'Lorem ipsum dolor sit amet consectetur. Ipsum in ornare vestibulum sit et ipsum euismod integer sem. In sed turpis arcu est nulla rutrum tortor. Dignissim at vel.',
            // ),
          ],
        );
      },
    );
  }

  Widget wrapReferralCard(UserViewModel user) {
    return Consumer<MemberListViewModel>(builder: (context, member, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 2),
        child: Column(
          children: [
            ReferralCard(
              title: 'KOMISI BULAN INI',
              subtitle: CurrencyFormatter.format(user.totalUserCommission),
            ),
            const SizedBox(
              height: AppSizes.padding / 4,
            ),
            ReferralCard(
              title: 'TOTAL REFERRAL ANDA',
              subtitle: "${member.userMembers?.length ?? 0}",
            ),
            const SizedBox(
              height: AppSizes.padding / 4,
            ),
            ReferralCard(
              title: 'REFERRAL AKTIF',
              subtitle: "${member.userMembersActive?.length ?? 0}",
            ),
          ],
        ),
      );
    });
  }

  Widget wrapInviteFriend() {
    return Consumer<MemberListViewModel>(builder: (context, model, _) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radius * 2),
          color: AppColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.padding),
          child: Column(
            children: [
              const SizedBox(height: AppSizes.padding / 2),
              Text(
                'Undang Teman Anda',
                style: AppTextStyle.bold(context, color: AppColors.base, fontSize: 20),
              ),
              const SizedBox(height: AppSizes.padding / 2),
              Text(
                'Undang lebih banyak teman Anda untuk mendapatkan lebih banyak point',
                textAlign: TextAlign.center,
                style: AppTextStyle.regular(context, color: AppColors.baseLv5, fontSize: 14),
              ),
              const SizedBox(height: AppSizes.padding / 2),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
                child: RefInviteButton(
                  onTap: () {
                    final mainViewModel = locator<MainViewModel>();

                    // Go to member page
                    Navigator.pop(context);
                    mainViewModel.onChangedPage(2);
                  },
                  leadingButton: userMemberThumbs(model),
                  // leadingButton: const CircleUser(
                  //   imageFriend1: AppAssets.userImage1Path,
                  //   imageFriend2: AppAssets.userImage2Path,
                  //   imageFriend3: AppAssets.userImage3Path,
                  //   countFriend: '9',
                  // ),
                  textButton: 'Undang Lebih Banyak',
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget userMemberThumbs(MemberListViewModel model) {
    if (model.userMembers == null || model.userMembers!.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: 80,
      height: 26,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...List.generate(
            model.userMembers!.length > 4 ? 4 : model.userMembers!.length,
            (i) {
              return Positioned(
                left: i == 0 ? 0 : i * 18,
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      width: 2,
                      color: AppColors.white,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AppImage(
                          image: model.userMembers?[i].avatarUrl ?? '-',
                          width: 26,
                          height: 26,
                          backgroundColor: AppColors.baseLv7,
                          errorWidget: const Icon(
                            Icons.person_rounded,
                            color: AppColors.baseLv4,
                            size: 16,
                          ),
                        ),
                        i < 4
                            ? const SizedBox.shrink()
                            : Container(
                                width: 26,
                                height: 26,
                                color: AppColors.base.withOpacity(0.54),
                                child: Center(
                                  child: Text(
                                    '+${model.userMembers!.length - 4}',
                                    style: AppTextStyle.bold(
                                      context,
                                      fontSize: 10,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
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
                    showQuestion ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  ),
                ),
              ],
            ),
          ),
          subtitle: Visibility(
            visible: showQuestion,
            child: AppCustomText(
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
      title: AppCustomText(
          text: title!,
          style: AppTextStyle.bold(
            context,
            fontSize: 12,
            color: AppColors.baseLv4,
          )),
      subtitle: AppCustomText(
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
