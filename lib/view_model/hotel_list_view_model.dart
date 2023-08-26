import 'package:flutter/material.dart';
import 'package:satujuta_app_mobile/app/utility/console_log.dart';
import 'package:satujuta_gql_client/gql_error_parser.dart';
import 'package:satujuta_gql_client/gql_hotel_service.dart';
import 'package:satujuta_gql_client/operations/generated/hotel_find_many.graphql.dart';

class HotelListViewModel extends ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();

  List<Query$HotelFindMany$hotelFindMany>? hotels;

  void resetState() {
    hotels = null;
  }

  Future<void> getAllHotels({int skip = 0}) async {
    var res = await GqlHotelService.hotelFindMany(skip: skip);

    if (res.parsedData?.hotelFindMany != null && !res.hasException) {
      hotels = res.parsedData?.hotelFindMany;
      notifyListeners();
    } else {
      cl('[getAllHotels].error = ${gqlErrorParser(res)}');
    }
  }

  Future<void> getAllHotelsByCityId({required int cityId, int skip = 0}) async {
    var res = await GqlHotelService.hotelFindManyByCityId(cityId: cityId, skip: skip);

    if (res.parsedData?.hotelFindMany != null && !res.hasException) {
      hotels = res.parsedData?.hotelFindMany;
      notifyListeners();
    } else {
      cl('[getAllHotelsByCityId].error = ${gqlErrorParser(res)}');
    }
  }
}
