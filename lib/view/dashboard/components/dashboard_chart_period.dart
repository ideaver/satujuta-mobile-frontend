import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_app_mobile/app/utility/date_formatter.dart';
import 'package:satujuta_app_mobile/widget/atom/app_dialog.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../app/service/locator/service_locator.dart';
import '../../../view_model/dashboard_view_model.dart';
import '../../../widget/atom/app_button.dart';

class DashboardChartPeriod extends StatefulWidget {
  const DashboardChartPeriod({Key? key}) : super(key: key);

  @override
  State<DashboardChartPeriod> createState() => _DashboardChartPeriodState();
}

class _DashboardChartPeriodState extends State<DashboardChartPeriod> {
  final dashboardViewModel = locator<DashboardViewModel>();

  var periodList = Enum$Period.values;
  late Enum$Period selectedPeriod;

  @override
  void initState() {
    selectedPeriod = dashboardViewModel.selectedPeriod;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(builder: (context, model, _) {
      return Column(
        children: [
          dateRange(model),
          const SizedBox(height: AppSizes.padding),
          ListView.builder(
            shrinkWrap: true,
            itemCount: periodList.length - 1,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(bottom: 6),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                ),
                child: RadioListTile(
                  value: selectedPeriod,
                  groupValue: periodList[i],
                  onChanged: (value) {
                    selectedPeriod = periodList[i];
                    setState(() {});
                  },
                  title: Text(
                    periodList[i].name,
                    style: AppTextStyle.bold(context),
                  ),
                  activeColor: AppColors.primary,
                  contentPadding: const EdgeInsets.fromLTRB(
                    AppSizes.padding,
                    AppSizes.padding / 1.8,
                    AppSizes.padding * 1.5,
                    AppSizes.padding / 1.8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radius),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: AppSizes.padding),
          AppButton(
            onTap: () async {
              final navigator = Navigator.of(context);
              AppDialog.showDialogProgress(navigator);

              model.onChangedPeriod(selectedPeriod);
              await model.initChart();

              navigator.pop();
              navigator.pop();
            },
            text: 'Terapkan',
          ),
        ],
      );
    });
  }

  Widget dateRange(DashboardViewModel model) {
    final navigator = Navigator.of(context);

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              model.onSelectStartDate(navigator);
            },
            child: Container(
              padding: const EdgeInsets.all(AppSizes.padding),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSizes.radius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Date',
                        style: AppTextStyle.medium(
                          context,
                          fontSize: 10,
                          color: AppColors.baseLv4,
                        ),
                      ),
                      Text(
                        DateFormatter.slashDate(model.startDate.toIso8601String()),
                        style: AppTextStyle.bold(context),
                      ),
                    ],
                  ),
                  const Icon(
                    CupertinoIcons.calendar,
                    color: AppColors.baseLv4,
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSizes.padding / 2),
        Expanded(
          child: GestureDetector(
            onTap: () {
              model.onSelectEndDate(navigator);
            },
            child: Container(
              padding: const EdgeInsets.all(AppSizes.padding),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSizes.radius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Date',
                        style: AppTextStyle.medium(
                          context,
                          fontSize: 10,
                          color: AppColors.baseLv4,
                        ),
                      ),
                      Text(
                        DateFormatter.slashDate(model.endDate.toIso8601String()),
                        style: AppTextStyle.bold(context),
                      ),
                    ],
                  ),
                  const Icon(
                    CupertinoIcons.calendar,
                    color: AppColors.baseLv4,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
