import 'package:flutter/material.dart';
import 'package:satujuta_gql_client/gql_address_service.dart';
import 'package:satujuta_gql_client/gql_error_parser.dart';
import 'package:satujuta_gql_client/gql_hotel_service.dart';
import 'package:satujuta_gql_client/operations/generated/city_find_many.graphql.dart';
import 'package:satujuta_gql_client/operations/generated/hotel_find_many.graphql.dart';

import '../app/utility/console_log.dart';
import '../widget/atom/app_dialog.dart';

class HotelPickerViewModel extends ChangeNotifier {
  List<Query$CityFindMany$cityFindMany>? cityFindMany;

  List<Query$HotelFindMany$hotelFindMany>? hotelFindMany;

  Query$CityFindMany$cityFindMany? selectedCity;

  Query$HotelFindMany$hotelFindMany? selectedHotel;

  int selectedTabIndex = -1;

  void resetState() {
    cityFindMany = null;
    hotelFindMany = null;
    selectedCity = null;
    selectedHotel = null;
    selectedTabIndex = -1;
  }

  void initHotelPicker(NavigatorState navigator, int? provinceId) async {
    resetState();

    if (provinceId != null) {
      await getCities(navigator, provinceId: provinceId);
    }

    await getAllHotels(navigator);

    notifyListeners();
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
      hotelFindMany = res.parsedData!.hotelFindMany;
      notifyListeners();
    } else {
      cl('[getAllHotels].error = ${gqlErrorParser(res)}');
      AppDialog.showFailedDialog(
        navigator,
        error: gqlErrorParser(res),
      );
    }

    cl('[getAllHotels].cityFindMany.length = ${cityFindMany?.length}');
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

    cl('[getHotelsByCityId].cityFindMany.length = ${cityFindMany?.length}');
  }

  void onSelectCity(NavigatorState navigator, Query$CityFindMany$cityFindMany? city, int tabIndex) {
    selectedCity = city;
    selectedTabIndex = tabIndex;
    notifyListeners();

    if (city != null) {
      getHotelsByCityId(navigator, cityId: city.id);
    }

    cl('[onSelectCity].selectedCity =  ${selectedCity?.id}: ${selectedCity?.name}');
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
