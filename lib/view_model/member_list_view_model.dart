import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/gql_user_service.dart';
import 'package:satujuta_gql_client/operations/generated/user_find_many.graphql.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/service/locator/service_locator.dart';
import '../app/utility/console_log.dart';
import 'user_view_model.dart';

class MemberListViewModel extends ChangeNotifier {
  final userViewModel = locator<UserViewModel>();

  TextEditingController searchCtrl = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  bool isSearchFocus = false;

  List<Query$UserFindMany$userFindMany>? userMembers;
  List<Query$UserFindMany$userFindMany>? userMembersActive;
  List<Query$UserFindMany$userFindMany>? userMembersInactive;

  // Students
  List<Query$UserFindMany$userFindMany>? userStudentsActive;
  List<Query$UserFindMany$userFindMany>? userStudentsInactive;

  void resetState() {
    userMembers = null;
    userMembersActive = null;
    userMembersInactive = null;
  }

  void focusListener() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (searchFocusNode.hasFocus) {
        isSearchFocus = true;
      } else {
        isSearchFocus = false;
      }
      notifyListeners();
    });
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

    if (res.parsedData?.userFindMany != null && !res.hasException) {
      userMembers = res.parsedData?.userFindMany;

      if (userMembers != null && userMembers!.isNotEmpty) {
        skip = userMembers!.length - 1;
        userMembersActive = userMembers!.where((e) => e.status == Enum$UserStatus.ACTIVE).toList();
        userMembersInactive = userMembers!.where((e) => e.status != Enum$UserStatus.INACTIVE).toList();
        userStudentsActive = userMembersActive!.where((e) => e.userRole == Enum$UserRole.STUDENT).toList();
        userStudentsInactive = userMembersInactive!.where((e) => e.userRole == Enum$UserRole.STUDENT).toList();
      }

      cl('[getAllUserMembers].userMembersActive = ${userMembersActive?.length}');

      notifyListeners();
    } else {
      cl('[getAllUserMembers].error = ${gqlErrorParser(res)}');
    }
  }

  // Future<int> getMemberPoints(String userId) async {
  //   var res = await GqlUserService.getCurrentUserPointBalanceByUserIdFromPointTransactionFindFirst(
  //     userId: userId,
  //   );

  //   if (res.parsedData?.pointTransactionFindFirst?.currentBalance != null && !res.hasException) {
  //     return (res.parsedData!.pointTransactionFindFirst?.currentBalance ?? 0).toInt();
  //   } else {
  //     cl('[getMemberPoints].error = ${gqlErrorParser(res)}');
  //     return 0;
  //   }
  // }
}
