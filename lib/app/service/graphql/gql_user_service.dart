import 'package:satujuta_gql_client/client.dart';

import '../locator/service_locator.dart';
import 'gql_client.dart';

class GqlUserService {
  static final gqlClient = locator<GqlClient>().gqlClient;

  static Future<List<GUserFindManyData_userFindMany>?> getUsers({int take = 10, int? skip}) async {
    List<GUserFindManyData_userFindMany>? users;

    var req = GUserFindManyReq(
      (b) => b
        ..vars.userFindManyArgs.skip = skip
        ..vars.userFindManyArgs.take = take,
    );

    await gqlClient.request(req).listen((event) {
      if (event.data?.userFindMany != null) {
        users = event.data?.userFindMany!.toList();
      }
    }).asFuture();

    return users;
  }
}
