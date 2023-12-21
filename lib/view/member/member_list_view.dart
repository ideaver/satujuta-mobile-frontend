import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/user_find_many.graphql.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../app/const/app_consts.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_image.dart';
import '../../../widget/atom/app_text_field.dart';
import '../../app/service/locator/service_locator.dart';
import '../../app/utility/date_formatter.dart';
import '../../view_model/member_list_view_model.dart';
import '../../widget/atom/app_icon_button.dart';
import '../../widget/atom/app_not_found_widget.dart';
import '../../widget/atom/app_progress_indicator.dart';
import 'member_invitation_view.dart';

class MemberListView extends StatefulWidget {
  final PageStateEnum pageState;

  const MemberListView({Key? key, required this.pageState}) : super(key: key);

  static const String viewAsMeRouteName = '/my-members';
  static const String viewAsOtherRouteName = '/other-user-members';

  const MemberListView.viewAsMe({
    super.key,
    this.pageState = PageStateEnum.viewAsMe,
  });

  const MemberListView.viewAsOther({
    super.key,
    this.pageState = PageStateEnum.viewAsOther,
  });

  @override
  State<MemberListView> createState() => _MemberListViewState();
}

class _MemberListViewState extends State<MemberListView> {
  final scrollController = ScrollController();

  final _memberListViewModel = locator<MemberListViewModel>();

  int selectedMemberStatus = -1;

  List<String> memberStatuses = [
    'Aktif',
    'Non-Aktif',
  ];

