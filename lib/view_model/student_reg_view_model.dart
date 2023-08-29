import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/view_model/user_view_model.dart';
import 'package:satujuta_app_mobile/widget/atom/app_snackbar.dart';
import 'package:satujuta_gql_client/gql_error_parser.dart';
import 'package:satujuta_gql_client/gql_user_service.dart';
import 'package:satujuta_gql_client/operations/generated/hotel_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/generated/school_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/generated/user_create_one.graphql.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';

import '../app/service/locator/service_locator.dart';
import '../app/utility/console_log.dart';
import '../view/student/component/student_reg_status.dart';
import '../widget/atom/app_dialog.dart';
import 'address_view_model.dart';

class StudentRegViewModel extends ChangeNotifier {
  final userViewModel = locator<UserViewModel>();
  final addressViewModel = locator<AddressViewModel>();

  Mutation$UserCreate$userCreateOne? student;

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

  Query$SchoolFindMany$schoolFindMany? selectedSchool;
  Query$HotelFindMany$hotelFindMany? selectedHotel;
  TextEditingController schoolNameCtrl = TextEditingController();
  TextEditingController hotelNameCtrl = TextEditingController();

  void initEditProfileView() async {
    // firstNameCtrl.text = user!.firstName;
    // lastNameCtrl.text = user!.lastName ?? '';
    // addressNameCtrl.text = user!.address.subdistrict.name;
    // provinceCtrl.text = user!.address.subdistrict.district.city.province.name;
    // cityCtrl.text = user!.address.subdistrict.district.city.name;
    // districtCtrl.text = user!.address.subdistrict.district.name;
    // subdistrictCtrl.text = user!.address.subdistrict.name;
    // postalCodeCtrl.text = user!.address.subdistrict.postalCode;

    // provinceId = user!.address.subdistrict.district.city.province.id;
    // cityId = user!.address.subdistrict.district.city.id;
    // districtId = user!.address.subdistrict.district.id;
    // subdistrictId = user!.address.subdistrict.id;

    // whatsappNumberCtrl.text = user!.whatsappNumber;
    // emailCtrl.text = user!.email;
  }

  void onTapRegisterStudent(NavigatorState navigator) async {
    bool isValid = regStudentValidator(navigator);

    if (isValid) {
      AppDialog.showDialogProgress(navigator);

      var errRes = await registerStudent(navigator);

      if (errRes == null) {
        navigator.pop();
        navigator.pushReplacementNamed(StudentRegStatus.routeName);
      } else {
        cl('[onTapRegisterStudent].resProfile.error = $errRes');
        navigator.pop();
        AppDialog.showErrorDialog(
          navigator,
          error: "errRes: $errRes",
        );
      }
    }
  }

  bool regStudentValidator(NavigatorState navigator) {
    if (firstNameCtrl.text.isEmpty) {
      cl('[regStudentValidator].firstName empty');
      AppSnackbar.show(navigator, title: 'Mohon masukkan nama depan anda!');
      return false;
    }

    if (addressNameCtrl.text.isEmpty ||
        provinceId == null ||
        cityId == null ||
        districtId == null ||
        subdistrictId == null) {
      cl('[regStudentValidator].adress null');
      AppSnackbar.show(navigator, title: 'Mohon lengkapi alamat siswa!');
      return false;
    }

    return true;
  }

  Future<String?> registerStudent(NavigatorState navigator) async {
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

    cl('[registerStudent].address = ${address.toJson()}');

    var studentData = Mutation$UserCreate$userCreateOne(
      id: "",
      firstName: firstNameCtrl.text,
      lastName: lastNameCtrl.text,
      email: emailCtrl.text,
      userRole: Enum$UserRole.STUDENT,
      userType: Enum$UserType.STUDENT,
      whatsappNumber: whatsappNumberCtrl.text,
      status: Enum$UserStatus.ACTIVE,
      theme: Enum$Theme.LIGHT,
      address: address,
      referralCode: userViewModel.user!.referralCode,
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );

    var res = await GqlUserService.userCreateOne(studentData);

    cl('[registerStudent].res = $res');

    if (res.parsedData?.userCreateOne != null && !res.hasException) {
      student = res.parsedData!.userCreateOne;
      notifyListeners();

      cl('[registerStudent].student = ${student?.toJson()}');
      return null;
    } else {
      return gqlErrorParser(res);
    }
  }
}
