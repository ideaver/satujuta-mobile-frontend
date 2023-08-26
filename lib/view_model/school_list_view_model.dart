import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/utility/console_log.dart';
import 'package:satujuta_gql_client/gql_error_parser.dart';
import 'package:satujuta_gql_client/gql_school_service.dart';
import 'package:satujuta_gql_client/operations/generated/school_find_many.graphql.dart';

class SchoolListViewModel extends ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();

  List<Query$SchoolFindMany$schoolFindMany>? schools;

  void resetState() {
    schools = null;
  }

  Future<void> getAllSchools({int skip = 0}) async {
    var res = await GqlSchoolService.schoolFindMany(skip: skip);

    if (res.parsedData?.schoolFindMany != null && !res.hasException) {
      schools = res.parsedData?.schoolFindMany;
      notifyListeners();
    } else {
      cl('[getAllSchools].error = ${gqlErrorParser(res)}');
    }
  }
}
