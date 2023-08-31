import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/gql_order_service.dart';
import 'package:satujuta_gql_client/operations/generated/bank_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/generated/order_find_one.graphql.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/utility/console_log.dart';

class CheckoutViewModel extends ChangeNotifier {
  Query$OrderFindOne$orderFindOne? order;

  // TODO METHOD PAYMENT
  Query$BankFindMany$bankFindMany? selectedPaymentMethod;

  void resetState() {
    order = null;
  }

  Future<void> getOrder(int orderId) async {
    var res = await GqlOrderService.orderFindOne(orderId: orderId);

    if (res.parsedData?.orderFindOne != null && !res.hasException) {
      order = res.parsedData!.orderFindOne;
      notifyListeners();

      cl(order?.toJson());
    } else {
      cl('[getOrder].error = ${gqlErrorParser(res)}');
      return;
    }
  }

  void onSelectPaymentMethod(Query$BankFindMany$bankFindMany method) {
    selectedPaymentMethod = method;
    notifyListeners();
  }
}
