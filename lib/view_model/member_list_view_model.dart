import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:satujuta_gql_client/gql_error_parser.dart';
import 'package:satujuta_gql_client/gql_user_service.dart';
import 'package:satujuta_gql_client/operations/generated/user_find_many.graphql.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';

import '../app/service/locator/service_locator.dart';
import '../app/service/network_checker/network_checker_service.dart';
import '../app/utility/console_log.dart';
import 'user_view_model.dart';

class MemberListViewModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  final network = locator<NetworkCheckerService>();
  final userViewModel = locator<UserViewModel>();

  List<Query$UserFindMany$userFindMany>? userMembers;
  List<Query$UserFindMany$userFindMany>? userMembersActive;
  List<Query$UserFindMany$userFindMany>? userMembersInactive;

  void resetState() {
    userMembers = null;
    userMembersActive = null;
    userMembersInactive = null;
  }

  Future<void> getAllUserMembers({int skip = 0}) async {
    if (userViewModel.user == null) {
      cl('[getAllUserMembers].user null');
      return;
    }

    var res = await GqlUserService.referredUserFindManyByReferrerId(
      userViewModel.user!.id,
      skip: skip,
    );

    if (res.parsedData != null && !res.hasException) {
      userMembers = res.parsedData?.userFindMany;

      if (userMembers != null && userMembers!.isNotEmpty) {
        skip = userMembers!.length - 1;
        userMembersActive = userMembers!.where((e) => e.status == Enum$UserStatus.ACTIVE).toList();
        userMembersInactive = userMembers!.where((e) => e.status != Enum$UserStatus.INACTIVE).toList();
      }

      cl('[getAllUserMembers].userMembersActive = ${userMembersActive?.length}');

      notifyListeners();
    } else {
      cl('[getAllUserMembers].error = ${gqlErrorParser(res)}');
    }
  }

  int calculateMemberPoint(List<Query$UserFindMany$userFindMany$PointTransactions>? pointTransactions) {
    if (pointTransactions != null) {
      var points = pointTransactions.map((e) => e.amount).toList();

      if (points.isNotEmpty) {
        return points.reduce((v, e) => v + e).toInt();
      }

      return 0;
    }

    return 0;
  }
}
