import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/view_model/user_view_model.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/bank_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/order_find_first_by_user_id.graphql.dart';
import 'package:satujuta_gql_client/services/mobile/gql_order_service.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/service/locator/service_locator.dart';
import '../app/service/storage/local_storage_service.dart';
import '../app/utility/console_log.dart';

class CheckoutViewModel extends ChangeNotifier {
  final userViewModel = locator<UserViewModel>();

  Query$OrderFindFirstByUserId$orderFindFirst? latestOrder;
  // Query$OrderFindOne$orderFindOne? order;

  // TODO METHOD PAYMENT
  Query$BankFindMany$bankFindMany? selectedPaymentMethod;

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

  void onSelectPaymentMethod(Query$BankFindMany$bankFindMany method) {
    selectedPaymentMethod = method;
    notifyListeners();
  }
}
