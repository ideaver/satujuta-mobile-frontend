import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/reward_find_many_scalar.graphql.dart';
import 'package:satujuta_gql_client/services/mobile/gql_reward_service.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/service/locator/service_locator.dart';
import '../app/utility/console_log.dart';
import '../widget/atom/app_dialog.dart';
import 'user_view_model.dart';

class RewardListViewModel extends ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();

  // List<Query$ProgramCategoryFindMany$programCategoryFindMany>? rewardCategories;
  // Query$ProgramCategoryFindMany$programCategoryFindMany? selectedCategory;

  List<Query$RewardFindManyScalar$rewardFindMany>? rewardFindMany;

  int selectedTabIndex = -1;

  void resetState() {
    // rewardCategories = null;
    // selectedCategory = null;
    rewardFindMany = null;
    selectedTabIndex = -1;
  }

  void initRewardListView() {
    getAllRewardCategories();
    getAllRewards();
  }

  Future<void> getAllRewards({int skip = 0, String contains = ""}) async {
    var res = await GqlRewardService.rewardFindMany(skip: skip);

    // TODO QUERY BY STATUS
    // var res = selectedCategory == null
    //     ? await GqlRewardService.rewardFindMany(skip: skip)
    //     : await GqlRewardService.programFindManyByCategoryId(programCategoryId: selectedCategory!.id, skip: skip);

    if (res.parsedData?.rewardFindMany != null && !res.hasException) {
      if (skip == 0) {
        rewardFindMany = res.parsedData?.rewardFindMany;
      } else {
        rewardFindMany?.addAll(res.parsedData?.rewardFindMany ?? []);
      }
    } else {
      cl('[getAllRewards].error = ${gqlErrorParser(res)}');
    }

    notifyListeners();
  }

  Future<void> getAllRewardCategories() async {
    // var res = await GqlRewardService.rogramCategoryFindManyWhereProgramNotNull();

    // if (res.parsedData?.programCategoryFindMany != null && !res.hasException) {
    //   programCategories = res.parsedData?.programCategoryFindMany;
    // } else {
    //   cl('[getAllRewards].error = ${gqlErrorParser(res)}');
    // }

    // notifyListeners();
  }

  Future<void> claimReward(NavigatorState navigator, int rewardId) async {
    AppDialog.showDialogProgress(navigator);

    final userViewModel = locator<UserViewModel>();

    var res = await GqlRewardService.rewardClaimCreateOne(
      rewardId: rewardId,
      userId: userViewModel.user!.id,
    );

    navigator.pop();

    if (res.parsedData?.rewardClaimCreateOne != null && !res.hasException) {
      cl('[claimReward].error = ${res.parsedData?.rewardClaimCreateOne?.toJson()}');
      getAllRewards();
    } else {
      cl('[claimReward].error = ${gqlErrorParser(res)}');
    }
  }

  void onSelectCategory(int tabIndex) {
    final userViewModel = locator<UserViewModel>();

    selectedTabIndex = tabIndex;
    notifyListeners();

    if (selectedTabIndex == 0) {
      rewardFindMany = rewardFindMany?.where((e) => e.pointCost <= userViewModel.totalUserCommission).toList();
    }

    if (selectedTabIndex == 1) {
      rewardFindMany = rewardFindMany?.where((e) => e.pointCost > userViewModel.totalUserCommission).toList();
    }

    notifyListeners();

    cl('[onSelectCategory].selectedTabIndex =  $selectedTabIndex');
  }
}
