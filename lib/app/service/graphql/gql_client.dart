import 'package:ferry/ferry.dart';
import 'package:satujuta_gql_client/client.dart';

class GqlClient {
  static late Client client;

  static void init() {
    client = initClient();
  }
}
