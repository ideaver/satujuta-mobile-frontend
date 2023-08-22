import 'package:graphql_flutter/graphql_flutter.dart';

import '../locator/service_locator.dart';
import 'graphql_service.dart';
import 'query/generated/city_find_many.graphql.dart';
import 'query/generated/district_find_many.graphql.dart';
import 'query/generated/province_find_many.graphql.dart';
import 'schema/generated/schema.graphql.dart';

class GqlAddressService {
  static final _client = locator<GraphQLService>().client;

  static Future<QueryResult<Query$ProvinceFindMany>> getProvinces() async {
    return await _client.query$ProvinceFindMany(
      Options$Query$ProvinceFindMany(
        variables: Variables$Query$ProvinceFindMany(
          provinceFindManyArgs: Input$ProvinceFindManyArgs(
            orderBy: [
              Input$ProvinceOrderByWithRelationInput(
                name: Enum$SortOrder.asc,
              )
            ],
          ),
        ),
      ),
    );
  }

  static Future<QueryResult<Query$CityFindMany>> getCities(int provinceId) async {
    return await _client.query$CityFindMany(
      Options$Query$CityFindMany(
        variables: Variables$Query$CityFindMany(
          cityFindManyArgs: Input$CityFindManyArgs(
            where: Input$CityWhereInput(
              provinceId: Input$IntFilter(
                equals: provinceId,
              ),
            ),
            orderBy: [
              Input$CityOrderByWithRelationInput(
                name: Enum$SortOrder.asc,
              )
            ],
          ),
        ),
      ),
    );
  }

  static Future<QueryResult<Query$DistrictFindMany>> getDistricts(int cityId) async {
    return await _client.query$DistrictFindMany(
      Options$Query$DistrictFindMany(
        variables: Variables$Query$DistrictFindMany(
          districtFindManyArgs: Input$DistrictFindManyArgs(
            where: Input$DistrictWhereInput(
              cityId: Input$IntFilter(
                equals: cityId,
              ),
            ),
            orderBy: [
              Input$DistrictOrderByWithRelationInput(
                name: Enum$SortOrder.asc,
              )
            ],
          ),
        ),
      ),
    );
  }
}
