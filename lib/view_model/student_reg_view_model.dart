import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/view_model/user_view_model.dart';
import 'package:satujuta_app_mobile/widget/atom/app_snackbar.dart';
import 'package:satujuta_gql_client/gql_error_parser.dart';
import 'package:satujuta_gql_client/gql_user_service.dart';
import 'package:satujuta_gql_client/operations/generated/user_update_one.graphql.dart';

import '../app/service/locator/service_locator.dart';
import '../app/utility/console_log.dart';
import 'address_view_model.dart';

class StudentRegViewModel extends ChangeNotifier {
  final userViewModel = locator<UserViewModel>();
  final addressViewModel = locator<AddressViewModel>();

  Mutation$UserUpdateOne$userUpdateOne? user;

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

  void initEditProfileView() async {
    firstNameCtrl.text = user!.firstName;
    lastNameCtrl.text = user!.lastName ?? '';
    addressNameCtrl.text = user!.address.name;
    provinceCtrl.text = user!.address.province.name;
    cityCtrl.text = user!.address.city.name;
    districtCtrl.text = user!.address.district.name;
    subdistrictCtrl.text = user!.address.subdistrict.name;
    postalCodeCtrl.text = user!.address.subdistrict.postalCode;

    provinceId = user!.address.province.id;
    cityId = user!.address.city.id;
    districtId = user!.address.district.id;
    subdistrictId = user!.address.subdistrict.id;

    whatsappNumberCtrl.text = user!.whatsappNumber;
    emailCtrl.text = user!.email;
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

    return true;
  }

  Future<String?> updateUserProfile(NavigatorState navigator) async {
    var address = Mutation$UserUpdateOne$userUpdateOne$address(
      id: 0,
      name: addressNameCtrl.text,
      province: Mutation$UserUpdateOne$userUpdateOne$address$province(
        id: provinceId!,
        name: provinceCtrl.text,
      ),
      city: Mutation$UserUpdateOne$userUpdateOne$address$city(
        id: cityId!,
        name: cityCtrl.text,
      ),
      district: Mutation$UserUpdateOne$userUpdateOne$address$district(
        id: districtId!,
        name: districtCtrl.text,
      ),
      subdistrict: Mutation$UserUpdateOne$userUpdateOne$address$subdistrict(
        id: subdistrictId!,
        name: subdistrictCtrl.text,
        postalCode: postalCodeCtrl.text,
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
}
