import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:satujuta_app_mobile/view_model/user_view_model.dart';
import 'package:satujuta_gql_client/gql_address_service.dart';
import 'package:satujuta_gql_client/gql_error_parser.dart';
import 'package:satujuta_gql_client/operations/generated/city_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/generated/district_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/generated/province_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/generated/subdistrict_find_many.graphql.dart';

import '../app/service/locator/service_locator.dart';
import '../app/service/network_checker/network_checker_service.dart';
import '../app/utility/console_log.dart';
import '../widget/atom/app_dialog.dart';

class AddressViewModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  final network = locator<NetworkCheckerService>();
  final userViewModel = locator<UserViewModel>();

  List<Query$ProvinceFindMany$provinceFindMany>? provinceFindMany;
  List<Query$CityFindMany$cityFindMany>? cityFindMany;
  List<Query$DistrictFindMany$districtFindMany>? districtFindMany;
  List<Query$SubdistrictFindMany$subdistrictFindMany>? subdistrictFindMany;

  Query$ProvinceFindMany$provinceFindMany? selectedProvince;
  Query$CityFindMany$cityFindMany? selectedCity;
  Query$DistrictFindMany$districtFindMany? selectedDistrict;
  Query$SubdistrictFindMany$subdistrictFindMany? selectedSubdistrict;

  void resetState() {
    provinceFindMany = null;
    cityFindMany = null;
    districtFindMany = null;
    subdistrictFindMany = null;
    selectedProvince = null;
    selectedCity = null;
    selectedDistrict = null;
    selectedSubdistrict = null;
  }

  Future<void> getProvinces(NavigatorState navigator, {int skip = 0, String? contains}) async {
    var res = await GqlAddressService.provinceFindMany(
      skip: skip,
      contains: contains,
    );

    if (res.parsedData?.provinceFindMany != null && !res.hasException) {
      provinceFindMany = res.parsedData!.provinceFindMany;
      notifyListeners();
    } else {
      cl('[getProvinces].error = ${gqlErrorParser(res)}');
      AppDialog.showFailedDialog(
        navigator,
        error: gqlErrorParser(res),
      );
    }

    cl('[getProvinces].provinceFindMany.length = ${provinceFindMany?.length}');
  }

  Future<void> getCities(
    NavigatorState navigator, {
    required int provinceId,
    int skip = 0,
    String? contains,
  }) async {
    var res = await GqlAddressService.cityFindMany(
      provinceId: provinceId,
      skip: skip,
      contains: contains,
    );

    if (res.parsedData?.cityFindMany != null && !res.hasException) {
      cityFindMany = res.parsedData!.cityFindMany;
      notifyListeners();
    } else {
      cl('[getCities].error = ${gqlErrorParser(res)}');
      AppDialog.showFailedDialog(
        navigator,
        error: gqlErrorParser(res),
      );
    }

    cl('[getCities].cityFindMany.length = ${cityFindMany?.length}');
  }

  Future<void> getDistrict(
    NavigatorState navigator, {
    required int cityId,
    int skip = 0,
    String? contains,
  }) async {
    var res = await GqlAddressService.districtFindMany(
      cityId: cityId,
      skip: skip,
      contains: contains,
    );

    if (res.parsedData?.districtFindMany != null && !res.hasException) {
      districtFindMany = res.parsedData!.districtFindMany;
      notifyListeners();
    } else {
      cl('[getDistrict].error = ${gqlErrorParser(res)}');
      AppDialog.showFailedDialog(
        navigator,
        error: gqlErrorParser(res),
      );
    }

    cl('[getDistrict].districtFindMany.length = ${districtFindMany?.length}');
  }

  Future<void> getSubdistrict(
    NavigatorState navigator, {
    required int districtId,
    int skip = 0,
    String? contains,
  }) async {
    var res = await GqlAddressService.subdistrictFindMany(
      districtId: districtId,
      skip: skip,
      contains: contains,
    );

    if (res.parsedData?.subdistrictFindMany != null && !res.hasException) {
      subdistrictFindMany = res.parsedData!.subdistrictFindMany;
      notifyListeners();
    } else {
      cl('[getSubdistrict].error = ${gqlErrorParser(res)}');
      AppDialog.showFailedDialog(
        navigator,
        error: gqlErrorParser(res),
      );
    }

    cl('[getSubdistrict].subdistrictFindMany.length = ${subdistrictFindMany?.length}');
  }

  void onSelectProvince(Query$ProvinceFindMany$provinceFindMany province) {
    selectedProvince = province;
    notifyListeners();

    cl('[onSelectProvince].province = ${province.id}: ${province.name}');
  }

  void onSelectCity(Query$CityFindMany$cityFindMany city) {
    selectedCity = city;
    notifyListeners();

    cl('[onSelectCity].city =  ${city.id}: ${city.name}');
  }

  void onSelectDistrict(Query$DistrictFindMany$districtFindMany district) {
    selectedDistrict = district;
    notifyListeners();

    cl('[onSelectDistrict].district = ${district.id}: ${district.name}');
  }

  void onSelectSubdistrict(Query$SubdistrictFindMany$subdistrictFindMany subdistrict) {
    selectedSubdistrict = subdistrict;
    notifyListeners();

    cl('[onSelectSubdistrict].subdistrict =  ${subdistrict.id}: ${subdistrict.name}');
  }
}
