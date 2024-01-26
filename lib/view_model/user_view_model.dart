import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/reward_claim_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/transaction_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/user_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/user_find_one.graphql.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';
import 'package:satujuta_gql_client/services/mobile/gql_user_service.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';
import 'package:share_plus/share_plus.dart';

import '../app/service/auth/auth_service.dart';
import '../app/utility/console_log.dart';

class UserViewModel extends ChangeNotifier {
  Query$UserFindOne$userFindOne? user;
  Query$UserFindOne$userFindOne$accounts? userAccountBank;

  int totalReferredUser = 0;
  int totalUserStudent = 0;
  int totalUserPoint = 0;
  double totalUserCommission = 0;

  // TODO API UNAVAILABLE
  // List<Query$PointTransactionFindMany$pointTransactionFindMany>? userPointTransactions;
  List<Query$TransactionFindManyByAccountId$transactionFindMany>? userCommissionTransactions;
  List<Query$RewardClaimFindManyByUserId$rewardClaimFindMany>? userClaimedRewards;

  // TODO REMOVE TEMPORARY IMPLEMENTATION
  bool isCommisionClaimed = false;

  void resetState() {
    user = null;
  }

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
    var userId = AuthService.auth!.userId!;

    var res = await GqlUserService.userFindOne(id: userId);

    if (res.parsedData?.userFindOne != null && !res.hasException) {
      user = res.parsedData!.userFindOne;
      notifyListeners();

      cl(user?.toJson());

      // TODO ADD ANOTTHER ACCOUNT BY CATEGORY
      userAccountBank = user!.accounts?.where((e) => e.accountCategory == Enum$AccountCategory.BANK).firstOrNull;

      countReferredUser();
      countUserStudent();
      getUserPoint();
      getUserCommission();
      getUserPointTransactions();
      getUserCommissionTransactions();
      getUserClaimedRewards();
    } else {
      cl('[getUser].error = ${gqlErrorParser(res)}');
      return;
    }
  }

  Future<void> countReferredUser() async {
    if (user == null) {
      cl('[countReferredUser].user null');
      return;
    }

    var res = await GqlUserService.countReferredUserByUserId(userId: user!.id);

    if (res.parsedData?.userFindOne?.$_count.referredUsers != null && !res.hasException) {
      totalReferredUser = res.parsedData!.userFindOne?.$_count.referredUsers ?? 0;
      notifyListeners();
    } else {
      cl('[countReferredUser].error = ${gqlErrorParser(res)}');
    }
  }

  Future<void> countUserStudent() async {
    if (user == null) {
      cl('[countUserStudent].user null');
      return;
    }

    var res = await GqlUserService.countUserOfStudentWithinReferredId(userId: user!.id);

    if (res.parsedData?.userCount != null && !res.hasException) {
      totalUserStudent = (res.parsedData!.userCount ?? 0).toInt();
      notifyListeners();
    } else {
      cl('[countUserStudent].error = ${gqlErrorParser(res)}');
    }
  }

  Future<void> getUserPoint() async {
    if (user == null) {
      cl('[getUserPoint].user null');
      return;
    }

    // TODO API UNAVAILABLE
    // var res = await GqlUserService.getCurrentUserPointBalanceByUserIdFromPointTransactionFindFirst(
    //   userId: user!.id,
    // );

    // if (res.parsedData?.pointTransactionFindFirst?.currentBalance != null && !res.hasException) {
    //   totalUserPoint = (res.parsedData!.pointTransactionFindFirst?.currentBalance ?? 0).toInt();
    //   notifyListeners();
    // } else {
    //   cl('[getUserPoint].error = ${gqlErrorParser(res)}');
    // }
  }

  Future<void> getUserCommission() async {
    if (userAccountBank == null) {
      cl('[getUserCommission].userAccountBank null');
      return;
    }

    var res = await GqlUserService.getAccountTotalBalance(
      userAccountId: userAccountBank!.id,
    );

    if (res.parsedData?.getAccountTotalBalance != null && !res.hasException) {
      totalUserCommission = res.parsedData!.getAccountTotalBalance;
      notifyListeners();
    } else {
      cl('[getUserPoint].error = ${gqlErrorParser(res)}');
    }
  }

  Future<void> getUserPointTransactions({
    int skip = 0,
  }) async {
    if (user == null) {
      cl('[getUserPointTransactions].user null');
      return;
    }

    // TODO API UNAVAILABLE
    // var res = await GqlUserService.pointTransactionFindMany(
    //   userId: user!.id,
    //   skip: skip,
    // );

    // if (res.parsedData?.pointTransactionFindMany != null && !res.hasException) {
    //   if (skip == 0) {
    //     userPointTransactions = res.parsedData!.pointTransactionFindMany ?? [];
    //   } else {
    //     userPointTransactions?.addAll(res.parsedData!.pointTransactionFindMany ?? []);
    //   }
    //   notifyListeners();
    // } else {
    //   cl('[getUserPointTransactions].error = ${gqlErrorParser(res)}');
    // }
  }

  Future<void> getUserCommissionTransactions({
    int skip = 0,
  }) async {
    if (userAccountBank == null) {
      cl('[getUserCommissionTransactions].userAccountBank null');
      return;
    }

    var res = await GqlUserService.transactionFindManyByAccountId(
      fromAccountId: userAccountBank!.id,
      skip: skip,
    );

    if (res.parsedData?.transactionFindMany != null && !res.hasException) {
      if (skip == 0) {
        userCommissionTransactions = res.parsedData!.transactionFindMany ?? [];
      } else {
        userCommissionTransactions?.addAll(res.parsedData!.transactionFindMany ?? []);
      }
      notifyListeners();
    } else {
      cl('[getUserCommissionTransactions].error = ${gqlErrorParser(res)}');
    }
  }

  Future<void> getUserClaimedRewards({
    int skip = 0,
  }) async {
    if (user == null) {
      cl('[getUserClaimedRewards].user null');
      return;
    }

    var res = await GqlUserService.rewardClaimFindManyByUserId(
      userId: user!.id,
      skip: skip,
    );

    if (res.parsedData?.rewardClaimFindMany != null && !res.hasException) {
      if (skip == 0) {
        userClaimedRewards = res.parsedData!.rewardClaimFindMany ?? [];
      } else {
        userClaimedRewards?.addAll(res.parsedData!.rewardClaimFindMany ?? []);
      }
      notifyListeners();
    } else {
      cl('[getUserClaimedRewards].error = ${gqlErrorParser(res)}');
    }
  }

  void shareProfile() async {
    if (user == null) {
      return;
    }

    var title = '${user!.firstName} ${user!.lastName ?? ''}';
    var point = "Points: $totalUserPoint";

    await Share.share(
      '$title\n\n$point',
      subject: "SatuJuta App",
    );
  }

  void shareReferralCode() async {
    if (user == null) {
      return;
    }

    var title = 'Join SatuJuta App';
    var point = "Kode Referral: ${user!.referralCode}";

    await Share.share(
      '$title\n\n$point',
      subject: "SatuJuta App",
    );
  }
}
