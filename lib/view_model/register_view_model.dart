import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/service/auth/auth_service.dart';
import 'package:satujuta_app_mobile/view/checkout/checkout_view.dart';
import 'package:satujuta_app_mobile/view/hotel_picker/hotel_picker_view.dart';
import 'package:satujuta_app_mobile/widget/atom/app_dialog.dart';
import 'package:satujuta_app_mobile/widget/atom/app_snackbar.dart';
import 'package:satujuta_gql_client/gql_user_service.dart';
import 'package:satujuta_gql_client/operations/generated/hotel_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/generated/school_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/generated/user_create_one.graphql.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/service/locator/service_locator.dart';
import '../app/utility/console_log.dart';
import '../app/utility/validator.dart';
import 'address_view_model.dart';

class RegisterViewModel extends ChangeNotifier {
  final addressViewModel = locator<AddressViewModel>();

  late TabController tabController;

  Mutation$UserCreate$userCreateOne? createdUser;

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
  TextEditingController confirmPasswordCtrl = TextEditingController();

  TextEditingController referralCodeCtrl = TextEditingController();
  TextEditingController bankNameCtrl = TextEditingController();
  TextEditingController bankAccountNumberCtrl = TextEditingController();

  Query$SchoolFindMany$schoolFindMany? selectedSchool;
  Query$HotelFindMany$hotelFindMany? selectedHotel;
  TextEditingController schoolNameCtrl = TextEditingController();
  TextEditingController hotelNameCtrl = TextEditingController();

  // Enum$UserRole? selectedUserRole;
  // TextEditingController userRoleNameCtrl = TextEditingController();

  Enum$UserType? selectedUserType;
  TextEditingController userTypeNameCtrl = TextEditingController();

  int? accountId;

  void onTapRegisterUser(NavigatorState navigator) async {
    bool isValid = regUserValidator(navigator);

    if (isValid) {
      AppDialog.showDialogProgress(navigator);

      var errRes = await registerUser(navigator);

      if (errRes == null) {
        var loginErrRes = await AuthService.login(email: emailCtrl.text, password: passwordCtrl.text);

        if (loginErrRes == null) {
          navigator.pop();
          selectHotel(navigator);
        } else {
          cl('[onTapRegisterUser].login.errRes = $loginErrRes');
          navigator.pop();
          AppDialog.showErrorDialog(
            navigator,
            message: errRes,
          );
        }
      } else {
        cl('[onTapRegisterUser].errRes = $errRes');
        navigator.pop();
        AppDialog.showErrorDialog(
          navigator,
          message: errRes,
        );
      }
    }
  }

  bool regUserValidator(NavigatorState navigator) {
    if (!isBiodataFormValid() && !isAccountFormValid() && !isCommissionFormValid()) {
      cl('[regUserValidator].firstName empty');
      AppSnackbar.show(navigator, title: 'Mohon lengkapi formulir!');
      return false;
    }

    return true;
  }

  Future<String?> registerUser(NavigatorState navigator) async {
    var address = Mutation$UserCreate$userCreateOne$address(
      id: 0,
      name: addressNameCtrl.text,
      subdistrict: Mutation$UserCreate$userCreateOne$address$subdistrict(
        id: subdistrictId!,
        name: subdistrictCtrl.text,
        postalCode: postalCodeCtrl.text,
        district: Mutation$UserCreate$userCreateOne$address$subdistrict$district(
          id: districtId!,
          name: districtCtrl.text,
          city: Mutation$UserCreate$userCreateOne$address$subdistrict$district$city(
            id: cityId!,
            name: cityCtrl.text,
            province: Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province(
              id: provinceId!,
              name: provinceCtrl.text,
            ),
          ),
        ),
      ),
    );

    cl('[registerUser].address = ${address.toJson()}');

    var referredBy = Mutation$UserCreate$userCreateOne$referredBy(
      id: "",
      firstName: "",
      lastName: "",
      referralCode: referralCodeCtrl.text,
    );

    var school = Mutation$UserCreate$userCreateOne$school(
      id: selectedSchool!.id,
      name: selectedSchool!.name,
      address: Mutation$UserCreate$userCreateOne$school$address(
        name: selectedSchool!.address.name,
        subdistrictId: selectedSchool!.address.subdistrict.id,
      ),
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );

    var userData = Mutation$UserCreate$userCreateOne(
      id: "",
      firstName: firstNameCtrl.text,
      lastName: lastNameCtrl.text,
      email: emailCtrl.text,
      userRole: Enum$UserRole.MEMBER,
      userType: selectedUserType!,
      whatsappNumber: whatsappNumberCtrl.text,
      status: Enum$UserStatus.ACTIVE,
      theme: Enum$Theme.LIGHT,
      address: address,
      referralCode: "",
      referredBy: referredBy,
      school: school,
      accounts: [],
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );

    var res = await GqlUserService.userCreateOne(
      userData,
      passwordCtrl.text,
    );

    cl('[registerUser].res = $res');

    if (res.parsedData?.userCreateOne != null && !res.hasException) {
      createdUser = res.parsedData!.userCreateOne;
      cl('[registerUser].createdUser = ${res.parsedData?.userCreateOne?.toJson()}');
      return null;
    } else {
      cl('[registerUser].error = ${gqlErrorParser(res)}');
      return gqlErrorParser(res);
    }
  }

  Future<void> selectHotel(NavigatorState navigator) async {
    var hotel = await navigator.pushNamed(
      HotelPicker.userHotelRouteName,
    );

    if (hotel != null && hotel is Query$HotelFindMany$hotelFindMany) {
      // TODO GET ORDER & INVOICE DATA
      selectedHotel = hotel;
      hotelNameCtrl.text = selectedHotel!.name;
      notifyListeners();

      navigator.pushNamedAndRemoveUntil(
        CheckoutView.routeName,
        arguments: createdUser?.orders?.first.id,
        (route) => false,
      );
    } else {
      cl('[selectHotel].hotel null');
    }
  }

  bool isBiodataFormValid() {
    if (firstNameCtrl.text.isNotEmpty &&
        subdistrictId != null &&
        selectedSchool != null &&
        // selectedUserRole != null &&
        selectedUserType != null) {
      return true;
    } else {
      return false;
    }
  }

  bool isAccountFormValid() {
    if (Validator.isPasswordValid(passwordCtrl.text) &&
        passwordCtrl.text.isNotEmpty &&
        passwordCtrl.text == confirmPasswordCtrl.text) {
      return true;
    } else {
      return false;
    }
  }

  bool isCommissionFormValid() {
    if (bankNameCtrl.text.isNotEmpty && bankAccountNumberCtrl.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
