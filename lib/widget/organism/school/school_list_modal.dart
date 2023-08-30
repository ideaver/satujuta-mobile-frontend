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

class SchoolListModal extends StatelessWidget {
  // final int parentId;

  const SchoolListModal({
    super.key,
    // required this.parentId,
  });

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final schoolListViewModel = locator<SchoolListViewModel>();

    schoolListViewModel.getSchools(navigator);

    return Consumer<SchoolListViewModel>(builder: (context, model, _) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: AppTextField(
              prefixIcon: const Icon(
                Icons.search,
              ),
              hintText: 'Cari Sekolah',
              onChanged: (val) async {
                await Future.delayed(const Duration(seconds: 1));
                await model.getSchools(navigator, contains: val);
              },
            ),
          ),
          const SizedBox(height: AppSizes.padding),
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 300,
            ),
            child: model.schools == null
                ? const Padding(
                    padding: EdgeInsets.all(32),
                    child: AppProgressIndicator(),
                  )
                : model.schools!.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          '(Kosong)',
                          style: AppTextStyle.bold(context, color: AppColors.baseLv5),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.schools!.length,
                        itemBuilder: (context, i) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 6),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(AppSizes.radius),
                            ),
                            child: RadioListTile(
                              value: model.selectedSchool,
                              groupValue: model.schools![i],
                              onChanged: (value) {
                                model.onSelectSchool(model.schools![i]);
                              },
                              title: Text(
                                model.schools![i].name,
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
                        },
                      ),
          ),
          const SizedBox(height: AppSizes.padding),
          AppButton(
            onTap: () {
              Navigator.pop(context, model.selectedSchool);
            },
            enable: model.selectedSchool != null,
            text: 'Pilih',
          ),
        ],
      );
    });
  }
}
