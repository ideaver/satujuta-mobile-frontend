import '../../schema/generated/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$UserFindMany {
  factory Variables$Query$UserFindMany(
          {required Input$UserFindManyArgs userFindManyArgs}) =>
      Variables$Query$UserFindMany._({
        r'userFindManyArgs': userFindManyArgs,
      });

  Variables$Query$UserFindMany._(this._$data);

  factory Variables$Query$UserFindMany.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userFindManyArgs = data['userFindManyArgs'];
    result$data['userFindManyArgs'] = Input$UserFindManyArgs.fromJson(
        (l$userFindManyArgs as Map<String, dynamic>));
    return Variables$Query$UserFindMany._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$UserFindManyArgs get userFindManyArgs =>
      (_$data['userFindManyArgs'] as Input$UserFindManyArgs);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userFindManyArgs = userFindManyArgs;
    result$data['userFindManyArgs'] = l$userFindManyArgs.toJson();
    return result$data;
  }

  CopyWith$Variables$Query$UserFindMany<Variables$Query$UserFindMany>
      get copyWith => CopyWith$Variables$Query$UserFindMany(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$UserFindMany) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userFindManyArgs = userFindManyArgs;
    final lOther$userFindManyArgs = other.userFindManyArgs;
    if (l$userFindManyArgs != lOther$userFindManyArgs) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userFindManyArgs = userFindManyArgs;
    return Object.hashAll([l$userFindManyArgs]);
  }
}

abstract class CopyWith$Variables$Query$UserFindMany<TRes> {
  factory CopyWith$Variables$Query$UserFindMany(
    Variables$Query$UserFindMany instance,
    TRes Function(Variables$Query$UserFindMany) then,
  ) = _CopyWithImpl$Variables$Query$UserFindMany;

  factory CopyWith$Variables$Query$UserFindMany.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$UserFindMany;

  TRes call({Input$UserFindManyArgs? userFindManyArgs});
}

class _CopyWithImpl$Variables$Query$UserFindMany<TRes>
    implements CopyWith$Variables$Query$UserFindMany<TRes> {
  _CopyWithImpl$Variables$Query$UserFindMany(
    this._instance,
    this._then,
  );

  final Variables$Query$UserFindMany _instance;

  final TRes Function(Variables$Query$UserFindMany) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? userFindManyArgs = _undefined}) =>
      _then(Variables$Query$UserFindMany._({
        ..._instance._$data,
        if (userFindManyArgs != _undefined && userFindManyArgs != null)
          'userFindManyArgs': (userFindManyArgs as Input$UserFindManyArgs),
      }));
}

class _CopyWithStubImpl$Variables$Query$UserFindMany<TRes>
    implements CopyWith$Variables$Query$UserFindMany<TRes> {
  _CopyWithStubImpl$Variables$Query$UserFindMany(this._res);

  TRes _res;

  call({Input$UserFindManyArgs? userFindManyArgs}) => _res;
}

class Query$UserFindMany {
  Query$UserFindMany({
    this.userFindMany,
    this.$__typename = 'Query',
  });

