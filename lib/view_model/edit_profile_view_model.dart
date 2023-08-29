import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/view_model/user_view_model.dart';
import 'package:satujuta_app_mobile/widget/atom/app_dialog.dart';
import 'package:satujuta_app_mobile/widget/atom/app_snackbar.dart';
import 'package:satujuta_gql_client/gql_account_service.dart';
import 'package:satujuta_gql_client/gql_error_parser.dart';
import 'package:satujuta_gql_client/gql_user_service.dart';
import 'package:satujuta_gql_client/operations/generated/account_update_one.graphql.dart';
import 'package:satujuta_gql_client/operations/generated/user_update_one.graphql.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';

import '../app/service/locator/service_locator.dart';
import '../app/utility/console_log.dart';
import 'address_view_model.dart';

class EditProfileViewModel extends ChangeNotifier {
  final userViewModel = locator<UserViewModel>();
  final addressViewModel = locator<AddressViewModel>();

  Mutation$UserUpdateOne$userUpdateOne? user;

  String? avatarUrl;

  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController addressNameCtrl = TextEditingController();
  TextEditingController provinceCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController districtCtrl = TextEditingController();
  TextEditingController subdistrictCtrl = TextEditingController();
  TextEditingController postalCodeCtrl = TextEditingController();

  int? provinceId;
  int? cityId;
  int? districtId;
  int? subdistrictId;

  TextEditingController whatsappNumberCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController newPasswordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();

  TextEditingController referralCodeCtrl = TextEditingController();
  TextEditingController bankNameCtrl = TextEditingController();
  TextEditingController bankAccountNumberCtrl = TextEditingController();

  int? accountId;

  void initEditProfileView() async {
    if (userViewModel.user == null) {
      cl('[initEditProfileView].userViewModel.user null');
      return;
    }

    user = Mutation$UserUpdateOne$userUpdateOne.fromJson(
      userViewModel.user!.toJson(),
    );

    avatarUrl = user!.avatarUrl;

    firstNameCtrl.text = user!.firstName;
    lastNameCtrl.text = user!.lastName ?? '';
    addressNameCtrl.text = user!.address.subdistrict.name;
    provinceCtrl.text = user!.address.subdistrict.district.city.province.name;
    cityCtrl.text = user!.address.subdistrict.district.city.name;
    districtCtrl.text = user!.address.subdistrict.district.name;
    subdistrictCtrl.text = user!.address.subdistrict.name;
    postalCodeCtrl.text = user!.address.subdistrict.postalCode;

    provinceId = user!.address.subdistrict.district.city.province.id;
    cityId = user!.address.subdistrict.district.city.id;
    districtId = user!.address.subdistrict.district.id;
    subdistrictId = user!.address.subdistrict.id;

    whatsappNumberCtrl.text = user!.whatsappNumber;
    emailCtrl.text = user!.email;
    // password.text = user!.password;
    // confirmPassword.text = user!.firstName;

    referralCodeCtrl.text = user!.referralCode;

    var account = user!.accounts?.where((e) => e.accountCategory == Enum$AccountCategory.BANK).firstOrNull;
    if (account != null) {
      bankNameCtrl.text = account.name;
      bankAccountNumberCtrl.text = "${(account.accountNumber ?? 0).toInt()}";
      accountId = account.id;
    }
  }

  void onTapUpdateProfile(NavigatorState navigator) async {
    bool isValid = await updateProfileValidator(navigator);

    if (isValid) {
      AppDialog.showDialogProgress(navigator);

      var errResProfile = await updateUserProfile(navigator);
      var errResAccount = await updateUserAccount(navigator);

      if (errResProfile == null && errResAccount == null) {
        navigator.pop();
        AppDialog.showSuccessDialog(
          navigator,
          title: 'Sukses!',
          subtitle: 'Profil berhasil diperbarui',
        );
      } else {
        cl('[updateProfile].resProfile.error = $errResProfile');
        cl('[updateProfile].resAccount.error = $errResAccount');
        navigator.pop();
        AppDialog.showFailedDialog(
          navigator,
          error: "errResProfile: ${errResProfile != null}, errResAccount: ${errResAccount != null}",
        );
      }

      // Refresh user data
      userViewModel.getUser();
    }
  }

  void onTapUpdatePassword(NavigatorState navigator) async {
    bool isValid = updatePasswordValidator();

    if (isValid) {
      AppDialog.showDialogProgress(navigator);

      var errRes = await updateUserPassword(navigator);

      if (errRes == null) {
        navigator.pop();
        AppDialog.showSuccessDialog(
          navigator,
          title: 'Sukses!',
          subtitle: 'Profil berhasil diperbarui',
        );
      } else {
        cl('[onTapUpdatePassword].resProfile.error = $errRes');
        navigator.pop();
        AppDialog.showErrorDialog(
          navigator,
          error: "errRes: $errRes",
        );
      }

      // Refresh user data
      userViewModel.getUser();
    }
  }

