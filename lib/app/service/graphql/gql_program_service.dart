import 'package:satujuta_gql_client/operations/generated/program_find_many.data.gql.dart';
import 'package:satujuta_gql_client/operations/generated/program_find_many.req.gql.dart';

import '../../utility/console_log.dart';
import 'gql_client.dart';

class GqlProgramService {
  static Future<List<GProgramFindManyData_programFindMany>?> getAllPrograms({int take = 10, int? skip}) async {
    List<GProgramFindManyData_programFindMany> programs = [];

    var req = GProgramFindManyReq(
      (b) => b
        ..vars.programFindManyArgs.skip = skip
        ..vars.programFindManyArgs.take = take,
    );

    await GqlClient.client.request(req).asyncExpand((event) {
      if (event.data?.programFindMany != null) {
        programs = event.data?.programFindMany?.toList() ?? [];
      }
    });

    cl(programs);

    return programs;
  }
}
