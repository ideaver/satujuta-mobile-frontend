import '../locator/service_locator.dart';
import 'graphql_service.dart';
import 'query/generated/program_find_many.graphql.dart';
import 'schema/generated/schema.graphql.dart';

class GqlProgramService {
  static final client = locator<GraphQLService>().client;

  static Future<List<Query$ProgramFindMany$programFindMany>?> getAllPrograms({int? skip}) async {
    final result = await client.query$ProgramFindMany(Options$Query$ProgramFindMany(
      variables: Variables$Query$ProgramFindMany(
        programFindManyArgs: Input$ProgramFindManyArgs(
          orderBy: [
            Input$ProgramOrderByWithRelationInput(
              dueDate: Input$SortOrderInput(
                sort: Enum$SortOrder.asc,
              ),
            )
          ],
          take: 10,
          skip: skip,
        ),
      ),
    ));

    return result.parsedData?.programFindMany;
  }
}
