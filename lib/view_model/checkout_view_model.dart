import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/view_model/user_view_model.dart';
import 'package:satujuta_app_mobile/widget/atom/app_dialog.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/get_all_bank_info.graphql.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/order_find_first_by_user_id.graphql.dart';
import 'package:satujuta_gql_client/services/mobile/gql_order_service.dart';
import 'package:satujuta_gql_client/services/mobile/gql_payment_service.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/service/locator/service_locator.dart';
import '../app/service/storage/local_storage_service.dart';
import '../app/utility/console_log.dart';
import '../view/web_view/web_view.dart';

class CheckoutViewModel extends ChangeNotifier {
  final userViewModel = locator<UserViewModel>();

  List<Query$GetAllBankInfo$getBankInfo>? bankInfoList;
  // String? selectedBankCode;
  Map<String, String>? selectedPaymentMethod;
  // Enum$BillSenderBankType? selectedPaymentMethod;

  Query$OrderFindFirstByUserId$orderFindFirst? latestOrder;
  // Query$OrderFindOne$orderFindOne? order;

  // TODO METHOD PAYMENT
  // Query$BankFindMany$bankFindMany? selectedPaymentMethod;

  void resetState() {
    // order = null;
    latestOrder = null;
  }

  // Future<void> getOrder(int orderId) async {
  //   var res = await GqlOrderService.orderFindOne(orderId: orderId);

  //   if (res.parsedData?.orderFindOne != null && !res.hasException) {
  //     order = res.parsedData!.orderFindOne;
  //     notifyListeners();

  //     cl(order?.toJson());
  //   } else {
  //     cl('[getOrder].error = ${gqlErrorParser(res)}');
  //     return;
  //   }
  // }

  Future<void> getLatestOrder() async {
    var authData = await LocalStorageService.readAuthData();

    cl('==== [getLatestOrder].user ${authData?.toJson()}');
    if (authData?.userId == null) {
      cl('[getLatestOrder].user null');
      return;
    }

    var res = await GqlOrderService.orderFindFirstByUserId(userId: authData!.userId!);

    if (res.parsedData?.orderFindFirst != null && !res.hasException) {
      latestOrder = res.parsedData!.orderFindFirst;
      notifyListeners();

      cl(latestOrder?.toJson());
    } else {
      cl('[getLatestOrder].error = ${gqlErrorParser(res)}');
      return;
    }
  }

  Future<void> getBankInfoList() async {
    var res = await GqlPaymentService.getBankInfo();

    if (res.parsedData?.getBankInfo != null && !res.hasException) {
      bankInfoList = res.parsedData!.getBankInfo;
      notifyListeners();

      cl(bankInfoList?.length);
    } else {
      cl('[getBankInfoList].error = ${gqlErrorParser(res)}');
      return;
    }
  }

  Future<String?> createBill(
    NavigatorState navigator, {
    required String title,
    required int amount,
    required String senderName,
    required String senderEmail,
    required String senderPhoneNumber,
    required String senderAddress,
    required String senderBank,
    required String senderBankType,
  }) async {
    var res = await GqlPaymentService.createBill(
      title: title,
      amount: amount,
      senderName: '${userViewModel.user!.firstName} ${userViewModel.user!.lastName}',
      senderEmail: userViewModel.user!.email,
      senderPhoneNumber: userViewModel.user!.whatsappNumber,
      senderAddress: userViewModel.user!.address.name,
      senderBank: senderBank,
      senderBankType: senderBankType,
    );

    if (res.parsedData?.createBill != null && !res.hasException) {
      // TODO
      var bill = res.parsedData!.createBill;

      await navigator.pushNamed(
        WebView.routeName,
        arguments: bill!.link_url,
      );

      return null;
    } else {
      cl('[createBill].res = $res');
      cl('[createBill].error = ${gqlErrorParser(res)}');
      return gqlErrorParser(res);
    }
  }

  void onSelectPaymentMethod(Map<String, String> method) {
    selectedPaymentMethod = method;
    notifyListeners();
  }

  void onTapPay(NavigatorState navigator) async {
    // if (selectedPaymentMethod == null) {
    //   cl('[onTapPay].selectedPaymentMethod null');
    //   return;
    // }

    if (userViewModel.user == null) {
      cl('[createBill].user null');
      return;
    }

    AppDialog.showDialogProgress(navigator);

    String? errRes = await createBill(
      navigator,
      title: '${latestOrder?.cart?.first.membershipItem?.name}',
      amount: latestOrder?.total.toInt() ?? 0,
      senderName: '${userViewModel.user!.firstName} ${userViewModel.user!.lastName}',
      senderEmail: userViewModel.user!.email,
      senderPhoneNumber: userViewModel.user!.whatsappNumber,
      senderAddress: userViewModel.user!.address.name,
      senderBank: selectedPaymentMethod?['bank_code'] ?? '',
      senderBankType: selectedPaymentMethod?['account_type'] ?? '',
    );

    navigator.pop();

    if (errRes == null) {
      navigator.pushNamedAndRemoveUntil(
        WebView.routeName,
        (route) => false,
      );
    } else {
      AppDialog.showErrorDialog(navigator, message: errRes);
    }
  }
}
