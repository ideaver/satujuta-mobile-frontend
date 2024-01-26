import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/user_find_many.graphql.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';
import 'package:satujuta_gql_client/services/mobile/gql_user_service.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/service/locator/service_locator.dart';
import '../app/utility/console_log.dart';
import '../widget/atom/app_dialog.dart';
import '../widget/atom/app_snackbar.dart';
import 'user_view_model.dart';

class MemberListViewModel extends ChangeNotifier {
  final userViewModel = locator<UserViewModel>();

  TextEditingController searchCtrl = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  bool isSearchFocus = false;

  Query$UserFindMany$userFindMany? userData;

  List<Query$UserFindMany$userFindMany>? userMembers;
  List<Query$UserFindMany$userFindMany>? userMembersActive;
  List<Query$UserFindMany$userFindMany>? userMembersInactive;

  // Students
  List<Query$UserFindMany$userFindMany>? userStudentsActive;
  List<Query$UserFindMany$userFindMany>? userStudentsInactive;

  void resetState() {
    isSearchFocus = false;
    userData = null;
    userMembers = null;
    userMembersActive = null;
    userMembersInactive = null;
    userStudentsActive = null;
    userStudentsInactive = null;
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

  Future<void> getAllUserMembers({
    Query$UserFindMany$userFindMany? user,
    int skip = 0,
    String contains = "",
  }) async {
    if (user == null && userViewModel.user == null) {
      cl('[getAllUserMembers].user null');
      return;
    }

    // Initialize user data for pageState = PageStateEnum.viewAsOther
    userData ??= user;


    var res = await GqlUserService.userFindManyByReferrerId(
      userData != null ? userData!.id : userViewModel.user!.id,
      skip: skip,
      contains: contains,
    );

    if (res.parsedData?.userFindMany != null && !res.hasException) {
      if (skip == 0) {
        userMembers = res.parsedData?.userFindMany;
      } else {
        userMembers?.addAll(res.parsedData?.userFindMany ?? []);
      }

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

  void onTapDeleteMember(NavigatorState navigator, String userId) async {
    AppDialog.showDialogProgress(navigator);

    var errorRes = await deleteMember(userId);

    if (errorRes == null) {
      navigator.pop();
      AppSnackbar.show(navigator, title: "Berhasil di hapus");
    } else {
      navigator.pop();
      AppDialog.showErrorDialog(navigator, message: errorRes);
    }
  }

  Future<String?> deleteMember(String userId) async {
    var res = await GqlUserService.userDelete(userId: userId);

    if (res.parsedData?.userDelete != null && !res.hasException) {
      return null;
    } else {
      cl('[deleteMember].error = ${gqlErrorParser(res)}');
      return gqlErrorParser(res);
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
