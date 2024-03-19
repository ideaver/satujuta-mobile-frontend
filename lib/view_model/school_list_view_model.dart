import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/school_find_many.graphql.dart';
import 'package:satujuta_gql_client/services/mobile/gql_school_service.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/utility/console_log.dart';
import '../widget/atom/app_dialog.dart';

class SchoolListViewModel extends ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();

  bool createMode = false;

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController provinceCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController districtCtrl = TextEditingController();
  TextEditingController subdistrictCtrl = TextEditingController();
  TextEditingController postalCodeCtrl = TextEditingController();

  int? provinceId;
  int? cityId;
  int? districtId;
  int? subdistrictId;

  List<Query$SchoolFindManyByName$schoolFindMany>? schoolFindMany;

  Query$SchoolFindManyByName$schoolFindMany? selectedSchool;

  void resetState() {
    searchCtrl.clear();
    nameCtrl.clear();
    addressCtrl.clear();
    createMode = false;
    schoolFindMany = null;
    selectedSchool = null;
  }

  Future<void> getSchools(
    NavigatorState navigator, {
    // required int cityId,
    int skip = 0,
    String contains = "",
  }) async {
    var res = await GqlSchoolService.schoolFindManyByName(
      // cityId: cityId,
      skip: skip,
      contains: contains,
    );

    cl('================ $cityId');

    if (res.parsedData?.schoolFindMany != null && !res.hasException) {
      if (skip == 0) {
        schoolFindMany = res.parsedData?.schoolFindMany;
      } else {
        schoolFindMany?.addAll(res.parsedData?.schoolFindMany ?? []);
      }

      notifyListeners();
    } else {
      cl('[getSchools].error = ${gqlErrorParser(res)}');
    }

    cl('[getSchools].schoolFindMany.length = ${schoolFindMany?.length}');
  }

  Future<String?> createSchool({
    required int subdistrictId,
  }) async {
    var res = await GqlSchoolService.schoolCreateOne(
      name: nameCtrl.text,
      address: addressCtrl.text,
      subdistrictId: subdistrictId,
    );

    if (res.parsedData?.schoolCreateOne != null && !res.hasException) {
      return null;
    } else {
      cl('[createSchool].error = ${gqlErrorParser(res)}');
      return gqlErrorParser(res);
    }
  }

  void onSelectSchool(Query$SchoolFindManyByName$schoolFindMany school) {
    selectedSchool = school;
    notifyListeners();

    cl('[onSelectSchool].selectedSchool = ${selectedSchool?.id}: ${selectedSchool?.name}');
  }

  void onTapCreateSchoolButton() {
    createMode = true;
    notifyListeners();

    cl('[onSelectSchool].selectedSchool = ${selectedSchool?.id}: ${selectedSchool?.name}');
  }

  void onTapRegisterSchoolButton(NavigatorState navigator, int cityId, int subdistrictid) async {
    AppDialog.showDialogProgress(navigator);

    var errorRes = await createSchool(subdistrictId: subdistrictid);

    navigator.pop();

    if (errorRes == null) {
      createMode = false;
      notifyListeners();

      getSchools(
        navigator,
        // cityId: cityId,
      );
    } else {
      AppDialog.showErrorDialog(navigator, message: errorRes);
    }
  }
}
