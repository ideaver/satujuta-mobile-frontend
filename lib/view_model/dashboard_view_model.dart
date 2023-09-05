import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/gql_user_service.dart';
import 'package:satujuta_gql_client/operations/generated/get_account_balance_by_custom_period.graphql.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../../../app/const/app_consts.dart';
import '../../../model/chart_model.dart';
import '../app/service/locator/service_locator.dart';
import '../app/utility/console_log.dart';
import 'user_view_model.dart';

class DashboardViewModel extends ChangeNotifier {
  final userViewModel = locator<UserViewModel>();

  double totalUserCommission = 0;
  List<Query$GetAccountBalanceByCustomPeriod$getAccountBalanceByCustomPeriod>? periodicUserCommissions;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  Enum$Period selectedPeriod = Enum$Period.MONTHLY;

  List<ChartModel> chartData = [];

  void resetState() {
   totalUserCommission = 0;
   periodicUserCommissions = null;
   startDate = DateTime.now();
   endDate = DateTime.now();
   selectedPeriod = Enum$Period.MONTHLY;
  }

  void onChangedPeriod(Enum$Period period) {
    selectedPeriod = period;
    notifyListeners();
  }

  Future<void> initChart() async {
    periodicUserCommissions = await getUserCommissionPeriodic();

    cl('[initChart].periodicUserCommissions.length ${periodicUserCommissions?.length}');

    if (periodicUserCommissions == null) {
      return;
    }

    if (selectedPeriod == Enum$Period.WEEKLY) {
      chartData = [
        ...List.generate(periodicUserCommissions!.length, (i) {
          return ChartModel(
            x: (i + 1).toString(),
            y: (periodicUserCommissions![i].totalBalance ?? 0).toInt(),
          );
        })
      ];
    }

    if (selectedPeriod == Enum$Period.MONTHLY) {
      chartData = [
        ...List.generate(periodicUserCommissions!.length, (i) {
          var month = int.tryParse(periodicUserCommissions![i].period!.split('/').first) ?? 0;
          return ChartModel(
            x: getMonthName(month),
            y: (periodicUserCommissions![i].totalBalance ?? 0).toInt(),
          );
        })
      ];
    }

    if (selectedPeriod == Enum$Period.YEARLY) {
      chartData = [
        ...List.generate(periodicUserCommissions!.length, (i) {
          var year = periodicUserCommissions![i].period!.split('/').last;
          return ChartModel(
            x: year,
            y: (periodicUserCommissions![i].totalBalance ?? 0).toInt(),
          );
        })
      ];
    }

    notifyListeners();
  }

  Future<List<Query$GetAccountBalanceByCustomPeriod$getAccountBalanceByCustomPeriod>>
      getUserCommissionPeriodic() async {
    if (userViewModel.userAccountBank == null) {
      cl('[getUserCommissionPeriodic].userAccountBank null');
      return [];
    }

    var res = await GqlUserService.getAccountBalanceByCustomPeriod(
      userAccountId: userViewModel.userAccountBank!.id,
      startDate: startDate.toIso8601String(),
      endDate: endDate.toIso8601String(),
      period: selectedPeriod,
    );

    if (res.parsedData?.getAccountBalanceByCustomPeriod != null && !res.hasException) {
      return res.parsedData!.getAccountBalanceByCustomPeriod;
    } else {
      cl('[getUserCommissionPeriodic].error = ${gqlErrorParser(res)}');
      return [];
    }
  }

  void onSelectStartDate(NavigatorState navigator) async {
    var date = await showDatePicker(
      context: navigator.context,
      initialDate: startDate,
      firstDate: DateTime.parse(userViewModel.user!.createdAt),
      lastDate: endDate,
    );

    if (date != null) {
      startDate = date;
      notifyListeners();
    }
  }

  void onSelectEndDate(NavigatorState navigator) async {
    var date = await showDatePicker(
      context: navigator.context,
      initialDate: startDate,
      firstDate: startDate,
      lastDate: DateTime.now(),
    );

    if (date != null) {
      endDate = date;
      notifyListeners();
    }
  }
}
