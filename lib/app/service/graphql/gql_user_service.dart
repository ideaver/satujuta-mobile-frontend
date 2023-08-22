import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:satujuta_app_mobile/app/service/graphql/query/generated/user_update_one.graphql.dart';

import '../locator/service_locator.dart';
import 'graphql_service.dart';
import 'query/generated/user_find_many.graphql.dart';
import 'query/generated/user_find_one.graphql.dart';
import 'schema/generated/schema.graphql.dart';

class GqlUserService {
  static final _client = locator<GraphQLService>().client;

  static Future<QueryResult<Query$UserFindMany>> getAllUsers() async {
    return await _client.query$UserFindMany(
      Options$Query$UserFindMany(
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
      ),
    );
  }

  static Future<QueryResult<Query$UserFindMany>> getAllUserMembers(String userId, {int? skip}) async {
    return await _client.query$UserFindMany(
      Options$Query$UserFindMany(
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
      ),
    );
  }

  static Future<QueryResult<Query$UserFindOne>> getUserById(String id) async {
    return await _client.query$UserFindOne(
      Options$Query$UserFindOne(
        variables: Variables$Query$UserFindOne(
          userFindUniqueArgs: Input$UserFindUniqueArgs(
            where: Input$UserWhereUniqueInput(
              id: id,
            ),
          ),
        ),
      ),
    );
  }

  static Future<QueryResult<Mutation$UserUpdateOne>> updateUser(
    Mutation$UserUpdateOne$userUpdateOne user,
  ) async {
    return await _client.mutate(
      MutationOptions(
        document: documentNodeMutationUserUpdateOne,
        parserFn: (data) => Mutation$UserUpdateOne.fromJson(data),
        variables: {
          "userUpdateOneArgs": {
            "where": {"id": user.id},
            "data": {
              "firstName": {"set": user.firstName},
              "lastName": {"set": user.lastName},
              "email": {"set": user.email},
              "whatsappNumber": {"set": user.whatsappNumber},
              // "whatsappVerifiedAt": {"set": null},
              // "password": {"set": null},
              // "theme": {"set": user.theme},
              // "userType": {"set": user.userType},
              "avatarUrl": {"set": user.avatarUrl},
            }
          }
        },
      ),
    );
  }
}