  bool updateProfileValidator(NavigatorState navigator) {
    if (user == null) {
      cl('[updateProfile].user null');
      return false;
    }

    if (firstNameCtrl.text.isEmpty) {
      cl('[updateProfile].firstName empty');
      AppSnackbar.show(navigator, title: 'Mohon masukkan nama depan anda!');
      return false;
    }

    if (addressNameCtrl.text.isEmpty ||
        provinceId == null ||
        cityId == null ||
        districtId == null ||
        subdistrictId == null) {
      cl('[updateProfile].adress null');
      AppSnackbar.show(navigator, title: 'Mohon lengkapi alamat anda!');
      return false;
    }

    if (bankNameCtrl.text.isEmpty || bankAccountNumberCtrl.text.isEmpty || accountId == null) {
      cl('[updateProfile].bank null');
      AppSnackbar.show(navigator, title: 'Mohon lengkapi informasi rekening anda!');
      return false;
    }

    return true;
  }

  bool updatePasswordValidator() {
    if (newPasswordCtrl.text.contains(RegExp(r'[A-Z]')) &&
        newPasswordCtrl.text.length > 5 &&
        newPasswordCtrl.text.contains(RegExp(r'[0-9]')) &&
        newPasswordCtrl.text.isNotEmpty &&
        newPasswordCtrl.text == confirmPasswordCtrl.text) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> updateUserProfile(NavigatorState navigator) async {
    var address = Mutation$UserUpdateOne$userUpdateOne$address(
      id: 0,
      name: addressNameCtrl.text,
      subdistrict: Mutation$UserUpdateOne$userUpdateOne$address$subdistrict(
        id: subdistrictId!,
        name: subdistrictCtrl.text,
        postalCode: postalCodeCtrl.text,
        district: Mutation$UserUpdateOne$userUpdateOne$address$subdistrict$district(
          id: districtId!,
          name: districtCtrl.text,
          city: Mutation$UserUpdateOne$userUpdateOne$address$subdistrict$district$city(
            id: cityId!,
            name: cityCtrl.text,
            province: Mutation$UserUpdateOne$userUpdateOne$address$subdistrict$district$city$province(
              id: provinceId!,
              name: provinceCtrl.text,
            ),
          ),
        ),
      ),
    );

    cl('[updateUserProfile].address = ${address.toJson()}');

    var updateUser = Mutation$UserUpdateOne$userUpdateOne(
      id: user!.id,
      firstName: firstNameCtrl.text,
      lastName: lastNameCtrl.text,
      email: emailCtrl.text,
      userRole: user!.userRole,
      userType: user!.userType,
      avatarUrl: avatarUrl,
      whatsappNumber: whatsappNumberCtrl.text,
      status: user!.status,
      theme: user!.theme,
      address: address,
      referralCode: user!.referralCode,
      createdAt: user!.createdAt,
      updatedAt: DateTime.now().toIso8601String(),
    );

    var res = await GqlUserService.userUpdateOne(updateUser);

    cl('[updateProfile].res = $res');

    if (res.parsedData?.userUpdateOne != null && !res.hasException) {
      user = res.parsedData!.userUpdateOne;
      notifyListeners();

      cl('[updateProfile].user = ${user?.toJson()}');
      return null;
    } else {
      return gqlErrorParser(res);
    }
  }

  Future<String?> updateUserAccount(NavigatorState navigator) async {
    var updateAccount = Mutation$AccountUpdateOne$accountUpdateOne(
      id: accountId!,
      name: bankNameCtrl.text,
      accountNumber: double.tryParse(bankAccountNumberCtrl.text),
      accountCategory: Enum$AccountCategory.BANK,
      updatedAt: DateTime.now().toIso8601String(),
    );

    var res = await GqlAccountService.accountUpdateOne(updateAccount);

    cl('[updateUserAccount].res = $res');

    if (res.parsedData?.accountUpdateOne != null && !res.hasException) {
      cl('[updateUserAccount].user = ${user?.toJson()}');
      return null;
    } else {
      return gqlErrorParser(res);
    }
  }

  Future<String?> updateUserPassword(NavigatorState navigator) async {
    var userId = user!.id;
    var currentPassword = passwordCtrl.text;
    var newPassword = newPasswordCtrl.text;

    var res = await GqlUserService.passwordUpdateFromUserUpdatedOne(
      userId,
      currentPassword,
      newPassword,
    );

    cl('[updateUserPassword].res = $res');

    if (res.parsedData?.userUpdateOne != null && !res.hasException) {
      cl('[updateUserPassword].user = ${user?.toJson()}');
      return null;
    } else {
      return gqlErrorParser(res);
    }
  }
}
