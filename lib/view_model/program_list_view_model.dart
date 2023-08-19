import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../app/service/graphql/gql_program_service.dart';
import '../app/service/graphql/graphql_service.dart';
import '../app/service/graphql/query/generated/program_find_many.graphql.dart';
import '../app/service/locator/service_locator.dart';
import '../app/service/network_checker/network_checker_service.dart';

class ProgramListViewModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  final network = locator<NetworkCheckerService>();
  final client = locator<GraphQLService>().client;

  List<Query$ProgramFindMany$programFindMany>? programs;

  void resetState() {
    programs = null;
  }

  Future<void> getAllPrograms() async {
    programs = await GqlProgramService.getAllPrograms();

    notifyListeners();
  }
}
