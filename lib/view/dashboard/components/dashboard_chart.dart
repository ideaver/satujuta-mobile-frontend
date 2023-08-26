import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satujuta_app_mobile/view/dashboard/components/dashboard_chart_period.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/app_text_style.dart';
import '../../../app/service/locator/service_locator.dart';
import '../../../model/chart_model.dart';
import '../../../view_model/dashboard_view_model.dart';
import '../../../widget/atom/app_button.dart';
import '../../../widget/atom/app_modal.dart';

class DashboardChart extends StatefulWidget {
  const DashboardChart({Key? key}) : super(key: key);

  @override
  State<DashboardChart> createState() => _DashboardChartState();
}

class _DashboardChartState extends State<DashboardChart> {
  final dashboardViewModel = locator<DashboardViewModel>();

  List<StackedColumnSeries<ChartModel, String>> getStackedColumnSeries(List<ChartModel> chartData) {
    return <StackedColumnSeries<ChartModel, String>>[
      StackedColumnSeries<ChartModel, String>(
        dataSource: chartData,
        xValueMapper: (ChartModel data, _) => data.x,
        yValueMapper: (ChartModel data, _) => data.y,
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppSizes.radius / 2),
        width: 0.9,
        name: 'Poin',
      ),
    ];
  }

  double getChartMaxY(List<ChartModel> chartData) {
    if (chartData.isEmpty) {
      return 0;
    }

    return chartData.reduce((x, y) => x.y > y.y ? x : y).y.toDouble() + 10;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dashboardViewModel.initChart();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(builder: (context, model, _) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding / 2,
          vertical: AppSizes.padding,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      size: 12,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: AppSizes.padding / 2),
                    Text(
                      'REKAPITULASI KOMISI',
                      style: AppTextStyle.bold(
                        context,
                        fontSize: 12,
                        color: AppColors.baseLv4,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    AppButton(
                      onTap: () {
                        AppModal.show(
                          context: context,
                          title: 'Piilih Rentang',
                          child: const DashboardChartPeriod(),
                        );
                      },
                      text: model.selectedPeriod.name,
                      fontSize: 12,
                      rightIcon: Icons.keyboard_arrow_down_rounded,
                      buttonColor: Colors.transparent,
                      textColor: AppColors.base,
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSizes.padding / 2),
            SizedBox(
              height: 200,
              child: SfCartesianChart(
                margin: EdgeInsets.zero,
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                  axisLine: const AxisLine(width: 0),
                  majorGridLines: const MajorGridLines(width: 0),
                  majorTickLines: const MajorTickLines(size: 0),
                  labelStyle: AppTextStyle.medium(
                    context,
                    fontSize: 10,
                    color: AppColors.baseLv4,
                  ),
                  interval: 1,
                  labelIntersectAction: AxisLabelIntersectAction.multipleRows,
                ),
                primaryYAxis: NumericAxis(
                  axisLine: const AxisLine(width: 0),
                  majorGridLines: const MajorGridLines(
                    color: AppColors.baseLv5,
                    dashArray: [2, 6],
                  ),
                  majorTickLines: const MajorTickLines(size: 0),
                  labelStyle: AppTextStyle.medium(
                    context,
                    fontSize: 8,
                    color: AppColors.baseLv4,
                  ),
                  maximum: getChartMaxY(model.chartData),
                ),
                series: getStackedColumnSeries(model.chartData),
                tooltipBehavior: TooltipBehavior(enable: true),
              ),
            ),
          ],
        ),
      );
    });
  }
}
