import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/utility/console_log.dart';
import 'package:satujuta_gql_client/gql_error_parser.dart';
import 'package:satujuta_gql_client/gql_program_service.dart';
import 'package:satujuta_gql_client/operations/generated/program_find_many.graphql.dart';

class ProgramListViewModel extends ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();

  List<Query$ProgramFindMany$programFindMany>? programs;

  void resetState() {
    programs = null;
  }

  Future<void> getAllPrograms({int skip = 0}) async {
    var res = await GqlProgramService.programFindMany(skip: skip);

    if (res.parsedData?.programFindMany != null && !res.hasException) {
      programs = res.parsedData?.programFindMany;
    } else {
      cl('[getAllPrograms].error = ${gqlErrorParser(res)}');
    }

    notifyListeners();
  }
}
