import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:satujuta_app_mobile/app/service/graphql/gql_user_service.dart';

import '../app/service/graphql/query/generated/user_find_one.graphql.dart';
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

  Future<void> getUser() async {
    // TODO LOGIN GET USER ID

    // TODO REMOVE DEV PURPOSE ONLY
    var users = await GqlUserService.getAllUsers();
    String userId = users?.first.id ?? "c5e4f2db-080b-41ba-8df8-033c19fe55c6";

    user = await GqlUserService.getUserById(userId);

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
