import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/account_update_one.graphql.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/user_update_one.graphql.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';
import 'package:satujuta_gql_client/services/mobile/gql_account_service.dart';
import 'package:satujuta_gql_client/services/mobile/gql_user_service.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/service/locator/service_locator.dart';
import '../app/utility/console_log.dart';
import '../app/utility/validator.dart';
import '../widget/atom/app_dialog.dart';
import '../widget/atom/app_snackbar.dart';
import 'address_view_model.dart';
import 'user_view_model.dart';

class EditProfileViewModel extends ChangeNotifier {
  final userViewModel = locator<UserViewModel>();
  final addressViewModel = locator<AddressViewModel>();

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

    avatarUrl = userViewModel.user!.avatarUrl;

    firstNameCtrl.text = userViewModel.user!.firstName;
    lastNameCtrl.text = userViewModel.user!.lastName ?? '';
    addressNameCtrl.text = userViewModel.user!.address.subdistrict.name;
    provinceCtrl.text = userViewModel.user!.address.subdistrict.district.city.province.name;
    cityCtrl.text = userViewModel.user!.address.subdistrict.district.city.name;
    districtCtrl.text = userViewModel.user!.address.subdistrict.district.name;
    subdistrictCtrl.text = userViewModel.user!.address.subdistrict.name;
    postalCodeCtrl.text = userViewModel.user!.address.subdistrict.postalCode;

    provinceId = userViewModel.user!.address.subdistrict.district.city.province.id;
    cityId = userViewModel.user!.address.subdistrict.district.city.id;
    districtId = userViewModel.user!.address.subdistrict.district.id;
    subdistrictId = userViewModel.user!.address.subdistrict.id;

    whatsappNumberCtrl.text = userViewModel.user!.whatsappNumber;
    emailCtrl.text = userViewModel.user!.email;
    // password.text =  userViewModel.user!.password;
    // confirmPassword.text =  userViewModel.user!.firstName;

    referralCodeCtrl.text = userViewModel.user!.referralCode;

    var account =
        userViewModel.user!.accounts?.where((e) => e.accountCategory == Enum$AccountCategory.BANK).firstOrNull;
    if (account != null) {
      bankNameCtrl.text = account.name;
      bankAccountNumberCtrl.text = "${(account.accountNumber ?? 0).toInt()}";
      accountId = account.id;
    }
  }

  void onTapUpdateProfile(NavigatorState navigator) async {
    bool isValid = updateProfileValidator(navigator);

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
    if (userViewModel.user == null) {
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
    if (newPasswordCtrl.text.isNotEmpty &&
        newPasswordCtrl.text.length > 5 &&
        Validator.isContainsUppercase(newPasswordCtrl.text) &&
        Validator.isContainsNumber(newPasswordCtrl.text) &&
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
      id: userViewModel.user!.id,
      firstName: firstNameCtrl.text,
      lastName: lastNameCtrl.text,
      email: emailCtrl.text,
      userRole: userViewModel.user!.userRole,
      userType: userViewModel.user!.userType,
      avatarUrl: avatarUrl,
      whatsappNumber: whatsappNumberCtrl.text,
      status: userViewModel.user!.status,
      theme: userViewModel.user!.theme,
      address: address,
      referralCode: userViewModel.user!.referralCode,
      // createdAt:  userViewModel.user!.createdAt,
      updatedAt: DateTime.now().toIso8601String(),
    );

    var res = await GqlUserService.userUpdateOne(user: updateUser);

    cl('[updateProfile].res = $res');

    if (res.parsedData?.userUpdateOne != null && !res.hasException) {
      cl('[updateProfile].user = ${res.parsedData!.userUpdateOne?.toJson()}');
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
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );

    var res = await GqlAccountService.accountUpdateOne(updateAccount);

    cl('[updateUserAccount].res = $res');

    if (res.parsedData?.accountUpdateOne != null && !res.hasException) {
      cl('[updateUserAccount].user = ${res.parsedData!.accountUpdateOne?.toJson()}');
      return null;
    } else {
      return gqlErrorParser(res);
    }
  }

  Future<String?> updateUserPassword(NavigatorState navigator) async {
    var userId = userViewModel.user!.id;
    var currentPassword = passwordCtrl.text;
    var newPassword = newPasswordCtrl.text;

    var res = await GqlUserService.passwordUpdateFromUserUpdatedOne(
      userId: userId,
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    cl('[updateUserPassword].res = $res');

    if (res.parsedData?.userUpdateOne != null && !res.hasException) {
      cl('[updateUserPassword].user = ${res.parsedData?.userUpdateOne?.toJson()}');
      return null;
    } else {
      return gqlErrorParser(res);
    }
  }

  // TODO API NOT AVAILABLE
  Future<void> uploadUserAvatar(
    String avatar,
    NavigatorState navigator,
  ) async {
    // AppDialog.showDialogProgress(navigator);

    // final imageFile = File(avatar);
    // final imageBytes = await imageFile.readAsBytes();

    // var multipartFile = await MultipartFile.fromPath(
    //   'file',
    //   imageFile.path,
    //   filename: '${DateTime.now().second}.jpg',
    //   contentType: MediaType("image", "jpg"),
    // );

    // var res = await GqlUserService.userUpdateOneAvatarUrlAvatarUrl(
    //   userId: userViewModel.user!.id,
    //   multipartFile: multipartFile,
    // );

    // if (res.parsedData?.userUpdateOneAvatarUrl != null && !res.hasException) {
    //   navigator.pop();

    //   avatarUrl = res.parsedData!.userUpdateOneAvatarUrl;
    //   notifyListeners();

    //   AppSnackbar.show(navigator, title: "Foto profil berhasil diupload");
    // } else {
    //   navigator.pop();

    //   AppSnackbar.show(
    //     navigator,
    //     title: "Foto profil gagal diupload ${res.exception?.graphqlErrors.firstOrNull?.extensions?['code']}",
    //   );

    //   cl('[uploadUserAvatar].error = ${gqlErrorParser(res)}');
    // }

    // Refresh user data
    // userViewModel.getUser();
  }
}
