import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:satujuta_app_mobile/app/service/graphql/gql_program_service.dart';
import 'package:satujuta_app_mobile/app/utility/console_log.dart';
import 'package:satujuta_gql_client/operations/generated/program_find_many.data.gql.dart';

import '../app/service/locator/service_locator.dart';
import '../app/service/network_checker/network_checker_service.dart';

class ProgramListViewModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  final network = locator<NetworkCheckerService>();

  List<GProgramFindManyData_programFindMany>? programs;

  void resetState() {}

  Future<void> getAllPrograms() async {
    // TODO GET USER

    cl('programs');

    programs = await GqlProgramService.getAllPrograms();

    cl(programs);

    notifyListeners();
  }
}
