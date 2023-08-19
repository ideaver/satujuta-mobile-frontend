import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../storage/local_storage_service.dart';

class GraphQLService {
  late GraphQLClient _client;
  // late ValueNotifier<GraphQLClient> _clientNotifier;

  // bool _renewingToken = false;

  GraphQLClient get client => _client;

  // ValueNotifier<GraphQLClient> get clientNotifier => _clientNotifier;

  GraphQLService() {
    final authLink = AuthLink(getToken: _getToken);
    // TODO SECURE ENDPOINT FROM ENV
    final httpLink = HttpLink("http://103.163.139.104:3000/graphql");

    /// The order of the links in the array matters!
    final link = Link.from([authLink, httpLink]);

    _client = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
      // cache: GraphQLCache(store: HiveStore()),
      // cache: GraphQLCache(store: InMemoryStore()),
      defaultPolicies: DefaultPolicies(query: Policies(fetch: FetchPolicy.networkOnly)),
    );

    // _clientNotifier = ValueNotifier(_client);
  }

  Future<String?> _getToken() async {
    // if (_renewingToken) return null;

    var authData = await LocalStorageService.readAuthData();

    if (authData == null) {
      return null;
    }

    final aT = authData.accessToken;
    final rT = authData.refreshToken;

    if (Jwt.isExpired(aT)) {
      final renewedToken = await _renewToken(rT);

      if (renewedToken == null) return null;

      authData.accessToken = renewedToken;

      await LocalStorageService.writeAuthData(authData);

      return 'Bearer $renewedToken';
    }

    return 'Bearer $aT';
  }

  Future<String?> _renewToken(String refreshToken) async {
    // try {
    //   _renewingToken = true;

    //   final result = await _client.query$RenewAccessToken(Options$Query$RenewAccessToken(
    //     fetchPolicy: FetchPolicy.networkOnly,
    //     variables: Variables$Query$RenewAccessToken(
    //       input: Input$RenewTokenInput(refreshToken: refreshToken),
    //     ),
    //   ));

    //   final resp = result.parsedData?.auth.renewToken;

    //   if (resp is Fragment$RenewTokenSuccess) {
    //     return resp.newAccessToken;
    //   } else {
    //     if (result.exception != null && result.exception!.graphqlErrors.isNotEmpty) {
    //       locator<AuthService>().logout();
    //     }
    //   }
    // } catch (e) {
    //   rethrow;
    // } finally {
    //   _renewingToken = false;
    // }

    return null;
  }
}
