import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:satujuta_app_mobile/app/service/graphql/gql_user_service.dart';

import '../app/service/graphql/graphql_service.dart';
import '../app/service/graphql/query/generated/user_find_many.graphql.dart';
import '../app/service/graphql/schema/generated/schema.graphql.dart';
import '../app/service/locator/service_locator.dart';
import '../app/service/network_checker/network_checker_service.dart';
import '../app/utility/console_log.dart';
import 'user_view_model.dart';

class MemberListViewModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  final network = locator<NetworkCheckerService>();
  final client = locator<GraphQLService>().client;
  final userViewModel = locator<UserViewModel>();

  List<Query$UserFindMany$userFindMany>? userMembers;
  List<Query$UserFindMany$userFindMany>? userMembersActive;
  List<Query$UserFindMany$userFindMany>? userMembersInactive;

  // PAGINATION PURPOSE
  // Set skip value to the end of current fetched data index
  int? skip;

  void resetState() {
    userMembers = null;
    userMembersActive = null;
    userMembersInactive = null;
  }

  Future<void> getAllUserMembers({bool loadmore = false}) async {
    if (userViewModel.user == null) {
      cl('[getAllUserMembers].user null');
      return;
    }

    userMembers = await GqlUserService.getAllUserMembers(
      userViewModel.user!.id,
      skip: loadmore ? skip : null,
    );

    if (userMembers != null && userMembers!.isNotEmpty) {
      skip = userMembers!.length - 1;
      userMembersActive = userMembers!.where((e) => e.status == Enum$UserStatus.ACTIVE).toList();
      userMembersInactive = userMembers!.where((e) => e.status != Enum$UserStatus.INACTIVE).toList();
    }

    cl('[getAllUserMembers].userMembersActive = ${userMembersActive?.length}');
    cl('[getAllUserMembers].userMembers?.first = ${userMembers?.first.status}');

    notifyListeners();
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
