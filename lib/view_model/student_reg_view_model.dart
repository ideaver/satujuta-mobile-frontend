import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/hotel_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/school_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/user_create_one.graphql.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/user_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/user_update_one.graphql.dart';
import 'package:satujuta_gql_client/schema/generated/schema.graphql.dart';
import 'package:satujuta_gql_client/services/mobile/gql_user_service.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/service/locator/service_locator.dart';
import '../app/utility/console_log.dart';
import '../app/utility/validator.dart';
import '../view/student/component/student_reg_status.dart';
import '../view/student/student_registration_view.dart';
import '../widget/atom/app_dialog.dart';
import '../widget/atom/app_snackbar.dart';
import 'user_view_model.dart';

class StudentRegViewModel extends ChangeNotifier {
  final userViewModel = locator<UserViewModel>();

  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController addressNameCtrl = TextEditingController();
  TextEditingController provinceCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController districtCtrl = TextEditingController();
  TextEditingController subdistrictCtrl = TextEditingController();
  TextEditingController postalCodeCtrl = TextEditingController();

  String? studentId;

  int? addressId;
  int? provinceId;
  int? cityId;
  int? districtId;
  int? subdistrictId;

  TextEditingController whatsappNumberCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

  Query$SchoolFindManyByName$schoolFindMany? selectedSchool;
  Query$HotelFindMany$hotelFindMany? selectedHotel;
  TextEditingController schoolNameCtrl = TextEditingController();
  TextEditingController hotelNameCtrl = TextEditingController();
  // TextEditingController passwordCtrl = TextEditingController();

  Mutation$UserCreateOne$userCreateOne? createdUser;

  void clearState() {
    studentId = null;

    firstNameCtrl.clear();
    lastNameCtrl.clear();
    addressNameCtrl.clear();
    provinceCtrl.clear();
    cityCtrl.clear();
    districtCtrl.clear();
    subdistrictCtrl.clear();
    postalCodeCtrl.clear();

    addressId = null;
    provinceId = null;
    cityId = null;
    districtId = null;
    subdistrictId = null;

    whatsappNumberCtrl.clear();
    emailCtrl.clear();

    selectedSchool = null;
    schoolNameCtrl.clear();
    selectedHotel = null;
    hotelNameCtrl.clear();
    // passwordCtrl.clear();
  }

  void initEditProfileView({Query$UserFindMany$userFindMany? currStudent}) async {
    if (currStudent != null) {
      firstNameCtrl.text = currStudent.firstName;
      lastNameCtrl.text = currStudent.lastName ?? '';
      addressNameCtrl.text = currStudent.address.subdistrict.name;
      provinceCtrl.text = currStudent.address.subdistrict.district.city.province.name;
      cityCtrl.text = currStudent.address.subdistrict.district.city.name;
      districtCtrl.text = currStudent.address.subdistrict.district.name;
      subdistrictCtrl.text = currStudent.address.subdistrict.name;
      postalCodeCtrl.text = currStudent.address.subdistrict.postalCode;

      provinceId = currStudent.address.subdistrict.district.city.province.id;
      cityId = currStudent.address.subdistrict.district.city.id;
      districtId = currStudent.address.subdistrict.district.id;
      subdistrictId = currStudent.address.subdistrict.id;

      whatsappNumberCtrl.text = currStudent.whatsappNumber;
      emailCtrl.text = currStudent.email;

      selectedSchool = Query$SchoolFindManyByName$schoolFindMany.fromJson(currStudent.school!.toJson());
      schoolNameCtrl.text = currStudent.school!.name;
    } else {
      clearState();
    }
  }

  void onTapStudentFormButton({
    required NavigatorState navigator,
    required StudentRegViewState viewState,
  }) async {
    bool isValid = studentFormValidator(navigator);

    if (isValid) {
      AppDialog.showDialogProgress(navigator);

      String? errRes;

      if (viewState == StudentRegViewState.edit) {
        errRes = await updateStudent(navigator);
      } else {
        errRes = await registerStudent(navigator);
      }

      if (errRes == null) {
        userViewModel.getUser();
        navigator.pop();

        if (viewState == StudentRegViewState.add || viewState == StudentRegViewState.edit) {
          navigator.pop();
        }

        if (viewState == StudentRegViewState.create) {
          // TODO LIST createdUser
          navigator.pushReplacementNamed(
            StudentRegStatus.successRouteName,
            arguments: [createdUser!],
          );
        }
      } else {
        cl('[onTapStudentFormButton].resProfile.error = $errRes');
        navigator.pop();
        AppDialog.showErrorDialog(
          navigator,
          message: errRes,
        );
      }
    }
  }

  bool studentFormValidator(NavigatorState navigator) {
    if (firstNameCtrl.text.isEmpty) {
      cl('[studentFormValidator].firstName empty');
      AppSnackbar.show(navigator, title: 'Mohon masukkan nama depan anda!');
      return false;
    }

    if (addressNameCtrl.text.isEmpty ||
        provinceId == null ||
        cityId == null ||
        districtId == null ||
        subdistrictId == null) {
      cl('[studentFormValidator].adress null');
      AppSnackbar.show(navigator, title: 'Mohon lengkapi alamat siswa!');
      return false;
    }

    return true;
  }

