import 'package:jwt_decode/jwt_decode.dart';

import '../../../model/auth_model.dart';
import '../storage/local_storage_service.dart';

class AuthService {
  static Auth? auth;
  static bool renewingToken = false;

  static Future<void> initAuth() async {
    final authData = await LocalStorageService.readAuthData();

    if (authData != null) {
      auth = authData;
    } else {
      auth = null;
    }
  }

  static Future<String?> getToken() async {
    if (renewingToken) return null;

    var authData = await LocalStorageService.readAuthData();

    if (authData == null) {
      return null;
    }

    final aT = authData.accessToken;
    final rT = authData.refreshToken;

    if (Jwt.isExpired(aT)) {
      final renewedToken = await renewToken(rT);

      if (renewedToken == null) return null;

      authData.accessToken = renewedToken;

      await LocalStorageService.writeAuthData(authData);

      return 'Bearer $renewedToken';
    }

    return 'Bearer $aT';
  }

  static Future<String?> renewToken(String refreshToken) async {
    try {
      // renewingToken = true;

      // final result = await GraphQLService.client.query$RenewAccessToken(Options$Query$RenewAccessToken(
      //   fetchPolicy: FetchPolicy.networkOnly,
      //   variables: Variables$Query$RenewAccessToken(
      //     input: Input$RenewTokenInput(refreshToken: refreshToken),
      //   ),
      // ));

      // final resp = result.parsedData?.auth.renewToken;

      // if (resp is Fragment$RenewTokenSuccess) {
      //   return resp.newAccessToken;
      // } else {
      //   if (result.exception != null && result.exception!.graphqlErrors.isNotEmpty) {
      //     locator<AuthService>().logout();
      //   }
      // }
    } catch (e) {
      rethrow;
    } finally {
      renewingToken = false;
    }

    return null;
  }

  // Future<void> login(Input$LoginInput input) async {
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

  // Future<void> registerUser(Input$UserInput input) async {
  //   final result = await client.mutate$RegisterUser(Options$Mutation$RegisterUser(
  //     variables: Variables$Mutation$RegisterUser(input: input),
  //   ));

  //   final resp = result.parsedData?.auth.register;

  //   if (resp is! Fragment$RegisterSuccess) {
  //     throw gqlErrorHandler(result.exception);
  //   }
  // }

  // Future<void> logout() async {
  //   await locator<SecureStorageService>().clearAuthData();
  //   _auth = null;
  //   notifyListeners();
  // }

  // // You can put this in a common utility functions so
  // // that you can reuse it in other services file too.
  // //
  // String gqlErrorHandler(OperationException? exception) {
  //   if (exception != null && exception.graphqlErrors.isNotEmpty) {
  //     return result.graphqlErrors.first.message;
  //   }
  //   return "Something went wrong.";
  // }
}
