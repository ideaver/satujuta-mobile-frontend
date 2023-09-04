import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_app_mobile/app/utility/console_log.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../widget/atom/app_button.dart';
import '../../app/asset/app_icons.dart';
import '../../app/service/locator/service_locator.dart';
import '../../view_model/edit_profile_view_model.dart';
import '../../widget/atom/app_dialog.dart';
import '../../widget/atom/app_icon_button.dart';
import '../../widget/atom/app_image.dart';
import 'components/edit_profile_account.dart';
import 'components/edit_profile_biodata.dart';
import 'components/edit_profile_commission.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/edit-profile';

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> with TickerProviderStateMixin {
  final _editProfileViewModel = locator<EditProfileViewModel>();

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(tabListener);

    _editProfileViewModel.firstNameCtrl = TextEditingController();
    _editProfileViewModel.lastNameCtrl = TextEditingController();
    _editProfileViewModel.addressNameCtrl = TextEditingController();
    _editProfileViewModel.postalCodeCtrl = TextEditingController();
    _editProfileViewModel.whatsappNumberCtrl = TextEditingController();
    _editProfileViewModel.emailCtrl = TextEditingController();
    _editProfileViewModel.passwordCtrl = TextEditingController();
    _editProfileViewModel.confirmPasswordCtrl = TextEditingController();
    _editProfileViewModel.referralCodeCtrl = TextEditingController();
    _editProfileViewModel.bankNameCtrl = TextEditingController();
    _editProfileViewModel.bankAccountNumberCtrl = TextEditingController();

    _editProfileViewModel.initEditProfileView();
    super.initState();
  }

  @override
  void dispose() {
    _editProfileViewModel.firstNameCtrl.dispose();
    _editProfileViewModel.lastNameCtrl.dispose();
    _editProfileViewModel.addressNameCtrl.dispose();
    _editProfileViewModel.postalCodeCtrl.dispose();
    _editProfileViewModel.whatsappNumberCtrl.dispose();
    _editProfileViewModel.emailCtrl.dispose();
    _editProfileViewModel.passwordCtrl.dispose();
    _editProfileViewModel.confirmPasswordCtrl.dispose();
    _editProfileViewModel.referralCodeCtrl.dispose();
    _editProfileViewModel.bankNameCtrl.dispose();
    _editProfileViewModel.bankAccountNumberCtrl.dispose();
    super.dispose();
  }

  void tabListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
      centerTitle: true,
      title: title(),
    );
  }

  Widget title() {
    return Text(
      'Profile',
      style: AppTextStyle.bold(context, fontSize: 18),
    );
  }

  Widget backButton() {
    return AppIconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icons.arrow_back,
      iconSize: 18,
      iconColor: AppColors.base,
      backgroundColor: AppColors.white,
      padding: const EdgeInsets.all(AppSizes.padding / 2),
    );
  }

  SliverAppBar sliverAppBarWidget() {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 170,
      elevation: 0.5,
      leading: backButton(),
      title: title(),
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: sliverBackground(),
        expandedTitleScale: 1,
      ),
    );
  }

  Widget body() {
    return Consumer<EditProfileViewModel>(
      builder: (context, model, _) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
          child: Column(
            children: [
              userPhoto(model),
              tabBar(),
              tabBarViews(model),
            ],
          ),
        );
      },
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
    );
  }

  Widget userPhoto(EditProfileViewModel model) {
    return Column(
      children: [
        const SizedBox(height: AppSizes.padding),
        Text(
          "Foto Profile",
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
                  image: model.avatarUrl ?? '-',
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

                      cl('path = $path');

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
                          await model.uploadUserAvatar(croppedFile.path, navigator);
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

  Widget tabBar() {
    return Container(
      margin: const EdgeInsets.only(
        top: AppSizes.padding,
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
    );
  }

  Widget tabBarViews(EditProfileViewModel model) {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: tabController.index == 0
              ? const EditProfileBiodata()
              : tabController.index == 1
                  ? const EditProfileAccount()
                  : const EditProfileCommission(),
        ),
        updateButton(model),
      ],
    );
  }

  Widget updateButton(EditProfileViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSizes.padding / 2,
        bottom: AppSizes.padding * 2,
      ),
      child: AppButton(
        onTap: () {
          final navigator = Navigator.of(context);
          model.onTapUpdateProfile(navigator);
        },
        text: "Simpan Perubahan",
      ),
    );
  }
}
