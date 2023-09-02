import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/asset/app_icons.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../app/const/app_consts.dart';
import '../../../widget/atom/app_button.dart';
import '../../app/service/locator/service_locator.dart';
import '../../app/utility/date_formatter.dart';
import '../../view_model/main_view_model.dart';
import '../../view_model/member_list_view_model.dart';
import '../../view_model/user_view_model.dart';
import '../../widget/atom/app_icon_button.dart';
import '../../widget/atom/app_image.dart';
import '../../widget/atom/app_snackbar.dart';
import '../../widget/molecule/referral_Invitation/ref_invite_button.dart';
import '../settings/edit_profile_view.dart';
import 'components/commission_transactions_list.dart';
import 'components/point_transactions_list.dart';
import 'components/reward_transactions_list.dart';

class UserView extends StatefulWidget {
  final PageStateEnum pageState;
  const UserView({Key? key, required this.pageState}) : super(key: key);

  static const String viewAsMeRouteName = '/user';

  const UserView.viewAsMe({
    Key? key,
    this.pageState = PageStateEnum.viewAsMe,
  }) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(tabListener);
  }

  void tabListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseLv7,
      appBar: appBar(),
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
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.baseLv7,
      ),
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
          'Detail Profil',
          style: AppTextStyle.bold(context, fontSize: 18),
        ),
        editButton(),
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

  Widget editButton() {
    return AppIconButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          EditProfileView.routeName,
        );
      },
      icon: CustomIcon.edit_icon,
      iconSize: 18,
      iconColor: AppColors.base,
      backgroundColor: AppColors.white,
      padding: const EdgeInsets.all(AppSizes.padding / 2),
    );
  }

  SliverAppBar sliverAppBarWidget() {
    return SliverAppBar(
      backgroundColor: AppColors.baseLv7,
      automaticallyImplyLeading: false,
      expandedHeight: 420,
      flexibleSpace: FlexibleSpaceBar(
        background: background(),
        expandedTitleScale: 1,
      ),
    );
  }

  Widget body() {
    return Consumer<UserViewModel>(builder: (context, model, _) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          children: [
            wrapMyRefCode(model),
            countMemberAndTask(model),
            wrapInviteFriend(),
            tabBar(),
            tabBarViews(),
          ],
        ),
      );
    });
  }

  Widget background() {
    return Consumer<UserViewModel>(builder: (context, model, _) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 44,
              bottom: 169,
              child: Container(
                width: 619,
                height: 619,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(55, 114, 255, 0.05),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: AppSizes.padding * 4),
              child: Column(
                children: [
                  AppImage(
                    image: model.user!.avatarUrl ?? '',
                    width: 150,
                    height: 150,
                    borderRadius: 100,
                    backgroundColor: AppColors.baseLv6,
                    errorWidget: const Icon(
                      Icons.person_rounded,
                      size: 82,
                      color: AppColors.baseLv4,
                    ),
                  ),
                  const SizedBox(height: AppSizes.height * 2),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: AppButton(
                      onTap: () {
                        // TODO
                      },
                      text: '${model.totalUserPoint} Poin',
                      fontSize: 12,
                      leftIcon: CustomIcon.coin_icon,
                      buttonColor: AppColors.yellow,
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSizes.padding / 4,
                        horizontal: AppSizes.padding / 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.height * 2),
                  Text(
                    '${model.user!.firstName} ${model.user!.lastName}',
                    style: AppTextStyle.bold(
                      context,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget wrapMyRefCode(UserViewModel model) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          AppSizes.radius * 2,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSizes.padding / 2),
              decoration: BoxDecoration(
                color: AppColors.baseLv7,
                borderRadius: BorderRadius.circular(
                  AppSizes.radius * 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.padding / 1.5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          model.user!.referralCode,
                          style: AppTextStyle.bold(
                            context,
                            fontSize: 16,
                            color: AppColors.base,
                          ),
                        ),
                        const SizedBox(width: 4),
                        AppIconButton(
                          onPressed: () async {
                            final navigator = Navigator.of(context);
                            await Clipboard.setData(ClipboardData(text: model.user!.referralCode));
                            AppSnackbar.show(navigator, title: 'Kode referral disalin ke clipboard');
                          },
                          icon: CustomIcon.copy_document,
                          iconColor: AppColors.primary,
                          iconSize: 18,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Bergabung Sejak ${DateFormatter.normal(model.user!.createdAt)}',
                      style: AppTextStyle.regular(context, color: AppColors.baseLv5, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.padding / 1.5,
            ),
            Text(
              'Diinvite Oleh ${model.user!.referredBy?.firstName ?? '-'} ${model.user!.referredBy?.lastName ?? ''}',
              style: AppTextStyle.regular(context, color: AppColors.baseLv5, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget countMemberAndTask(UserViewModel model) {
    return Container(
      height: 170,
      margin: const EdgeInsets.symmetric(vertical: AppSizes.padding),
      child: Row(
        children: [
          Expanded(child: countMember(model)),
          const SizedBox(width: AppSizes.padding / 1.2),
          taskTotal(model),
        ],
      ),
    );
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
                  textButton:
                      model.userMembers == null || model.userMembers!.isEmpty ? 'Undang Teman' : 'Undang Lebih Banyak',
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

  Widget tabBar() {
    return Container(
      margin: const EdgeInsets.only(
        top: AppSizes.padding,
        bottom: AppSizes.padding * 1.5,
      ),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.baseLv6,
        borderRadius: BorderRadius.circular(100),
      ),
      child: TabBar(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        labelColor: AppColors.base,
        indicator: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        tabs: [
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.poinIconPath,
                  scale: 2.0,
                ),
                const SizedBox(width: AppSizes.padding / 3),
                Flexible(
                  child: Text(
                    "Poin",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.bold(context, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.contactGroupIconPath,
                  scale: 2.0,
                ),
                const SizedBox(width: AppSizes.padding / 3),
                Flexible(
                  child: Text(
                    "Komisi",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.bold(context, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.contactGroupIconPath,
                  scale: 2.0,
                ),
                const SizedBox(width: AppSizes.padding / 3),
                Flexible(
                  child: Text(
                    "Reward",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.bold(context, fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tabBarViews() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: tabController.index == 0
          ? const PointTransactionsList()
          : tabController.index == 1
              ? const CommissionTransactionsList()
              : const RewardTransactionsList(),
    );
  }

  Widget countMember(UserViewModel model) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'JUMLAH\nMEMBER',
                    style: AppTextStyle.bold(
                      context,
                      fontSize: 14,
                      color: AppColors.baseLv4,
                    ),
                  ),
                  const SizedBox(height: AppSizes.padding / 2),
                  Text(
                    '${model.totalReferredUser}',
                    style: AppTextStyle.extraBold(
                      context,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: AppSizes.padding / 2),
              AppIconButton(
                onPressed: () {
                  final mainViewModel = locator<MainViewModel>();

                  // Go to member page
                  Navigator.pop(context);
                  mainViewModel.onChangedPage(2);
                },
                icon: CustomIcon.inventory,
                iconSize: 32,
                backgroundColor: AppColors.baseLv6,
                padding: const EdgeInsets.all(AppSizes.padding / 2),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget taskTotal(UserViewModel model) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIconButton(
            onPressed: () {
              // TODO
            },
            icon: Icons.text_snippet_outlined,
            iconSize: 16,
            backgroundColor: AppColors.baseLv6,
            padding: const EdgeInsets.all(AppSizes.padding / 2),
          ),
          const SizedBox(height: AppSizes.padding / 3),
          Text(
            'TASK',
            style: AppTextStyle.bold(
              context,
              fontSize: 12,
              color: AppColors.base,
            ),
          ),
          const SizedBox(height: AppSizes.padding / 2),
          AppButton(
            onTap: () {
              // TODO
            },
            text: '85.0',
            fontSize: 10,
            rightIcon: Icons.arrow_right_alt_rounded,
            textColor: AppColors.base,
            buttonColor: AppColors.baseLv6,
            padding: const EdgeInsets.symmetric(
              vertical: AppSizes.padding / 2,
              horizontal: AppSizes.padding,
            ),
            borderRadius: BorderRadius.circular(AppSizes.radius),
          ),
        ],
      ),
    );
  }

  // =======
}
