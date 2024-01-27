import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_app_mobile/view_model/user_view_model.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_image.dart';
import '../../../widget/atom/app_not_found_widget.dart';
import '../../app/asset/app_icons.dart';
import '../../app/service/locator/service_locator.dart';
import '../../app/utility/date_formatter.dart';
import '../../app/utility/duration_formatter.dart';
import '../../view_model/program_list_view_model.dart';
import '../../widget/atom/app_progress_indicator.dart';

class ProgramListView extends StatefulWidget {
  const ProgramListView({Key? key}) : super(key: key);

  static const String routeName = '/program-list';

  @override
  State<ProgramListView> createState() => _ProgramListViewState();
}

class _ProgramListViewState extends State<ProgramListView> {
  final scrollController = ScrollController();

  final _programListViewModel = locator<ProgramListViewModel>();

  @override
  void initState() {
    _programListViewModel.searchCtrl = TextEditingController();
    scrollController.addListener(scrollListener);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _programListViewModel.initProgramListView();
    });
    super.initState();
  }

  @override
  void dispose() {
    _programListViewModel.searchCtrl.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    // final navigator = Navigator.of(context);

    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      _programListViewModel.getAllPrograms(
        skip: _programListViewModel.programFindMany?.length ?? 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseLv7,
      body: NestedScrollView(
        controller: scrollController,
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

  Widget sliverAppBarWidget() {
    return Consumer<ProgramListViewModel>(builder: (context, model, _) {
      return SliverAppBar(
        automaticallyImplyLeading: false,
        expandedHeight: 170,
        pinned: true,
        backgroundColor: AppColors.baseLv7,
        elevation: 0.5,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.baseLv7,
        ),
        flexibleSpace: FlexibleSpaceBar(
          title: title(),
          expandedTitleScale: 1.5,
        ),
        bottom: model.programCategories == null || model.programCategories!.isEmpty ? null : tabBar(),
      );
    });
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppSizes.padding * 3,
        left: AppSizes.padding,
      ),
      child: Row(
        children: [
          const Icon(
            CustomIcon.layer_icon,
          ),
          const SizedBox(width: AppSizes.padding / 2),
          Text(
            'Katalog Program',
            style: AppTextStyle.bold(context, fontSize: 14),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget tabBar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 50),
      child: Consumer<ProgramListViewModel>(builder: (context, model, _) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.padding,
            vertical: AppSizes.padding,
          ),
          child: Row(
            children: [
              tabWidget(model, -1),
              ...List.generate(model.programCategories!.length, (i) {
                return tabWidget(model, i);
              })
            ],
          ),
        );
      }),
    );
  }

  Widget tabWidget(ProgramListViewModel model, int i) {
    return GestureDetector(
      onTap: () {
        if (i >= 0) {
          model.onSelectCategory(model.programCategories![i], i);
        } else {
          model.onSelectCategory(null, i);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: AppSizes.padding / 2),
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.padding / 2,
          horizontal: AppSizes.padding,
        ),
        decoration: BoxDecoration(
          color: model.selectedTabIndex == i ? AppColors.primary : AppColors.white,
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
                      color: model.selectedTabIndex == -1 ? AppColors.white : AppColors.base,
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              i == -1 ? 'Semua' : model.programCategories![i].name,
              style: AppTextStyle.semiBold(
                context,
                color: model.selectedTabIndex == i ? AppColors.white : AppColors.base,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return Consumer<ProgramListViewModel>(
      builder: (context, model, _) {
        if (model.programFindMany == null) {
          return const AppProgressIndicator();
        }

        if (model.programFindMany!.isEmpty) {
          return const AppNotFoundWidget(
            title: 'Maaf, Saat Ini Belum Ada Program Tersedia',
            subtitle: 'Kami akan segera menambahkan program dan akan kami beritahukan lewat pemberitahuan',
          );
        }

        return RawScrollbar(
          padding: const EdgeInsets.symmetric(vertical: 6),
          radius: const Radius.circular(100),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: model.programFindMany!.length,
            padding: const EdgeInsets.all(AppSizes.padding),
            itemBuilder: (context, i) {
              return programCard(i, model);
            },
          ),
        );
      },
    );
  }

  Widget programCard(int i, ProgramListViewModel programViewModel) {
    return Consumer<UserViewModel>(builder: (context, userViewModel, _) {
      bool isJoined =
          programViewModel.programFindMany![i].participant?.where((e) => e.id == userViewModel.user!.id).firstOrNull !=
              null;

      return Container(
        margin: EdgeInsets.only(
            bottom: i < programViewModel.programFindMany!.length - 1 ? AppSizes.padding : AppSizes.padding * 6),
        padding: const EdgeInsets.all(AppSizes.padding),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radius * 2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(4, 4),
              blurRadius: 22,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.radius * 2),
                child: AppImage(
                  image: programViewModel.programFindMany![i].Images?.firstOrNull?.url ?? '',
                  backgroundColor: AppColors.baseLv7,
                  errorWidget: const Icon(
                    CustomIcon.layer_icon,
                    color: AppColors.baseLv4,
                    size: 32,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.padding),
            Text(
              programViewModel.programFindMany![i].name,
              style: AppTextStyle.bold(context, fontSize: 16),
            ),
            const SizedBox(height: AppSizes.padding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.timelapse_rounded,
                      size: 12,
                      color: AppColors.baseLv4,
                    ),
                    const SizedBox(width: AppSizes.padding / 4),
                    Text(
                      programViewModel.programFindMany![i].dueDate != null &&
                              !DateTime.parse(programViewModel.programFindMany![i].dueDate!)
                                  .difference(DateTime.now())
                                  .isNegative
                          ? '${DurationFormatter.formatDetailed(DateTime.parse(programViewModel.programFindMany![i].dueDate!), DateTime.now())} lagi'
                          : 'Sudah Berakhir',
                      style: AppTextStyle.regular(
                        context,
                        fontSize: 12,
                        color: AppColors.baseLv4,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      size: 12,
                      color: AppColors.baseLv4,
                    ),
                    const SizedBox(width: AppSizes.padding / 4),
                    Text(
                      programViewModel.programFindMany![i].dueDate != null
                          ? DateFormatter.slashDate(programViewModel.programFindMany![i].dueDate!)
                          : '-',
                      style: AppTextStyle.regular(
                        context,
                        fontSize: 12,
                        color: AppColors.baseLv4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSizes.padding),
            Text(
              programViewModel.programFindMany![i].description,
              style: AppTextStyle.regular(context, fontSize: 14),
            ),
            const SizedBox(height: AppSizes.padding),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: AppButton(
                    onTap: () {
                      final navigator = Navigator.of(context);
                      programViewModel.joinProgram(navigator, programViewModel.programFindMany![i].id);
                    },
                    enable: !isJoined,
                    text: isJoined ? 'Berhasil' : 'Join',
                    fontSize: 12,
                    rightIcon: isJoined ? null : Icons.arrow_right_alt_rounded,
                    buttonColor: isJoined ? AppColors.greenLv1 : AppColors.white,
                    disabledButtonColor: AppColors.greenLv1,
                    textColor: isJoined ? AppColors.white : AppColors.base,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSizes.padding / 2,
                      horizontal: AppSizes.padding,
                    ),
                    borderWidth: 2,
                  ),
                ),
                isJoined
                    ? Padding(
                        padding: const EdgeInsets.only(left: AppSizes.padding / 2),
                        child: Text(
                          '${programViewModel.programFindMany![i].$_count.participant} Peminat',
                          style: AppTextStyle.semiBold(context, fontSize: 12),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      );
    });
  }
}