  @override
  void initState() {
    _memberListViewModel.searchCtrl = TextEditingController();
    _memberListViewModel.searchFocusNode = FocusNode();
    _memberListViewModel.searchFocusNode.addListener(_memberListViewModel.focusListener);
    scrollController.addListener(scrollListener);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _memberListViewModel.getAllUserMembers();
    });
    super.initState();
  }

  @override
  void dispose() {
    _memberListViewModel.searchCtrl.dispose();
    _memberListViewModel.searchFocusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      _memberListViewModel.getAllUserMembers(
        skip: _memberListViewModel.userMembers?.length ?? 0,
        contains: _memberListViewModel.searchCtrl.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MemberListViewModel>(builder: (context, model, _) {
      if (model.userMembers == null) {
        return const Scaffold(body: AppProgressIndicator());
      }

      return Scaffold(
        backgroundColor: AppColors.baseLv7,
        appBar: appBar(),
        body: body(),
      );
    });
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.baseLv7,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.baseLv7,
      ),
      title: title(),
    );
  }

  Widget title() {
    // TODO CONSUME OTHER USER MEMBER DATA
    return Consumer<MemberListViewModel>(builder: (context, model, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              backButton(),
              widget.pageState == PageStateEnum.viewAsOther
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Anggota',
                          style: AppTextStyle.bold(
                            context,
                            fontSize: 12,
                            color: AppColors.baseLv4,
                          ),
                        ),
                        Text(
                          'Robert Meijer',
                          style: AppTextStyle.bold(context, fontSize: 18),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        const Icon(
                          Icons.people_alt_outlined,
                          color: AppColors.base,
                        ),
                        const SizedBox(width: AppSizes.padding / 2),
                        Text(
                          'Anggota Anda',
                          style: AppTextStyle.bold(context, fontSize: 18),
                        ),
                      ],
                    ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.person,
                color: AppColors.base,
                size: 18,
              ),
              const SizedBox(width: AppSizes.padding / 4),
              Text(
                '${model.userMembers?.length ?? 0}',
                style: AppTextStyle.bold(context, fontSize: 16),
              ),
              const SizedBox(width: AppSizes.padding / 4),
            ],
          ),
        ],
      );
    });
  }

  Widget backButton() {
    if (widget.pageState != PageStateEnum.viewAsOther) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(right: AppSizes.padding),
      child: AppIconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icons.arrow_back_ios_rounded,
        iconSize: 18,
        iconColor: AppColors.base,
      ),
    );
  }

  Widget body() {
    return Consumer<MemberListViewModel>(builder: (context, model, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchField(model),
          tabBar(),
          memberList(model),
        ],
      );
    });
  }

  Widget searchField(MemberListViewModel model) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        AppSizes.padding,
        AppSizes.padding / 4,
        AppSizes.padding,
        AppSizes.padding,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppTextField(
              type: AppTextFieldType.search,
              controller: model.searchCtrl,
              focus: model.searchFocusNode,
              showSuffixButton: model.isSearchFocus,
              prefixIcon: const Icon(Icons.search),
              hintText: 'Cari',
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.padding / 2,
                vertical: AppSizes.padding / 4,
              ),
              onChanged: (val) async {
                if (val.length % 3 == 0) {
                  await model.getAllUserMembers(contains: val);
                }
              },
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: model.isSearchFocus
                ? const SizedBox.shrink()
                : Row(
                    children: [
                      const SizedBox(width: AppSizes.padding / 2),
                      sortButton(),
                      const SizedBox(width: AppSizes.padding),
                      inviteButton(),
                      const SizedBox(width: AppSizes.padding),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget sortButton() {
    return AppIconButton(
      onPressed: () {
        // TODO
      },
      icon: Icons.sort,
      iconSize: 18,
    );
  }

  Widget inviteButton() {
    if (widget.pageState == PageStateEnum.viewAsOther) {
      return const SizedBox.shrink();
    }

    return AppButton(
      onTap: () {
        Navigator.pushNamed(context, MemberInvitationView.viewAsMeRouteName);
      },
      text: 'Undang',
      fontSize: 12,
      leftIcon: Icons.add,
      padding: const EdgeInsets.all(
        AppSizes.padding / 2,
      ),
    );
  }

  Widget tabBar() {
    if (widget.pageState == PageStateEnum.viewAsOther) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.padding),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding,
        ),
        child: Row(
          children: [
            tabWidget(-1),
            ...List.generate(memberStatuses.length, (i) {
              return tabWidget(i);
            })
          ],
        ),
      ),
    );
  }

  Widget tabWidget(int i) {
    return Consumer<MemberListViewModel>(builder: (context, model, _) {
      return GestureDetector(
        onTap: () {
          selectedMemberStatus = i;
          setState(() {});
        },
        child: Container(
          margin: const EdgeInsets.only(right: AppSizes.padding / 2),
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.padding / 2,
            horizontal: AppSizes.padding,
          ),
          decoration: BoxDecoration(
            color: selectedMemberStatus == i ? AppColors.primary : AppColors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              i == -1
                  ? Padding(
                      padding: const EdgeInsets.only(right: AppSizes.padding / 2),
                      child: Icon(
                        Icons.dashboard_outlined,
                        size: 16,
                        color: selectedMemberStatus == -1 ? AppColors.white : AppColors.base,
                      ),
                    )
                  : const SizedBox.shrink(),
              Text(
                i == -1
                    ? 'Semua'
                    : '${memberStatuses[i]} (${i == 0 ? (model.userMembersActive?.length ?? 0) : (model.userMembersInactive?.length ?? 0)})',
                style: AppTextStyle.semiBold(
                  context,
                  color: selectedMemberStatus == i ? AppColors.white : AppColors.base,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget memberList(MemberListViewModel model) {
    var members = selectedMemberStatus == -1
        ? model.userMembers
        : selectedMemberStatus == 0
            ? model.userMembersActive
            : model.userMembersInactive;

    if (members == null || members.isEmpty) {
      return const Expanded(
        child: SingleChildScrollView(
          child: AppNotFoundWidget(
            title: 'Kamu belum memiliki anggota',
            subtitle: 'Segera menambahkan anggota dan akan kami beritahukan lewat pemberitahuan',
          ),
        ),
      );
    }

    return Expanded(
      child: RawScrollbar(
        padding: const EdgeInsets.symmetric(vertical: 6),
        radius: const Radius.circular(100),
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
          child: Column(
            children: [
              ...List.generate(members.length, (i) {
                return memberCard(i, members[i], model);
              }),
              const SizedBox(height: AppSizes.padding * 6)
            ],
          ),
        ),
      ),
    );
  }

  Widget memberCard(int i, Query$UserFindMany$userFindMany member, MemberListViewModel model) {
    return Container(
      margin: EdgeInsets.only(top: i == 0 ? 0 : AppSizes.padding / 4),
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: const BoxDecoration(
                    color: AppColors.baseLv7,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: AppImage(
                      image: member.avatarUrl ?? '-',
                      width: 52,
                      height: 52,
                      backgroundColor: AppColors.baseLv7,
                      errorWidget: const Icon(
                        Icons.person_rounded,
                        color: AppColors.baseLv4,
                        size: 26,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.padding / 1.5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${member.firstName} ${member.lastName}',
                        style: AppTextStyle.extraBold(
                          context,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: AppSizes.padding / 4),
                      Text(
                        'Bergabung ${DateFormatter.slashDate(member.createdAt)}',
                        style: AppTextStyle.regular(
                          context,
                          fontSize: 12,
                          color: AppColors.baseLv4,
                        ),
                      ),
                      const SizedBox(height: AppSizes.padding / 3),
                      memberPoints(member.id),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.padding / 2),
          AppButton(
            onTap: () {
              // TODO
            },
            text: '${member.$_count.referredUsers}',
            fontSize: 14,
            textColor: AppColors.base,
            buttonColor: AppColors.white,
            borderWidth: 1,
            borderColor: AppColors.baseLv6,
            leftIcon: Icons.person_2_outlined,
            rightIcon: Icons.arrow_forward_ios_rounded,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.padding / 2,
              vertical: AppSizes.padding / 4,
            ),
          ),
        ],
      ),
    );
  }

  // TODO API UNAVAILABLE
  Widget memberPoints(String userId) {
    // return FutureBuilder(
    //   future: GqlUserService.getCurrentUserPointBalanceByUserIdFromPointTransactionFindFirst(
    //     userId: userId,
    //   ),
    //   builder: (context, snapshot) {
    //     return Row(
    //       children: [
    //         const Icon(
    //           Icons.stars,
    //           size: 18,
    //           color: AppColors.yellow,
    //         ),
    //         const SizedBox(width: AppSizes.padding / 4),
    //         Text(
    //           '${(snapshot.data?.parsedData?.pointTransactionFindFirst?.currentBalance ?? 0).toInt()} Poin',
    //           style: AppTextStyle.medium(
    //             context,
    //             fontSize: 12,
    //             color: AppColors.baseLv4,
    //           ),
    //         ),
    //       ],
    //     );
    //   },
    // );

    return Row(
      children: [
        const Icon(
          Icons.stars,
          size: 18,
          color: AppColors.yellow,
        ),
        const SizedBox(width: AppSizes.padding / 4),
        Text(
          'xx Poin',
          style: AppTextStyle.medium(
            context,
            fontSize: 12,
            color: AppColors.baseLv4,
          ),
        ),
      ],
    );
  }
}
