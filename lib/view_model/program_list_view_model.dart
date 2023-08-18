import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:satujuta_gql_client/operations/generated/program_find_many.graphql.dart';

import '../app/service/graphql/gql_program_service.dart';
import '../app/service/graphql/graphql_service.dart';
import '../app/service/locator/service_locator.dart';
import '../app/service/network_checker/network_checker_service.dart';

class ProgramListViewModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  final network = locator<NetworkCheckerService>();

  final client = locator<GraphQLService>().client;

  // List<GProgramFindManyData_programFindMany>? programs;
  List<Query$ProgramFindMany$programFindMany>? programs;

  void resetState() {}

  // Future<void> getAllPrograms() async {
  //   // TODO GET USER

  //   cl('programs');

  //   programs = await GqlProgramService.getAllPrograms();

  //   cl(programs);

  //   notifyListeners();
  // }

  Future<void> getAllPrograms() async {
    // final result = await client.query$ProgramFindMany(Options$Query$ProgramFindMany(
    //   variables: Variables$Query$ProgramFindMany(
    //     programFindManyArgs: Input$ProgramFindManyArgs(
    //       take: 10,
    //     ),
    //   ),
    // ));

    programs = await GqlProgramService.getAllPrograms();

    notifyListeners();
  }
}
