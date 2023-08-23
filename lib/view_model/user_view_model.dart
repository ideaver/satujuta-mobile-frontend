import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:satujuta_gql_client/gql_error_parser.dart';
import 'package:satujuta_gql_client/gql_user_service.dart';
import 'package:satujuta_gql_client/operations/generated/user_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/generated/user_find_one.graphql.dart';

import '../app/service/locator/service_locator.dart';
import '../app/service/network_checker/network_checker_service.dart';
import '../app/utility/console_log.dart';

class UserViewModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  final network = locator<NetworkCheckerService>();

  Query$UserFindOne$userFindOne? user;

  int userPoint = 0;
  int userCommission = 0;

  void resetState() {
    user = null;
  }

  // TODO REMOVE DEV PURPOSE ONLY
  Future<List<Query$UserFindMany$userFindMany>?> getAllUser({int skip = 0}) async {
    var res = await GqlUserService.userFindMany(
      skip: skip,
    );

    if (res.parsedData?.userFindMany != null && !res.hasException) {
      cl(res.parsedData!.userFindMany?.length);
      return res.parsedData!.userFindMany!;
    } else {
      cl('[getAllUser].error = ${gqlErrorParser(res)}');
      return null;
    }
  }

  Future<void> getUser() async {
    // TODO LOGIN GET USER ID
    // TODO REMOVE DEV PURPOSE ONLY
    var users = await getAllUser();
    String userId = users?.first.id ?? "8a976aa9-2007-45ef-9b0a-d8545b81ebc6";

    var res = await GqlUserService.userFindOne(userId);

    if (res.parsedData?.userFindOne != null && !res.hasException) {
      user = res.parsedData!.userFindOne;
    } else {
      cl('[getUser].error = ${gqlErrorParser(res)}');
      return;
    }

    cl(user?.toJson());

    notifyListeners();

    calculateUserPoint();
    calculateUserCommssion();
  }

  void calculateUserPoint() {
    if (user == null) {
      return;
    }

    if (user!.PointTransactions != null) {
      var points = user!.PointTransactions!.map((e) => e.amount).toList();

      if (points.isNotEmpty) {
        userPoint = points.reduce((v, e) => v + e).toInt();
      }
    }

    notifyListeners();
  }

  void calculateUserCommssion() {
    if (user == null) {
      return;
    }

    // TODO GET COMMISION
    // if (user!.claimedRewards != null) {
    //   var commission = user!.claimedRewards.map((e) => e.);

    //   if (points.isNotEmpty) {
    //     userCommission = commission.reduce((v, e) => v + e).toInt();
    //   }
    // }

    notifyListeners();
  }
}
