import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_image.dart';
import '../../../widget/atom/app_not_found_widget.dart';
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
<<<<<<< HEAD
        physics: const BouncingScrollPhysics(),
=======
        controller: scrollController,
>>>>>>> main
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
            Icons.campaign_rounded,
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
        final navigator = Navigator.of(context);

        if (i >= 0) {
          model.onSelectCategory(navigator, model.programCategories![i], i);
        } else {
          model.onSelectCategory(navigator, null, i);
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
<<<<<<< HEAD
            controller: scrollController,
            shrinkWrap: true,
            itemCount: model.programFindMany!.length,
            padding: const EdgeInsets.all(AppSizes.padding),
=======
            shrinkWrap: true,
            itemCount: model.programFindMany!.length,
            padding: const EdgeInsets.all(AppSizes.padding),
            physics: const ClampingScrollPhysics(),
>>>>>>> main
            itemBuilder: (context, i) {
              return programCard(i, model);
            },
          ),
        );
      },
    );
  }

  Widget programCard(int i, ProgramListViewModel model) {
    return Container(
      margin: EdgeInsets.only(bottom: i < model.programFindMany!.length - 1 ? AppSizes.padding : AppSizes.padding * 6),
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius * 2),
<<<<<<< HEAD
        boxShadow: [
          const BoxShadow(
=======
        boxShadow: const [
          BoxShadow(
>>>>>>> main
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
                image: model.programFindMany![i].Images?.first.url ?? '',
              ),
            ),
          ),
          const SizedBox(height: AppSizes.padding),
          Text(
            model.programFindMany![i].name,
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
                    model.programFindMany![i].dueDate != null &&
                            !DateTime.parse(model.programFindMany![i].dueDate!).difference(DateTime.now()).isNegative
                        ? '${DurationFormatter.formatDetailed(DateTime.parse(model.programFindMany![i].dueDate!), DateTime.now())} lagi'
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
                    model.programFindMany![i].dueDate != null
                        ? DateFormatter.slashDate(model.programFindMany![i].dueDate!)
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
            model.programFindMany![i].description,
            style: AppTextStyle.regular(context, fontSize: 14),
          ),
          const SizedBox(height: AppSizes.padding),
          SizedBox(
            width: 100,
            child: AppButton(
              onTap: () {
                // TODO
              },
              text: 'Join',
              fontSize: 12,
              rightIcon: Icons.arrow_right_alt_rounded,
              buttonColor: AppColors.white,
              textColor: AppColors.base,
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.padding / 2,
                horizontal: AppSizes.padding,
              ),
              borderWidth: 2,
            ),
          ),
        ],
      ),
    );
  }
}
