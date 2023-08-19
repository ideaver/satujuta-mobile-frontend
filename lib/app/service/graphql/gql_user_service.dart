import '../locator/service_locator.dart';
import 'graphql_service.dart';
import 'query/generated/user_find_many.graphql.dart';
import 'query/generated/user_find_one.graphql.dart';
import 'schema/generated/schema.graphql.dart';

class GqlUserService {
  static final client = locator<GraphQLService>().client;

  static Future<List<Query$UserFindMany$userFindMany>?> getAllUsers() async {
    final result = await client.query$UserFindMany(Options$Query$UserFindMany(
      variables: Variables$Query$UserFindMany(
        userFindManyArgs: Input$UserFindManyArgs(
          orderBy: [
            Input$UserOrderByWithRelationInput(
              createdAt: Enum$SortOrder.asc,
            )
          ],
          take: 10,
        ),
      ),
    ));

    return result.parsedData?.userFindMany;
  }

  static Future<List<Query$UserFindMany$userFindMany>?> getAllUserMembers(String userId, {int? skip}) async {
    final result = await client.query$UserFindMany(Options$Query$UserFindMany(
      variables: Variables$Query$UserFindMany(
        userFindManyArgs: Input$UserFindManyArgs(
          where: Input$UserWhereInput(
            referredBy: Input$UserNullableRelationFilter(
              $is: Input$UserWhereInput(
                id: Input$StringFilter(
                  equals: userId,
                ),
              ),
            ),
          ),
          orderBy: [
            Input$UserOrderByWithRelationInput(
              createdAt: Enum$SortOrder.asc,
            )
          ],
          take: 10,
          skip: skip,
        ),
      ),
    ));

    return result.parsedData?.userFindMany;
  }

  static Future<Query$UserFindOne$userFindOne?> getUserById(String id) async {
    final result = await client.query$UserFindOne(Options$Query$UserFindOne(
      variables: Variables$Query$UserFindOne(
        userFindUniqueArgs: Input$UserFindUniqueArgs(
          where: Input$UserWhereUniqueInput(
            id: id,
          ),
        ),
      ),
    ));

    return result.parsedData?.userFindOne;
  }
}