  Future<String?> registerStudent(NavigatorState navigator) async {
    var address = Mutation$UserCreateOne$userCreateOne$address(
      id: 0,
      name: addressNameCtrl.text,
      subdistrict: Mutation$UserCreateOne$userCreateOne$address$subdistrict(
        id: subdistrictId!,
        name: subdistrictCtrl.text,
        postalCode: postalCodeCtrl.text,
        district: Mutation$UserCreateOne$userCreateOne$address$subdistrict$district(
          id: districtId!,
          name: districtCtrl.text,
          city: Mutation$UserCreateOne$userCreateOne$address$subdistrict$district$city(
            id: cityId!,
            name: cityCtrl.text,
            province: Mutation$UserCreateOne$userCreateOne$address$subdistrict$district$city$province(
              id: provinceId!,
              name: provinceCtrl.text,
            ),
          ),
        ),
      ),
    );

    cl('[registerStudent].address = ${address.toJson()}');

    var referredBy = Mutation$UserCreateOne$userCreateOne$referredBy(
      id: userViewModel.user!.id,
      firstName: userViewModel.user!.firstName,
      lastName: userViewModel.user!.lastName,
      referralCode: userViewModel.user!.referralCode,
    );

    var school = Mutation$UserCreateOne$userCreateOne$school(
      id: selectedSchool!.id,
      name: selectedSchool!.name,
      address: Mutation$UserCreateOne$userCreateOne$school$address(
        name: selectedSchool!.address.name,
        subdistrictId: selectedSchool!.address.subdistrict.id,
      ),
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );

    var studentData = Mutation$UserCreateOne$userCreateOne(
      id: "",
      firstName: firstNameCtrl.text,
      lastName: lastNameCtrl.text,
      email: emailCtrl.text,
      userRole: Enum$UserRole.STUDENT,
      userType: Enum$UserType.STUDENT,
      whatsappNumber: whatsappNumberCtrl.text,
      status: Enum$UserStatus.PENDING,
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
      user: studentData,
      userPassword: "",
    );

    cl('[registerStudent].res = $res');

    if (res.parsedData?.userCreateOne != null && !res.hasException) {
      createdUser = res.parsedData?.userCreateOne;
      cl('[registerStudent].student = ${res.parsedData!.userCreateOne?.toJson()}');
      return null;
    } else {
      cl('[registerStudent].error = ${gqlErrorParser(res)}');
      return gqlErrorParser(res);
    }
  }

  Future<String?> updateStudent(NavigatorState navigator) async {
    if (studentId == null) {
      return "Student id is null";
    }

    var address = Mutation$UserUpdateOne$userUpdateOne$address(
      id: addressId!,
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

    cl('[updateStudent].address = ${address.toJson()}');

    var referredBy = Mutation$UserUpdateOne$userUpdateOne$referredBy(
      id: userViewModel.user!.id,
      firstName: userViewModel.user!.firstName,
      lastName: userViewModel.user!.lastName,
      referralCode: userViewModel.user!.referralCode,
    );

    var school = Mutation$UserUpdateOne$userUpdateOne$school(
      id: selectedSchool!.id,
      name: selectedSchool!.name,
      address: Mutation$UserUpdateOne$userUpdateOne$school$address(
        id: selectedSchool!.address.id,
        name: selectedSchool!.address.name,
        subdistrictId: selectedSchool!.address.subdistrict.id,
      ),
      // createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );

    var studentData = Mutation$UserUpdateOne$userUpdateOne(
      id: studentId!,
      firstName: firstNameCtrl.text,
      lastName: lastNameCtrl.text,
      email: emailCtrl.text,
      userRole: Enum$UserRole.STUDENT,
      userType: Enum$UserType.STUDENT,
      whatsappNumber: whatsappNumberCtrl.text,
      status: Enum$UserStatus.PENDING,
      theme: Enum$Theme.LIGHT,
      address: address,
      referralCode: "",
      referredBy: referredBy,
      school: school,
      accounts: [],
      // createdAt: student!.createdAt,
      updatedAt: DateTime.now().toIso8601String(),
    );

    var res = await GqlUserService.userUpdateOne(
      user: studentData,
    );

    cl('[updateStudent].res = $res');

    if (res.parsedData?.userUpdateOne != null && !res.hasException) {
      cl('[updateStudent].student = ${res.parsedData!.userUpdateOne?.toJson()}');
      return null;
    } else {
      cl('[updateStudent].error = ${gqlErrorParser(res)}');
      return gqlErrorParser(res);
    }
  }

  bool studentButtonValidator() {
    if (firstNameCtrl.text.isNotEmpty &&
            addressNameCtrl.text.isNotEmpty &&
            provinceId != null &&
            cityId != null &&
            districtId != null &&
            subdistrictId != null &&
            whatsappNumberCtrl.text.isNotEmpty &&
            Validator.isPhoneNumberValid(whatsappNumberCtrl.text) &&
            emailCtrl.text.isNotEmpty &&
            Validator.isEmailValid(emailCtrl.text) &&
            selectedSchool != null
        // selectedHotel != null &&
        // passwordCtrl.text.isNotEmpty &&
        // Validator.isPasswordValid(passwordCtrl.text)) {
        ) {
      return true;
    } else {
      return false;
    }
  }
}
