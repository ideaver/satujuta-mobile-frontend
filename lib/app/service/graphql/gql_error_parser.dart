import 'package:collection/collection.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String gqlErrorParser(QueryResult res) {
  var code = res.exception?.graphqlErrors.firstOrNull?.extensions?['code'];
  var message = res.exception?.graphqlErrors.firstOrNull?.message;

  return "$message. [$code]";
}
