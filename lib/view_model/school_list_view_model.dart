import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/gql_school_service.dart';
import 'package:satujuta_gql_client/operations/generated/school_find_many.graphql.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/utility/console_log.dart';

class SchoolListViewModel extends ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();

  List<Query$SchoolFindMany$schoolFindMany>? schoolFindMany;

  Query$SchoolFindMany$schoolFindMany? selectedSchool;

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

  void onSelectSchool(Query$SchoolFindMany$schoolFindMany school) {
    selectedSchool = school;
    notifyListeners();

    cl('[onSelectSchool].selectedSchool = ${selectedSchool?.id}: ${selectedSchool?.name}');
  }
}
