import 'package:flutter/material.dart';
import '../app/service/locator/service_locator.dart';
import 'user_view_model.dart';
import '../widget/atom/app_dialog.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/program_category_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/program_find_many.graphql.dart';
import 'package:satujuta_gql_client/services/mobile/gql_program_service.dart';
import 'package:satujuta_gql_client/services/mobile/gql_user_service.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/utility/console_log.dart';

class ProgramListViewModel extends ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();

  List<Query$ProgramCategoryFindMany$programCategoryFindMany>? programCategories;
  Query$ProgramCategoryFindMany$programCategoryFindMany? selectedCategory;

  List<Query$ProgramFindMany$programFindMany>? programFindMany;

  int selectedTabIndex = -1;

  void resetState() {
    programCategories = null;
    selectedCategory = null;
    programFindMany = null;
    selectedTabIndex = -1;
  }

  void initProgramListView() {
    getAllProgramCategories();
    getAllPrograms();
  }

  Future<void> getAllPrograms({int skip = 0, String contains = ""}) async {
    var res = selectedCategory == null
        ? await GqlProgramService.programFindMany(skip: skip)
        : await GqlProgramService.programFindManyByCategoryId(programCategoryId: selectedCategory!.id, skip: skip);

    if (res.parsedData?.programFindMany != null && !res.hasException) {
      if (skip == 0) {
        programFindMany = res.parsedData?.programFindMany;
      } else {
        programFindMany?.addAll(res.parsedData?.programFindMany ?? []);
      }
    } else {
      cl('[getAllPrograms].error = ${gqlErrorParser(res)}');
    }

    notifyListeners();
  }

  Future<void> getAllProgramCategories() async {
    var res = await GqlProgramService.rogramCategoryFindManyWhereProgramNotNull();

    if (res.parsedData?.programCategoryFindMany != null && !res.hasException) {
      programCategories = res.parsedData?.programCategoryFindMany;
    } else {
      cl('[getAllPrograms].error = ${gqlErrorParser(res)}');
    }

    notifyListeners();
  }

  Future<void> joinProgram(NavigatorState navigator, int programId) async {
    AppDialog.showDialogProgress(navigator);

    final userViewModel = locator<UserViewModel>();

    var res = await GqlUserService.userUpdateOneOfProgramParticipation(
      programId: programId,
      userId: userViewModel.user!.id,
    );

    navigator.pop();

    if (res.parsedData?.userUpdateOne != null && !res.hasException) {
      cl('[joinProgram].error = ${res.parsedData?.userUpdateOne?.toJson()}');
      getAllPrograms();
    } else {
      cl('[joinProgram].error = ${gqlErrorParser(res)}');
    }
  }

  void onSelectCategory(
    Query$ProgramCategoryFindMany$programCategoryFindMany? category,
    int tabIndex,
  ) {
    selectedCategory = category;
    selectedTabIndex = tabIndex;
    notifyListeners();

    if (category != null) {
      getAllPrograms();
    }

    cl('[onSelectCategory].selectedCategory =  ${selectedCategory?.id}: ${selectedCategory?.name}');
  }
}
