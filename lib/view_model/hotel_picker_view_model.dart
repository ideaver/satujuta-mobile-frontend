import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/hotel_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/mobile/generated/province_find_many.graphql.dart';
import 'package:satujuta_gql_client/services/mobile/gql_address_service.dart';
import 'package:satujuta_gql_client/services/mobile/gql_hotel_service.dart';
import 'package:satujuta_gql_client/utils/gql_error_parser.dart';

import '../app/utility/console_log.dart';
import '../widget/atom/app_dialog.dart';

class HotelPickerViewModel extends ChangeNotifier {
  List<Query$ProvinceFindMany$provinceFindMany>? provinceFindMany;

  List<Query$HotelFindMany$hotelFindMany>? hotelFindMany;

  Query$ProvinceFindMany$provinceFindMany? selectedProvince;

  Query$HotelFindMany$hotelFindMany? selectedHotel;

  int selectedTabIndex = -1;

  void resetState() {
    provinceFindMany = null;
    hotelFindMany = null;
    selectedProvince = null;
    selectedHotel = null;
    selectedTabIndex = -1;
  }

  void initHotelPicker(NavigatorState navigator) async {
    getProvinces(navigator);
    getAllHotels(navigator);
  }

  Future<void> getProvinces(
    NavigatorState navigator, {
    int skip = 0,
    String? contains,
  }) async {
    var res = await GqlAddressService.provinceFindMany(
      skip: skip,
      contains: contains ?? '',
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

    cl('[getCities].provinceFindMany.length = ${provinceFindMany?.length}');
  }

  Future<void> getAllHotels(
    NavigatorState navigator, {
    int skip = 0,
    String contains = "",
  }) async {
    var res = await GqlHotelService.hotelFindMany(
      skip: skip,
      contains: contains,
    );

    if (res.parsedData?.hotelFindMany != null && !res.hasException) {
      if (skip == 0) {
        hotelFindMany = res.parsedData!.hotelFindMany;
      } else {
        hotelFindMany?.addAll(res.parsedData!.hotelFindMany ?? []);
      }

      notifyListeners();
    } else {
      cl('[getAllHotels].error = ${gqlErrorParser(res)}');
      AppDialog.showFailedDialog(
        navigator,
        error: gqlErrorParser(res),
      );
    }

    cl('[getAllHotels].hotelFindMany.length = ${hotelFindMany?.length}');
  }

  Future<void> getHotelsByProvinceId(
    NavigatorState navigator, {
    required int provinceId,
    int skip = 0,
    String contains = "",
  }) async {
    var res = await GqlHotelService.hotelFindManyByProvinceId(
      provinceId: provinceId,
      skip: skip,
    );

    if (res.parsedData?.hotelFindMany != null && !res.hasException) {
      if (skip == 0) {
        hotelFindMany = res.parsedData!.hotelFindMany;
      } else {
        hotelFindMany?.addAll(res.parsedData!.hotelFindMany ?? []);
      }

      notifyListeners();
    } else {
      cl('[getHotelsByProvinceId].error = ${gqlErrorParser(res)}');
      AppDialog.showFailedDialog(
        navigator,
        error: gqlErrorParser(res),
      );
    }

    cl('[getHotelsByProvinceId].hotelFindMany.length = ${hotelFindMany?.length}');
  }

  Future<void> getHotelsByCityId(
    NavigatorState navigator, {
    required int cityId,
    int skip = 0,
    String contains = "",
  }) async {
    var res = await GqlHotelService.hotelFindManyByCityId(
      cityId: cityId,
      skip: skip,
    );

    if (res.parsedData?.hotelFindMany != null && !res.hasException) {
      hotelFindMany = res.parsedData!.hotelFindMany;
      notifyListeners();
    } else {
      cl('[getHotelsByCityId].error = ${gqlErrorParser(res)}');
      AppDialog.showFailedDialog(
        navigator,
        error: gqlErrorParser(res),
      );
    }

    cl('[getHotelsByCityId].hotelFindMany.length = ${hotelFindMany?.length}');
  }

  void onSelectProvince(NavigatorState navigator, Query$ProvinceFindMany$provinceFindMany? province, int tabIndex) {
    selectedProvince = province;
    selectedTabIndex = tabIndex;
    notifyListeners();

    if (province != null) {
      getHotelsByProvinceId(navigator, provinceId: province.id);
    } else {
      getAllHotels(navigator);
    }

    cl('[onSelectProvince].selectedProvince =  ${selectedProvince?.id}: ${selectedProvince?.name}');
  }

  void onSelectHotel(Query$HotelFindMany$hotelFindMany hotel) {
    if (selectedHotel != null) {
      selectedHotel = null;
    } else {
      selectedHotel = hotel;
    }

    notifyListeners();

    cl('[onSelectHotel].selectedHotel =  ${selectedHotel?.id}: ${selectedHotel?.name}');
  }
}
