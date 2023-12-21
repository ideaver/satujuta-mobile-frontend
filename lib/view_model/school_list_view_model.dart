import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/school_find_many.graphql.dart';
import 'package:satujuta_gql_client/services/mobile/gql_school_service.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/utility/console_log.dart';

class SchoolListViewModel extends ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();

  List<Query$SchoolFindManyByName$schoolFindMany>? schoolFindMany;

  Query$SchoolFindManyByName$schoolFindMany? selectedSchool;

  void resetState() {
    schoolFindMany = null;
    selectedSchool = null;
  }

  Future<void> getSchools(
    NavigatorState navigator, {
    required int cityId,
    int skip = 0,
    String contains = "",
  }) async {
    var res = await GqlSchoolService.schoolFindManyByName(
      cityId: cityId,
      skip: skip,
      contains: contains,
    );

    if (res.parsedData?.schoolFindMany != null && !res.hasException) {
      if (skip == 0) {
        schoolFindMany = res.parsedData?.schoolFindMany;
      } else {
        schoolFindMany?.addAll(res.parsedData?.schoolFindMany ?? []);
      }

      notifyListeners();
    } else {
      cl('[getSchools].error = ${gqlErrorParser(res)}');
    }

    cl('[getSchools].schoolFindMany.length = ${schoolFindMany?.length}');
  }

  void onSelectSchool(Query$SchoolFindManyByName$schoolFindMany school) {
    selectedSchool = school;
    notifyListeners();

    cl('[onSelectSchool].selectedSchool = ${selectedSchool?.id}: ${selectedSchool?.name}');
  }
}
