import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/program_category_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/program_find_many.graphql.dart';
import 'package:satujuta_gql_client/services/mobile/gql_program_service.dart';
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
    var res = await GqlProgramService.programCategoryFindMany();

    if (res.parsedData?.programCategoryFindMany != null && !res.hasException) {
      programCategories = res.parsedData?.programCategoryFindMany;
    } else {
      cl('[getAllPrograms].error = ${gqlErrorParser(res)}');
    }

    notifyListeners();
  }

  void onSelectCategory(
    NavigatorState navigator,
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
