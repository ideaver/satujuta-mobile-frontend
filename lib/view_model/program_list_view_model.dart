import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:satujuta_app_mobile/app/utility/console_log.dart';
import 'package:satujuta_gql_client/gql_error_parser.dart';
import 'package:satujuta_gql_client/gql_program_service.dart';
import 'package:satujuta_gql_client/operations/generated/program_find_many.graphql.dart';

import '../app/service/locator/service_locator.dart';
import '../app/service/network_checker/network_checker_service.dart';

class ProgramListViewModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  final network = locator<NetworkCheckerService>();

  List<Query$ProgramFindMany$programFindMany>? programs;

  void resetState() {
    programs = null;
  }

  Future<void> getAllPrograms({int skip = 0}) async {
    var res = await GqlProgramService.programFindMany(skip: skip);

    if (res.parsedData != null && !res.hasException) {
      programs = res.parsedData?.programFindMany;
    } else {
      cl('[getAllPrograms].error = ${gqlErrorParser(res)}');
    }

    notifyListeners();
  }
}
