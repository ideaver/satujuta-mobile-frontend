import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../app/asset/app_icons.dart';
import '../../app/service/locator/service_locator.dart';
import '../../view_model/register_view_model.dart';
import '../../widget/atom/app_dialog.dart';
import '../../widget/atom/app_icon_button.dart';
import '../../widget/atom/app_image.dart';
import '../login/login_view.dart';
import 'components/reg_account.dart';
import 'components/reg_biodata.dart';
import 'components/reg_commission.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  static const String routeName = '/register';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with TickerProviderStateMixin {
  final registerViewModel = locator<RegisterViewModel>();

  @override
  void initState() {
    registerViewModel.tabController = TabController(length: 3, vsync: this);
    registerViewModel.tabController.addListener(tabListener);
    super.initState();
  }

  void tabListener() {
    setState(() {});
  }

  @override
  void dispose() {
    registerViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: registerViewModel,
      child: Scaffold(
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              sliverAppBarWidget(),
            ];
          },
          body: body(),
        ),
      ),
    );
  }

  SliverAppBar sliverAppBarWidget() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      expandedHeight: 170,
      collapsedHeight: 70,
      elevation: 0.5,
      flexibleSpace: FlexibleSpaceBar(
        title: title(),
        background: sliverBackground(),
        expandedTitleScale: 1.2,
        titlePadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding,
          vertical: AppSizes.padding,
        ),
      ),
    );
  }

  Widget title() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Registrasi",
            style: AppTextStyle.bold(context, fontSize: 20),
          ),
          const SizedBox(height: AppSizes.padding / 4),
          Text(
            "Bergabung menjadi anggota SatuJuta!",
            style: AppTextStyle.regular(
              context,
              fontSize: 12,
              color: AppColors.baseLv4,
            ),
          ),
        ],
      ),
    );
  }

  Widget sliverBackground() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.backgroundPath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: AppSizes.padding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppIconButton(
                imgIcon: AppAssets.lockIconPath,
              ),
              AppButton(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    LoginView.routeName,
                  );
                },
                textColor: AppColors.primary,
                buttonColor: AppColors.primary.withOpacity(0.12),
                text: 'Login',
                fontSize: 12,
                rightIcon: Icons.arrow_forward_ios_rounded,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget body() {
    return Consumer<RegisterViewModel>(builder: (context, model, _) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          children: [
            userPhoto(model),
            tabBar(model),
            tabBarViews(model),
          ],
        ),
      );
    });
  }

  Widget userPhoto(RegisterViewModel model) {
    return Column(
      children: [
        const SizedBox(height: AppSizes.padding),
        Text(
          "Foto Profil",
          style: AppTextStyle.bold(context),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: AppSizes.padding,
          ),
          width: 150,
          height: 150,
          child: Center(
            child: Stack(
              children: [
                AppImage(
                  image: model.avatar?.path ?? '-',
                  imgProvider: model.avatar?.path == null ? ImgProvider.networkImage : ImgProvider.fileImage,
                  width: 150,
                  height: 150,
                  borderRadius: 100,
                  backgroundColor: AppColors.baseLv7,
                  errorWidget: const Icon(
                    Icons.person_rounded,
                    size: 82,
                    color: AppColors.baseLv4,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () async {
                      final navigator = Navigator.of(context);

                      final path = await AppDialog.showPickImageDialog(navigator);

                      if (path != null) {
                        CroppedFile? croppedFile = await ImageCropper().cropImage(
                          sourcePath: path,
                          compressQuality: 15,
                          aspectRatioPresets: [
                            CropAspectRatioPreset.square,
                          ],
                          uiSettings: [
                            AndroidUiSettings(
                              toolbarTitle: 'Crop Image',
                              statusBarColor: Colors.black,
                              toolbarColor: Colors.black,
                              toolbarWidgetColor: Colors.white,
                              lockAspectRatio: true,
                              showCropGrid: false,
                              hideBottomControls: true,
                            ),
                            IOSUiSettings(
                              title: 'Crop Image',
                              aspectRatioLockEnabled: true,
                              hidesNavigationBar: true,
                            ),
                          ],
                        );

                        if (croppedFile != null) {
                          model.onChangeAvatar(croppedFile.path);
                          setState(() {});
                        }
                      }
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        CustomIcon.edit_icon,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSizes.padding),
      ],
    );
  }

  Widget tabBar(RegisterViewModel model) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.baseLv6,
        borderRadius: BorderRadius.circular(100),
      ),
      child: IgnorePointer(
        ignoring: true,
        child: TabBar(
          controller: model.tabController,
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
                    AppAssets.personFormIconPath,
                  ),
                  const SizedBox(width: AppSizes.padding / 3),
                  Flexible(
                    child: Text(
                      "Data Diri",
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
                    AppAssets.lockDarkIconPath,
                  ),
                  const SizedBox(width: AppSizes.padding / 3),
                  Flexible(
                    child: Text(
                      "Akun",
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
                    AppAssets.coinFormIconPath,
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
          ],
        ),
      ),
    );
  }

  Widget tabBarViews(RegisterViewModel model) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: model.tabController.index == 0
          ? const RegBiodata()
          : model.tabController.index == 1
              ? const RegAccount()
              : const RegCommission(),
    );
  }
}
