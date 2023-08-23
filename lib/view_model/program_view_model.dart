import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:satujuta_app_mobile/view_model/user_view_model.dart';
import 'package:satujuta_gql_client/gql_program_service.dart';
import 'package:satujuta_gql_client/operations/generated/user_update_one.graphql.dart';

import '../app/service/locator/service_locator.dart';
import '../app/service/network_checker/network_checker_service.dart';
import '../app/utility/console_log.dart';

class ProgramViewModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  final network = locator<NetworkCheckerService>();
  final userViewModel = locator<UserViewModel>();

  Mutation$UserUpdateOne$userUpdateOne? user;


  Future<void> getProvinces({int skip = 0}) async {
    var res = await GqlProgramService.programFindMany(
      skip: skip,
    );

    cl('[getProvinces].res = $res');

    // if (res.parsedData?.userUpdateOne != null && !res.hasException) {
    //   await userViewModel.getUser();
    //   user = res.parsedData!.userUpdateOne;
    //   notifyListeners();

    //   navigator.pop();
    //   AppDialog.showSuccessDialog(
    //     navigator,
    //     title: 'Sukses!',
    //     subtitle: 'Profil berhasil diperbarui',
    //   );
    // } else {
    //   cl('[updateProfile].error = ${gqlErrorParser(res)}');
    //   navigator.pop();
    //   AppDialog.showFailedDialog(
    //     navigator,
    //     error: gqlErrorParser(res),
    //   );
    //   return;
    // }

    // cl(user?.toJson());
  }
}
