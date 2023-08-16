import 'package:satujuta_gql_client/client.dart';

import 'gql_client.dart';

class GqlUserService {
  static Future<List<GUserFindManyData_userFindMany>?> getAllUsers({int take = 10, int? skip}) async {
    List<GUserFindManyData_userFindMany>? users;

    var req = GUserFindManyReq(
      (b) => b
        ..vars.userFindManyArgs.skip = skip
        ..vars.userFindManyArgs.take = take,
    );

    await GqlClient.client.request(req).listen((event) {
      if (event.data?.userFindMany != null) {
        users = event.data?.userFindMany!.toList();
      }
    }).asFuture();

    return users;
  }

  // static Future<List<GUserFindManyData_userFindMany>?> getUserById(int id) async {
  //   List<GUserFindManyData_userFindMany>? users;

  //   var req = GAccountFindOneReq(
  //     (b) => b..requestId = id,
  //   );

  //   await gqlClient.request(req).listen((event) {
  //     if (event.data?.userFindMany != null) {
  //       users = event.data?.userFindMany!.toList();
  //     }
  //   }).asFuture();

  //   return users;
  // }
}
