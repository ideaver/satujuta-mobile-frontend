import 'package:satujuta_gql_client/operations/generated/program_find_many.graphql.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';

import '../locator/service_locator.dart';
import 'graphql_service.dart';

class GqlProgramService {
  // static Future<List<GProgramFindManyData_programFindMany>?> getAllPrograms({int take = 10, int? skip}) async {
  //   List<GProgramFindManyData_programFindMany> programs = [];

  //   var req = GProgramFindManyReq(
  //     (b) => b
  //       ..vars.programFindManyArgs.skip = skip
  //       ..vars.programFindManyArgs.take = take,
  //   );

  //   await GqlClient.client.request(req).asyncExpand((event) {
  //     if (event.data?.programFindMany != null) {
  //       programs = event.data?.programFindMany?.toList() ?? [];
  //     }
  //   });

  //   cl(programs);

  //   return programs;
  // }

  // Future<void> getAllPrograms(Variables$Query$ProgramFindMany input) async {
  //   final result = await client.query$Login(Options$Query$Login(
  //     variables: Variables$Query$Login(input: input),
  //   ));

  //   final resp = result.parsedData?.auth.login;

  //   if (resp is Fragment$LoginSuccess) {
  //     _auth = Auth.fromJson(resp.toJson());
  //     storageService.storeAuthData(_auth!);
  //     notifyListeners();
  //   } else {
  //     throw gqlErrorHandler(result.exception);
  //   }
  // }
  static final client = locator<GraphQLService>().client;

  static Future<List<Query$ProgramFindMany$programFindMany>?> getAllPrograms() async {
    final result = await client.query$ProgramFindMany(Options$Query$ProgramFindMany(
      variables: Variables$Query$ProgramFindMany(
        programFindManyArgs: Input$ProgramFindManyArgs(
          take: 10,
        ),
      ),
    ));

    return result.parsedData?.programFindMany;
  }
}