  factory Query$UserFindMany.fromJson(Map<String, dynamic> json) {
    final l$userFindMany = json['userFindMany'];
    final l$$__typename = json['__typename'];
    return Query$UserFindMany(
      userFindMany: (l$userFindMany as List<dynamic>?)
          ?.map((e) => Query$UserFindMany$userFindMany.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$UserFindMany$userFindMany>? userFindMany;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userFindMany = userFindMany;
    _resultData['userFindMany'] =
        l$userFindMany?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userFindMany = userFindMany;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$userFindMany == null
          ? null
          : Object.hashAll(l$userFindMany.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$UserFindMany) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$userFindMany = userFindMany;
    final lOther$userFindMany = other.userFindMany;
    if (l$userFindMany != null && lOther$userFindMany != null) {
      if (l$userFindMany.length != lOther$userFindMany.length) {
        return false;
      }
      for (int i = 0; i < l$userFindMany.length; i++) {
        final l$userFindMany$entry = l$userFindMany[i];
        final lOther$userFindMany$entry = lOther$userFindMany[i];
        if (l$userFindMany$entry != lOther$userFindMany$entry) {
          return false;
        }
      }
    } else if (l$userFindMany != lOther$userFindMany) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$UserFindMany on Query$UserFindMany {
  CopyWith$Query$UserFindMany<Query$UserFindMany> get copyWith =>
      CopyWith$Query$UserFindMany(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$UserFindMany<TRes> {
  factory CopyWith$Query$UserFindMany(
    Query$UserFindMany instance,
    TRes Function(Query$UserFindMany) then,
  ) = _CopyWithImpl$Query$UserFindMany;

  factory CopyWith$Query$UserFindMany.stub(TRes res) =
      _CopyWithStubImpl$Query$UserFindMany;

  TRes call({
    List<Query$UserFindMany$userFindMany>? userFindMany,
    String? $__typename,
  });
  TRes userFindMany(
      Iterable<Query$UserFindMany$userFindMany>? Function(
              Iterable<
                  CopyWith$Query$UserFindMany$userFindMany<
                      Query$UserFindMany$userFindMany>>?)
          _fn);
}

class _CopyWithImpl$Query$UserFindMany<TRes>
    implements CopyWith$Query$UserFindMany<TRes> {
  _CopyWithImpl$Query$UserFindMany(
    this._instance,
    this._then,
  );

  final Query$UserFindMany _instance;

  final TRes Function(Query$UserFindMany) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userFindMany = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$UserFindMany(
        userFindMany: userFindMany == _undefined
            ? _instance.userFindMany
            : (userFindMany as List<Query$UserFindMany$userFindMany>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes userFindMany(
          Iterable<Query$UserFindMany$userFindMany>? Function(
                  Iterable<
                      CopyWith$Query$UserFindMany$userFindMany<
                          Query$UserFindMany$userFindMany>>?)
              _fn) =>
      call(
          userFindMany: _fn(_instance.userFindMany
              ?.map((e) => CopyWith$Query$UserFindMany$userFindMany(
                    e,
                    (i) => i,
                  )))?.toList());
}

class _CopyWithStubImpl$Query$UserFindMany<TRes>
    implements CopyWith$Query$UserFindMany<TRes> {
  _CopyWithStubImpl$Query$UserFindMany(this._res);

  TRes _res;

  call({
    List<Query$UserFindMany$userFindMany>? userFindMany,
    String? $__typename,
  }) =>
      _res;
  userFindMany(_fn) => _res;
}

const documentNodeQueryUserFindMany = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'UserFindMany'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userFindManyArgs')),
        type: NamedTypeNode(
          name: NameNode(value: 'UserFindManyArgs'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'userFindMany'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userFindManyArgs'),
            value: VariableNode(name: NameNode(value: 'userFindManyArgs')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'avatarUrl'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'email'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'addressId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'userRole'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'userType'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'avatarUrl'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'whatsappNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'whatsappVerifiedAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'referralCode'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'schoolId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'theme'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updatedAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'referredById'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'referredBy'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'firstName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'lastName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '_count'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'referredUsers'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'claimedRewards'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'PointTransactions'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'transactionType'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'createdAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'amount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$UserFindMany _parserFn$Query$UserFindMany(Map<String, dynamic> data) =>
    Query$UserFindMany.fromJson(data);
typedef OnQueryComplete$Query$UserFindMany = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$UserFindMany?,
);

class Options$Query$UserFindMany
    extends graphql.QueryOptions<Query$UserFindMany> {
  Options$Query$UserFindMany({
    String? operationName,
    required Variables$Query$UserFindMany variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$UserFindMany? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$UserFindMany? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$UserFindMany(data),
                  ),
          onError: onError,
          document: documentNodeQueryUserFindMany,
          parserFn: _parserFn$Query$UserFindMany,
        );

  final OnQueryComplete$Query$UserFindMany? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$UserFindMany
    extends graphql.WatchQueryOptions<Query$UserFindMany> {
  WatchOptions$Query$UserFindMany({
    String? operationName,
    required Variables$Query$UserFindMany variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$UserFindMany? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryUserFindMany,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$UserFindMany,
        );
}

class FetchMoreOptions$Query$UserFindMany extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$UserFindMany({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$UserFindMany variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryUserFindMany,
        );
}

extension ClientExtension$Query$UserFindMany on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$UserFindMany>> query$UserFindMany(
          Options$Query$UserFindMany options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$UserFindMany> watchQuery$UserFindMany(
          WatchOptions$Query$UserFindMany options) =>
      this.watchQuery(options);
  void writeQuery$UserFindMany({
    required Query$UserFindMany data,
    required Variables$Query$UserFindMany variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryUserFindMany),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$UserFindMany? readQuery$UserFindMany({
    required Variables$Query$UserFindMany variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryUserFindMany),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$UserFindMany.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$UserFindMany> useQuery$UserFindMany(
        Options$Query$UserFindMany options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$UserFindMany> useWatchQuery$UserFindMany(
        WatchOptions$Query$UserFindMany options) =>
    graphql_flutter.useWatchQuery(options);

class Query$UserFindMany$Widget
    extends graphql_flutter.Query<Query$UserFindMany> {
  Query$UserFindMany$Widget({
    widgets.Key? key,
    required Options$Query$UserFindMany options,
    required graphql_flutter.QueryBuilder<Query$UserFindMany> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$UserFindMany$userFindMany {
  Query$UserFindMany$userFindMany({
    required this.id,
    this.avatarUrl,
    required this.firstName,
    this.lastName,
    required this.email,
    required this.addressId,
    required this.userRole,
    required this.userType,
    required this.whatsappNumber,
    this.whatsappVerifiedAt,
    required this.referralCode,
    required this.status,
    this.schoolId,
    required this.theme,
    required this.createdAt,
    required this.updatedAt,
    this.referredById,
    this.referredBy,
    required this.$_count,
    this.PointTransactions,
    this.$__typename = 'User',
  });

  factory Query$UserFindMany$userFindMany.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$avatarUrl = json['avatarUrl'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$email = json['email'];
    final l$addressId = json['addressId'];
    final l$userRole = json['userRole'];
    final l$userType = json['userType'];
    final l$whatsappNumber = json['whatsappNumber'];
    final l$whatsappVerifiedAt = json['whatsappVerifiedAt'];
    final l$referralCode = json['referralCode'];
    final l$status = json['status'];
    final l$schoolId = json['schoolId'];
    final l$theme = json['theme'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$referredById = json['referredById'];
    final l$referredBy = json['referredBy'];
    final l$$_count = json['_count'];
    final l$PointTransactions = json['PointTransactions'];
    final l$$__typename = json['__typename'];
    return Query$UserFindMany$userFindMany(
      id: (l$id as String),
      avatarUrl: (l$avatarUrl as String?),
      firstName: (l$firstName as String),
      lastName: (l$lastName as String?),
      email: (l$email as String),
      addressId: (l$addressId as int),
      userRole: fromJson$Enum$UserRole((l$userRole as String)),
      userType: fromJson$Enum$UserType((l$userType as String)),
      whatsappNumber: (l$whatsappNumber as String),
      whatsappVerifiedAt: (l$whatsappVerifiedAt as String?),
      referralCode: (l$referralCode as String),
      status: fromJson$Enum$UserStatus((l$status as String)),
      schoolId: (l$schoolId as int?),
      theme: fromJson$Enum$Theme((l$theme as String)),
      createdAt: (l$createdAt as String),
      updatedAt: (l$updatedAt as String),
      referredById: (l$referredById as String?),
      referredBy: l$referredBy == null
          ? null
          : Query$UserFindMany$userFindMany$referredBy.fromJson(
              (l$referredBy as Map<String, dynamic>)),
      $_count: Query$UserFindMany$userFindMany$_count.fromJson(
          (l$$_count as Map<String, dynamic>)),
      PointTransactions: (l$PointTransactions as List<dynamic>?)
          ?.map((e) =>
              Query$UserFindMany$userFindMany$PointTransactions.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? avatarUrl;

  final String firstName;

  final String? lastName;

  final String email;

  final int addressId;

  final Enum$UserRole userRole;

  final Enum$UserType userType;

  final String whatsappNumber;

  final String? whatsappVerifiedAt;

  final String referralCode;

  final Enum$UserStatus status;

  final int? schoolId;

  final Enum$Theme theme;

  final String createdAt;

  final String updatedAt;

  final String? referredById;

  final Query$UserFindMany$userFindMany$referredBy? referredBy;

  final Query$UserFindMany$userFindMany$_count $_count;

  final List<Query$UserFindMany$userFindMany$PointTransactions>?
      PointTransactions;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$avatarUrl = avatarUrl;
    _resultData['avatarUrl'] = l$avatarUrl;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$addressId = addressId;
    _resultData['addressId'] = l$addressId;
    final l$userRole = userRole;
    _resultData['userRole'] = toJson$Enum$UserRole(l$userRole);
    final l$userType = userType;
    _resultData['userType'] = toJson$Enum$UserType(l$userType);
    final l$whatsappNumber = whatsappNumber;
    _resultData['whatsappNumber'] = l$whatsappNumber;
    final l$whatsappVerifiedAt = whatsappVerifiedAt;
    _resultData['whatsappVerifiedAt'] = l$whatsappVerifiedAt;
    final l$referralCode = referralCode;
    _resultData['referralCode'] = l$referralCode;
    final l$status = status;
    _resultData['status'] = toJson$Enum$UserStatus(l$status);
    final l$schoolId = schoolId;
    _resultData['schoolId'] = l$schoolId;
    final l$theme = theme;
    _resultData['theme'] = toJson$Enum$Theme(l$theme);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$referredById = referredById;
    _resultData['referredById'] = l$referredById;
    final l$referredBy = referredBy;
    _resultData['referredBy'] = l$referredBy?.toJson();
    final l$$_count = $_count;
    _resultData['_count'] = l$$_count.toJson();
    final l$PointTransactions = PointTransactions;
    _resultData['PointTransactions'] =
        l$PointTransactions?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$avatarUrl = avatarUrl;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$email = email;
    final l$addressId = addressId;
    final l$userRole = userRole;
    final l$userType = userType;
    final l$whatsappNumber = whatsappNumber;
    final l$whatsappVerifiedAt = whatsappVerifiedAt;
    final l$referralCode = referralCode;
    final l$status = status;
    final l$schoolId = schoolId;
    final l$theme = theme;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$referredById = referredById;
    final l$referredBy = referredBy;
    final l$$_count = $_count;
    final l$PointTransactions = PointTransactions;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$avatarUrl,
      l$firstName,
      l$lastName,
      l$email,
      l$addressId,
      l$userRole,
      l$userType,
      l$whatsappNumber,
      l$whatsappVerifiedAt,
      l$referralCode,
      l$status,
      l$schoolId,
      l$theme,
      l$createdAt,
      l$updatedAt,
      l$referredById,
      l$referredBy,
      l$$_count,
      l$PointTransactions == null
          ? null
          : Object.hashAll(l$PointTransactions.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$UserFindMany$userFindMany) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$avatarUrl = avatarUrl;
    final lOther$avatarUrl = other.avatarUrl;
    if (l$avatarUrl != lOther$avatarUrl) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$addressId = addressId;
    final lOther$addressId = other.addressId;
    if (l$addressId != lOther$addressId) {
      return false;
    }
    final l$userRole = userRole;
    final lOther$userRole = other.userRole;
    if (l$userRole != lOther$userRole) {
      return false;
    }
    final l$userType = userType;
    final lOther$userType = other.userType;
    if (l$userType != lOther$userType) {
      return false;
    }
    final l$whatsappNumber = whatsappNumber;
    final lOther$whatsappNumber = other.whatsappNumber;
    if (l$whatsappNumber != lOther$whatsappNumber) {
      return false;
    }
    final l$whatsappVerifiedAt = whatsappVerifiedAt;
    final lOther$whatsappVerifiedAt = other.whatsappVerifiedAt;
    if (l$whatsappVerifiedAt != lOther$whatsappVerifiedAt) {
      return false;
    }
    final l$referralCode = referralCode;
    final lOther$referralCode = other.referralCode;
    if (l$referralCode != lOther$referralCode) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$schoolId = schoolId;
    final lOther$schoolId = other.schoolId;
    if (l$schoolId != lOther$schoolId) {
      return false;
    }
    final l$theme = theme;
    final lOther$theme = other.theme;
    if (l$theme != lOther$theme) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$referredById = referredById;
    final lOther$referredById = other.referredById;
    if (l$referredById != lOther$referredById) {
      return false;
    }
    final l$referredBy = referredBy;
    final lOther$referredBy = other.referredBy;
    if (l$referredBy != lOther$referredBy) {
      return false;
    }
    final l$$_count = $_count;
    final lOther$$_count = other.$_count;
    if (l$$_count != lOther$$_count) {
      return false;
    }
    final l$PointTransactions = PointTransactions;
    final lOther$PointTransactions = other.PointTransactions;
    if (l$PointTransactions != null && lOther$PointTransactions != null) {
      if (l$PointTransactions.length != lOther$PointTransactions.length) {
        return false;
      }
      for (int i = 0; i < l$PointTransactions.length; i++) {
        final l$PointTransactions$entry = l$PointTransactions[i];
        final lOther$PointTransactions$entry = lOther$PointTransactions[i];
        if (l$PointTransactions$entry != lOther$PointTransactions$entry) {
          return false;
        }
      }
    } else if (l$PointTransactions != lOther$PointTransactions) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$UserFindMany$userFindMany
    on Query$UserFindMany$userFindMany {
  CopyWith$Query$UserFindMany$userFindMany<Query$UserFindMany$userFindMany>
      get copyWith => CopyWith$Query$UserFindMany$userFindMany(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$UserFindMany$userFindMany<TRes> {
  factory CopyWith$Query$UserFindMany$userFindMany(
    Query$UserFindMany$userFindMany instance,
    TRes Function(Query$UserFindMany$userFindMany) then,
  ) = _CopyWithImpl$Query$UserFindMany$userFindMany;

  factory CopyWith$Query$UserFindMany$userFindMany.stub(TRes res) =
      _CopyWithStubImpl$Query$UserFindMany$userFindMany;

  TRes call({
    String? id,
    String? avatarUrl,
    String? firstName,
    String? lastName,
    String? email,
    int? addressId,
    Enum$UserRole? userRole,
    Enum$UserType? userType,
    String? whatsappNumber,
    String? whatsappVerifiedAt,
    String? referralCode,
    Enum$UserStatus? status,
    int? schoolId,
    Enum$Theme? theme,
    String? createdAt,
    String? updatedAt,
    String? referredById,
    Query$UserFindMany$userFindMany$referredBy? referredBy,
    Query$UserFindMany$userFindMany$_count? $_count,
    List<Query$UserFindMany$userFindMany$PointTransactions>? PointTransactions,
    String? $__typename,
  });
  CopyWith$Query$UserFindMany$userFindMany$referredBy<TRes> get referredBy;
  CopyWith$Query$UserFindMany$userFindMany$_count<TRes> get $_count;
  TRes PointTransactions(
      Iterable<Query$UserFindMany$userFindMany$PointTransactions>? Function(
              Iterable<
                  CopyWith$Query$UserFindMany$userFindMany$PointTransactions<
                      Query$UserFindMany$userFindMany$PointTransactions>>?)
          _fn);
}

class _CopyWithImpl$Query$UserFindMany$userFindMany<TRes>
    implements CopyWith$Query$UserFindMany$userFindMany<TRes> {
  _CopyWithImpl$Query$UserFindMany$userFindMany(
    this._instance,
    this._then,
  );

  final Query$UserFindMany$userFindMany _instance;

  final TRes Function(Query$UserFindMany$userFindMany) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? avatarUrl = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? email = _undefined,
    Object? addressId = _undefined,
    Object? userRole = _undefined,
    Object? userType = _undefined,
    Object? whatsappNumber = _undefined,
    Object? whatsappVerifiedAt = _undefined,
    Object? referralCode = _undefined,
    Object? status = _undefined,
    Object? schoolId = _undefined,
    Object? theme = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? referredById = _undefined,
    Object? referredBy = _undefined,
    Object? $_count = _undefined,
    Object? PointTransactions = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$UserFindMany$userFindMany(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        avatarUrl: avatarUrl == _undefined
            ? _instance.avatarUrl
            : (avatarUrl as String?),
        firstName: firstName == _undefined || firstName == null
            ? _instance.firstName
            : (firstName as String),
        lastName:
            lastName == _undefined ? _instance.lastName : (lastName as String?),
        email: email == _undefined || email == null
            ? _instance.email
            : (email as String),
        addressId: addressId == _undefined || addressId == null
            ? _instance.addressId
            : (addressId as int),
        userRole: userRole == _undefined || userRole == null
            ? _instance.userRole
            : (userRole as Enum$UserRole),
        userType: userType == _undefined || userType == null
            ? _instance.userType
            : (userType as Enum$UserType),
        whatsappNumber: whatsappNumber == _undefined || whatsappNumber == null
            ? _instance.whatsappNumber
            : (whatsappNumber as String),
        whatsappVerifiedAt: whatsappVerifiedAt == _undefined
            ? _instance.whatsappVerifiedAt
            : (whatsappVerifiedAt as String?),
        referralCode: referralCode == _undefined || referralCode == null
            ? _instance.referralCode
            : (referralCode as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$UserStatus),
        schoolId:
            schoolId == _undefined ? _instance.schoolId : (schoolId as int?),
        theme: theme == _undefined || theme == null
            ? _instance.theme
            : (theme as Enum$Theme),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as String),
        referredById: referredById == _undefined
            ? _instance.referredById
            : (referredById as String?),
        referredBy: referredBy == _undefined
            ? _instance.referredBy
            : (referredBy as Query$UserFindMany$userFindMany$referredBy?),
        $_count: $_count == _undefined || $_count == null
            ? _instance.$_count
            : ($_count as Query$UserFindMany$userFindMany$_count),
        PointTransactions: PointTransactions == _undefined
            ? _instance.PointTransactions
            : (PointTransactions
                as List<Query$UserFindMany$userFindMany$PointTransactions>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$UserFindMany$userFindMany$referredBy<TRes> get referredBy {
    final local$referredBy = _instance.referredBy;
    return local$referredBy == null
        ? CopyWith$Query$UserFindMany$userFindMany$referredBy.stub(
            _then(_instance))
        : CopyWith$Query$UserFindMany$userFindMany$referredBy(
            local$referredBy, (e) => call(referredBy: e));
  }

  CopyWith$Query$UserFindMany$userFindMany$_count<TRes> get $_count {
    final local$$_count = _instance.$_count;
    return CopyWith$Query$UserFindMany$userFindMany$_count(
        local$$_count, (e) => call($_count: e));
  }

  TRes PointTransactions(
          Iterable<Query$UserFindMany$userFindMany$PointTransactions>? Function(
                  Iterable<
                      CopyWith$Query$UserFindMany$userFindMany$PointTransactions<
                          Query$UserFindMany$userFindMany$PointTransactions>>?)
              _fn) =>
      call(
          PointTransactions: _fn(_instance.PointTransactions?.map(
              (e) => CopyWith$Query$UserFindMany$userFindMany$PointTransactions(
                    e,
                    (i) => i,
                  )))?.toList());
}

class _CopyWithStubImpl$Query$UserFindMany$userFindMany<TRes>
    implements CopyWith$Query$UserFindMany$userFindMany<TRes> {
  _CopyWithStubImpl$Query$UserFindMany$userFindMany(this._res);

  TRes _res;

  call({
    String? id,
    String? avatarUrl,
    String? firstName,
    String? lastName,
    String? email,
    int? addressId,
    Enum$UserRole? userRole,
    Enum$UserType? userType,
    String? whatsappNumber,
    String? whatsappVerifiedAt,
    String? referralCode,
    Enum$UserStatus? status,
    int? schoolId,
    Enum$Theme? theme,
    String? createdAt,
    String? updatedAt,
    String? referredById,
    Query$UserFindMany$userFindMany$referredBy? referredBy,
    Query$UserFindMany$userFindMany$_count? $_count,
    List<Query$UserFindMany$userFindMany$PointTransactions>? PointTransactions,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$UserFindMany$userFindMany$referredBy<TRes> get referredBy =>
      CopyWith$Query$UserFindMany$userFindMany$referredBy.stub(_res);
  CopyWith$Query$UserFindMany$userFindMany$_count<TRes> get $_count =>
      CopyWith$Query$UserFindMany$userFindMany$_count.stub(_res);
  PointTransactions(_fn) => _res;
}

class Query$UserFindMany$userFindMany$referredBy {
  Query$UserFindMany$userFindMany$referredBy({
    required this.id,
    required this.firstName,
    this.lastName,
    this.$__typename = 'UserAbstract',
  });

  factory Query$UserFindMany$userFindMany$referredBy.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$$__typename = json['__typename'];
    return Query$UserFindMany$userFindMany$referredBy(
      id: (l$id as String),
      firstName: (l$firstName as String),
      lastName: (l$lastName as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String firstName;

  final String? lastName;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firstName,
      l$lastName,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$UserFindMany$userFindMany$referredBy) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$UserFindMany$userFindMany$referredBy
    on Query$UserFindMany$userFindMany$referredBy {
  CopyWith$Query$UserFindMany$userFindMany$referredBy<
          Query$UserFindMany$userFindMany$referredBy>
      get copyWith => CopyWith$Query$UserFindMany$userFindMany$referredBy(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$UserFindMany$userFindMany$referredBy<TRes> {
  factory CopyWith$Query$UserFindMany$userFindMany$referredBy(
    Query$UserFindMany$userFindMany$referredBy instance,
    TRes Function(Query$UserFindMany$userFindMany$referredBy) then,
  ) = _CopyWithImpl$Query$UserFindMany$userFindMany$referredBy;

  factory CopyWith$Query$UserFindMany$userFindMany$referredBy.stub(TRes res) =
      _CopyWithStubImpl$Query$UserFindMany$userFindMany$referredBy;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$UserFindMany$userFindMany$referredBy<TRes>
    implements CopyWith$Query$UserFindMany$userFindMany$referredBy<TRes> {
  _CopyWithImpl$Query$UserFindMany$userFindMany$referredBy(
    this._instance,
    this._then,
  );

  final Query$UserFindMany$userFindMany$referredBy _instance;

  final TRes Function(Query$UserFindMany$userFindMany$referredBy) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$UserFindMany$userFindMany$referredBy(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        firstName: firstName == _undefined || firstName == null
            ? _instance.firstName
            : (firstName as String),
        lastName:
            lastName == _undefined ? _instance.lastName : (lastName as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$UserFindMany$userFindMany$referredBy<TRes>
    implements CopyWith$Query$UserFindMany$userFindMany$referredBy<TRes> {
  _CopyWithStubImpl$Query$UserFindMany$userFindMany$referredBy(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? $__typename,
  }) =>
      _res;
}

class Query$UserFindMany$userFindMany$_count {
  Query$UserFindMany$userFindMany$_count({
    required this.referredUsers,
    required this.claimedRewards,
    this.$__typename = 'UserCount',
  });

  factory Query$UserFindMany$userFindMany$_count.fromJson(
      Map<String, dynamic> json) {
    final l$referredUsers = json['referredUsers'];
    final l$claimedRewards = json['claimedRewards'];
    final l$$__typename = json['__typename'];
    return Query$UserFindMany$userFindMany$_count(
      referredUsers: (l$referredUsers as int),
      claimedRewards: (l$claimedRewards as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int referredUsers;

  final int claimedRewards;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$referredUsers = referredUsers;
    _resultData['referredUsers'] = l$referredUsers;
    final l$claimedRewards = claimedRewards;
    _resultData['claimedRewards'] = l$claimedRewards;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$referredUsers = referredUsers;
    final l$claimedRewards = claimedRewards;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$referredUsers,
      l$claimedRewards,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$UserFindMany$userFindMany$_count) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$referredUsers = referredUsers;
    final lOther$referredUsers = other.referredUsers;
    if (l$referredUsers != lOther$referredUsers) {
      return false;
    }
    final l$claimedRewards = claimedRewards;
    final lOther$claimedRewards = other.claimedRewards;
    if (l$claimedRewards != lOther$claimedRewards) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$UserFindMany$userFindMany$_count
    on Query$UserFindMany$userFindMany$_count {
  CopyWith$Query$UserFindMany$userFindMany$_count<
          Query$UserFindMany$userFindMany$_count>
      get copyWith => CopyWith$Query$UserFindMany$userFindMany$_count(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$UserFindMany$userFindMany$_count<TRes> {
  factory CopyWith$Query$UserFindMany$userFindMany$_count(
    Query$UserFindMany$userFindMany$_count instance,
    TRes Function(Query$UserFindMany$userFindMany$_count) then,
  ) = _CopyWithImpl$Query$UserFindMany$userFindMany$_count;

  factory CopyWith$Query$UserFindMany$userFindMany$_count.stub(TRes res) =
      _CopyWithStubImpl$Query$UserFindMany$userFindMany$_count;

  TRes call({
    int? referredUsers,
    int? claimedRewards,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$UserFindMany$userFindMany$_count<TRes>
    implements CopyWith$Query$UserFindMany$userFindMany$_count<TRes> {
  _CopyWithImpl$Query$UserFindMany$userFindMany$_count(
    this._instance,
    this._then,
  );

  final Query$UserFindMany$userFindMany$_count _instance;

  final TRes Function(Query$UserFindMany$userFindMany$_count) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? referredUsers = _undefined,
    Object? claimedRewards = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$UserFindMany$userFindMany$_count(
        referredUsers: referredUsers == _undefined || referredUsers == null
            ? _instance.referredUsers
            : (referredUsers as int),
        claimedRewards: claimedRewards == _undefined || claimedRewards == null
            ? _instance.claimedRewards
            : (claimedRewards as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$UserFindMany$userFindMany$_count<TRes>
    implements CopyWith$Query$UserFindMany$userFindMany$_count<TRes> {
  _CopyWithStubImpl$Query$UserFindMany$userFindMany$_count(this._res);

  TRes _res;

  call({
    int? referredUsers,
    int? claimedRewards,
    String? $__typename,
  }) =>
      _res;
}

class Query$UserFindMany$userFindMany$PointTransactions {
  Query$UserFindMany$userFindMany$PointTransactions({
    required this.id,
    required this.transactionType,
    required this.createdAt,
    required this.amount,
    this.$__typename = 'PointTransaction',
  });

  factory Query$UserFindMany$userFindMany$PointTransactions.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$transactionType = json['transactionType'];
    final l$createdAt = json['createdAt'];
    final l$amount = json['amount'];
    final l$$__typename = json['__typename'];
    return Query$UserFindMany$userFindMany$PointTransactions(
      id: (l$id as int),
      transactionType:
          fromJson$Enum$TransactionType((l$transactionType as String)),
      createdAt: (l$createdAt as String),
      amount: (l$amount as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final Enum$TransactionType transactionType;

  final String createdAt;

  final double amount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$transactionType = transactionType;
    _resultData['transactionType'] =
        toJson$Enum$TransactionType(l$transactionType);
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$amount = amount;
    _resultData['amount'] = l$amount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$transactionType = transactionType;
    final l$createdAt = createdAt;
    final l$amount = amount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$transactionType,
      l$createdAt,
      l$amount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$UserFindMany$userFindMany$PointTransactions) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$transactionType = transactionType;
    final lOther$transactionType = other.transactionType;
    if (l$transactionType != lOther$transactionType) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$amount = amount;
    final lOther$amount = other.amount;
    if (l$amount != lOther$amount) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$UserFindMany$userFindMany$PointTransactions
    on Query$UserFindMany$userFindMany$PointTransactions {
  CopyWith$Query$UserFindMany$userFindMany$PointTransactions<
          Query$UserFindMany$userFindMany$PointTransactions>
      get copyWith =>
          CopyWith$Query$UserFindMany$userFindMany$PointTransactions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$UserFindMany$userFindMany$PointTransactions<
    TRes> {
  factory CopyWith$Query$UserFindMany$userFindMany$PointTransactions(
    Query$UserFindMany$userFindMany$PointTransactions instance,
    TRes Function(Query$UserFindMany$userFindMany$PointTransactions) then,
  ) = _CopyWithImpl$Query$UserFindMany$userFindMany$PointTransactions;

  factory CopyWith$Query$UserFindMany$userFindMany$PointTransactions.stub(
          TRes res) =
      _CopyWithStubImpl$Query$UserFindMany$userFindMany$PointTransactions;

  TRes call({
    int? id,
    Enum$TransactionType? transactionType,
    String? createdAt,
    double? amount,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$UserFindMany$userFindMany$PointTransactions<TRes>
    implements
        CopyWith$Query$UserFindMany$userFindMany$PointTransactions<TRes> {
  _CopyWithImpl$Query$UserFindMany$userFindMany$PointTransactions(
    this._instance,
    this._then,
  );

  final Query$UserFindMany$userFindMany$PointTransactions _instance;

  final TRes Function(Query$UserFindMany$userFindMany$PointTransactions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? transactionType = _undefined,
    Object? createdAt = _undefined,
    Object? amount = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$UserFindMany$userFindMany$PointTransactions(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        transactionType:
            transactionType == _undefined || transactionType == null
                ? _instance.transactionType
                : (transactionType as Enum$TransactionType),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        amount: amount == _undefined || amount == null
            ? _instance.amount
            : (amount as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$UserFindMany$userFindMany$PointTransactions<TRes>
    implements
        CopyWith$Query$UserFindMany$userFindMany$PointTransactions<TRes> {
  _CopyWithStubImpl$Query$UserFindMany$userFindMany$PointTransactions(
      this._res);

  TRes _res;

  call({
    int? id,
    Enum$TransactionType? transactionType,
    String? createdAt,
    double? amount,
    String? $__typename,
  }) =>
      _res;
}
