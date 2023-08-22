import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:satujuta_app_mobile/app/service/graphql/gql_error_parser.dart';
import 'package:satujuta_app_mobile/app/service/graphql/gql_user_service.dart';
import 'package:satujuta_app_mobile/view_model/user_view_model.dart';
import 'package:satujuta_app_mobile/widget/atom/app_dialog.dart';

import '../app/service/graphql/query/generated/user_update_one.graphql.dart';
import '../app/service/locator/service_locator.dart';
import '../app/service/network_checker/network_checker_service.dart';
import '../app/utility/console_log.dart';

class EditProfileViewModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  final network = locator<NetworkCheckerService>();
  final userViewModel = locator<UserViewModel>();

  Mutation$UserUpdateOne$userUpdateOne? user;

  String? avatarUrl;

  String? city; // TODO
  String? district; // TODO

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController addressName = TextEditingController();

  TextEditingController postalCode = TextEditingController();

  TextEditingController whatsappNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  TextEditingController referralCode = TextEditingController();
  TextEditingController bank = TextEditingController();
  TextEditingController bankAccountNumber = TextEditingController();

  void initEditProfileView() async {
    if (userViewModel.user == null) {
      cl('[initEditProfileView].userViewModel.user null');
      return;
    }

    user = Mutation$UserUpdateOne$userUpdateOne.fromJson(
      userViewModel.user!.toJson(),
    );

    avatarUrl = user!.avatarUrl;

    firstName.text = user!.firstName;
    lastName.text = user!.lastName ?? '';
    // addressName.text = user!.address.name ?? '';
    city; // TODO
    district; // TODO
    // postalCode.text = user!.postalCode ?? '';

    whatsappNumber.text = user!.whatsappNumber;
    email.text = user!.email;
    // password.text = user!.password;
    // confirmPassword.text = user!.firstName;

    referralCode.text = user!.referralCode;
    // bank.text = user!.bank;
    // bankAccountNumber.text = user!.bankAccountNumber;
  }

  Future<void> updateProfile(NavigatorState navigator) async {
    if (user == null) {
      return;
    }

    AppDialog.showDialogProgress(navigator);

    var updatedData = Mutation$UserUpdateOne$userUpdateOne(
      id: user!.id,
      firstName: firstName.text,
      lastName: lastName.text,
      email: email.text,
      userRole: user!.userRole,
      userType: user!.userType,
      avatarUrl: avatarUrl,
      whatsappNumber: whatsappNumber.text,
      referralCode: referralCode.text,
      status: user!.status,
      // schoolId: schoolId,
      createdAt: user!.createdAt,
      updatedAt: DateTime.now().toIso8601String(),
      theme: user!.theme,
    );

    var res = await GqlUserService.updateUser(updatedData);

    cl('[updateProfile].res = $res');

    if (res.parsedData?.userUpdateOne != null && !res.hasException) {
      await userViewModel.getUser();
      user = res.parsedData!.userUpdateOne;
      notifyListeners();

      navigator.pop();
      AppDialog.showSuccessDialog(
        navigator,
        title: 'Sukses!',
        subtitle: 'Profil berhasil diperbarui',
      );
    } else {
      cl('[updateProfile].error = ${gqlErrorParser(res)}');
      navigator.pop();
      AppDialog.showFailedDialog(
        navigator,
        error: gqlErrorParser(res),
      );
      return;
    }

    cl(user?.toJson());
  }
}
