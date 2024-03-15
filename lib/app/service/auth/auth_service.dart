import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/services/mobile/gql_auth_service.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../../../model/auth_model.dart';
import '../../../view_model/main_view_model.dart';
import '../../utility/console_log.dart';
import '../locator/service_locator.dart';
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
    // final rT = authData.refreshToken;

    // if (Jwt.isExpired(aT)) {
    //   final renewedToken = await renewToken(rT);

    //   if (renewedToken == null) return null;

    //   authData.accessToken = renewedToken;

    //   await LocalStorageService.writeAuthData(authData);

    //   return 'Bearer $renewedToken';
    // }

    return 'Bearer $aT';
  }

  // static Future<String?> renewToken(String refreshToken) async {
  //   try {
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
  //   } catch (e) {
  //     rethrow;
  //   } finally {
  //     renewingToken = false;
  //   }

  //   return null;
  // }

  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    final res = await GqlAuthService.authLogin(email: email, password: password);

    if (res.parsedData?.authLogin != null && !res.hasException) {
      auth = Auth(
        accessToken: res.parsedData!.authLogin!.accessToken,
        refreshToken: "",
        userId: res.parsedData!.authLogin!.user.id,
      );

      LocalStorageService.writeAuthData(auth!);

      cl('[login].authLogin = ${res.parsedData!.authLogin?.toJson()}');
      return null;
    } else {
      cl('[login].error = ${gqlErrorParser(res)}');
      return gqlErrorParser(res);
    }
  }

  static Future<void> logOut(NavigatorState navigator) async {
    await LocalStorageService.deleteAllData();
    auth = null;

    final mainViewModel = locator<MainViewModel>();
    mainViewModel.resetState();
    mainViewModel.initMainView(navigator);
  }
}
