import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/service/locator/service_locator.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../../view_model/school_list_view_model.dart';
import '../../atom/app_button.dart';
import '../../atom/app_progress_indicator.dart';
import '../../atom/app_text_field.dart';
import '../../atom/app_text_fields_wrapper.dart';

class SchoolListModal extends StatefulWidget {
  final int cityId;
  final int subdistrictId;

  const SchoolListModal({
    super.key,
    required this.cityId,
    required this.subdistrictId,
  });

  @override
  State<SchoolListModal> createState() => _SchoolListModalState();
}

class _SchoolListModalState extends State<SchoolListModal> {
  final scrollController = ScrollController();

  final schoolListViewModel = locator<SchoolListViewModel>();

  @override
  void initState() {
    schoolListViewModel.searchCtrl = TextEditingController();
    scrollController.addListener(scrollListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final navigator = Navigator.of(context);
      schoolListViewModel.resetState();
      schoolListViewModel.getSchools(navigator, cityId: widget.cityId);
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    final navigator = Navigator.of(context);

    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      schoolListViewModel.getSchools(
        navigator,
        cityId: widget.cityId,
        skip: schoolListViewModel.schoolFindMany?.length ?? 0,
        contains: schoolListViewModel.searchCtrl.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SchoolListViewModel>(builder: (context, model, _) {
      return model.createMode ? createSchool(model) : selectSchool(model);
    });
  }

  Widget selectSchool(SchoolListViewModel model) {
    final navigator = Navigator.of(context);

    return Column(
      children: [
        searchField(navigator, model),
        const SizedBox(height: AppSizes.padding),
        schoolList(model),
        const SizedBox(height: AppSizes.padding),
        bottomButton(model),
      ],
    );
  }

  Widget searchField(NavigatorState navigator, SchoolListViewModel model) {
    if (model.schoolFindMany == null || model.schoolFindMany!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: AppTextField(
        controller: model.searchCtrl,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Cari Sekolah',
        onChanged: (val) async {
          if (val.length % 3 == 0) {
            await model.getSchools(navigator, cityId: widget.cityId, contains: val);
          }
        },
      ),
    );
  }

  Widget schoolList(SchoolListViewModel model) {
    if (model.schoolFindMany == null) {
      return const Padding(
        padding: EdgeInsets.all(32),
        child: AppProgressIndicator(),
      );
    }

    if (model.schoolFindMany!.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(42),
        child: Text(
          'Tidak ada sekolah yang dapat ditampilkan',
          textAlign: TextAlign.center,
          style: AppTextStyle.bold(context, color: AppColors.baseLv5),
        ),
      );
    }

    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 300),
      child: RawScrollbar(
        padding: const EdgeInsets.symmetric(vertical: 6),
        radius: const Radius.circular(100),
        child: ListView.builder(
          controller: scrollController,
          shrinkWrap: true,
          itemCount: model.schoolFindMany!.length,
          itemBuilder: (context, i) {
            return schoolListTile(model, i);
          },
        ),
      ),
    );
  }

  Widget schoolListTile(SchoolListViewModel model, int i) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: RadioListTile(
        value: model.selectedSchool,
        groupValue: model.schoolFindMany![i],
        onChanged: (value) {
          model.onSelectSchool(model.schoolFindMany![i]);
        },
        title: Text(
          model.schoolFindMany![i].name,
          style: AppTextStyle.bold(context),
        ),
        activeColor: AppColors.primary,
        contentPadding: const EdgeInsets.fromLTRB(
          AppSizes.padding,
          AppSizes.padding / 1.8,
          AppSizes.padding / 1.8,
          AppSizes.padding / 1.8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius),
        ),
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }

  Widget createSchool(SchoolListViewModel model) {
    return Column(
      children: [
        AppTextFieldsWrapper(
          textFields: [
            AppTextField(
              controller: model.nameCtrl,
              lableText: 'Nama Sekolah',
              hintText: 'Masukkkan Nama Sekolah',
              onChanged: (val) {
                setState(() {});
              },
            ),
            AppTextField(
              controller: model.addressCtrl,
              lableText: 'Alamat Sekolah',
              hintText: 'Masukkkan alamat sekolah',
              onChanged: (val) {
                setState(() {});
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
          child: AppButton(
            onTap: () {
              FocusScope.of(context).unfocus();
              final navigator = Navigator.of(context);
              model.onTapRegisterSchoolButton(
                navigator,
                widget.cityId,
                widget.subdistrictId,
              );
            },
            text: "Daftarkan Sekolah",
            enable: model.nameCtrl.text.isNotEmpty && model.addressCtrl.text.isNotEmpty,
          ),
        ),
      ],
    );
  }

  Widget bottomButton(SchoolListViewModel model) {
    return AppButton(
      onTap: () async {
        if (model.schoolFindMany != null && model.schoolFindMany!.isNotEmpty) {
          Navigator.pop(context, model.selectedSchool);
        } else {
          model.onTapCreateSchoolButton();
        }
      },
      enable: model.schoolFindMany != null && model.schoolFindMany!.isNotEmpty ? model.selectedSchool != null : true,
      text: model.schoolFindMany != null && model.schoolFindMany!.isNotEmpty ? 'Pilih' : 'Buat Sekolah',
    );
  }
}
