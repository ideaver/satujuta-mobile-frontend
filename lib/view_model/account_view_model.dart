import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:satujuta_gql_client/gql_account_service.dart';
import 'package:satujuta_gql_client/operations/generated/bank_find_many.graphql.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/service/locator/service_locator.dart';
import '../app/service/network_checker/network_checker_service.dart';
import '../app/utility/console_log.dart';
import '../widget/atom/app_dialog.dart';
import 'user_view_model.dart';

class AccountViewModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  final network = locator<NetworkCheckerService>();
  final userViewModel = locator<UserViewModel>();

  List<Query$BankFindMany$bankFindMany>? bankFindMany;

  Query$BankFindMany$bankFindMany? selectedBank;

  void resetState() {
    bankFindMany = null;
    selectedBank = null;
  }

  Future<void> getSupportedBanks(NavigatorState navigator) async {
    var res = await GqlAccountService.bankFindMany();

    if (res.parsedData?.bankFindMany != null && !res.hasException) {
      bankFindMany = res.parsedData!.bankFindMany;
      notifyListeners();
    } else {
      cl('[getSupportedBanks].error = ${gqlErrorParser(res)}');
      AppDialog.showFailedDialog(
        navigator,
        error: gqlErrorParser(res),
      );
    }

    cl('[getSupportedBanks].bankFindMany.length = ${bankFindMany?.length}');
  }

  void onSelectBank(Query$BankFindMany$bankFindMany bank) {
    selectedBank = bank;
    notifyListeners();

    cl('[onSelectBank].bank =  ${bank.id}: ${bank.name}');
  }
}
