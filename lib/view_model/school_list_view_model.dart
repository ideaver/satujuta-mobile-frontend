import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/utility/console_log.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';
import 'package:satujuta_gql_client/gql_school_service.dart';
import 'package:satujuta_gql_client/operations/generated/school_find_many.graphql.dart';

class SchoolListViewModel extends ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();

  List<Query$SchoolFindMany$schoolFindMany>? schools;

  Query$SchoolFindMany$schoolFindMany? selectedSchool;

  void resetState() {
    schools = null;
    selectedSchool = null;
  }

  Future<void> getSchools(NavigatorState navigator, {int skip = 0, String? contains}) async {
    var res = await GqlSchoolService.schoolFindMany(skip: skip);

    if (res.parsedData?.schoolFindMany != null && !res.hasException) {
      schools = res.parsedData?.schoolFindMany;
      notifyListeners();
    } else {
      cl('[getSchools].error = ${gqlErrorParser(res)}');
    }
  }

  void onSelectSchool(Query$SchoolFindMany$schoolFindMany school) {
    selectedSchool = school;
    notifyListeners();

    cl('[onSelectSchool].selectedSchool = ${selectedSchool?.id}: ${selectedSchool?.name}');
  }
}
