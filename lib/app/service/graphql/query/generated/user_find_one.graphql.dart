import '../../schema/generated/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$UserFindOne {
  factory Variables$Query$UserFindOne(
          {required Input$UserFindUniqueArgs userFindUniqueArgs}) =>
      Variables$Query$UserFindOne._({
        r'userFindUniqueArgs': userFindUniqueArgs,
      });

  Variables$Query$UserFindOne._(this._$data);

  factory Variables$Query$UserFindOne.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userFindUniqueArgs = data['userFindUniqueArgs'];
    result$data['userFindUniqueArgs'] = Input$UserFindUniqueArgs.fromJson(
        (l$userFindUniqueArgs as Map<String, dynamic>));
    return Variables$Query$UserFindOne._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$UserFindUniqueArgs get userFindUniqueArgs =>
      (_$data['userFindUniqueArgs'] as Input$UserFindUniqueArgs);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userFindUniqueArgs = userFindUniqueArgs;
    result$data['userFindUniqueArgs'] = l$userFindUniqueArgs.toJson();
    return result$data;
  }

  CopyWith$Variables$Query$UserFindOne<Variables$Query$UserFindOne>
      get copyWith => CopyWith$Variables$Query$UserFindOne(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$UserFindOne) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userFindUniqueArgs = userFindUniqueArgs;
    final lOther$userFindUniqueArgs = other.userFindUniqueArgs;
    if (l$userFindUniqueArgs != lOther$userFindUniqueArgs) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userFindUniqueArgs = userFindUniqueArgs;
    return Object.hashAll([l$userFindUniqueArgs]);
  }
}

abstract class CopyWith$Variables$Query$UserFindOne<TRes> {
  factory CopyWith$Variables$Query$UserFindOne(
    Variables$Query$UserFindOne instance,
    TRes Function(Variables$Query$UserFindOne) then,
  ) = _CopyWithImpl$Variables$Query$UserFindOne;

  factory CopyWith$Variables$Query$UserFindOne.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$UserFindOne;

  TRes call({Input$UserFindUniqueArgs? userFindUniqueArgs});
}

class _CopyWithImpl$Variables$Query$UserFindOne<TRes>
    implements CopyWith$Variables$Query$UserFindOne<TRes> {
  _CopyWithImpl$Variables$Query$UserFindOne(
    this._instance,
    this._then,
  );

  final Variables$Query$UserFindOne _instance;

  final TRes Function(Variables$Query$UserFindOne) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? userFindUniqueArgs = _undefined}) =>
      _then(Variables$Query$UserFindOne._({
        ..._instance._$data,
        if (userFindUniqueArgs != _undefined && userFindUniqueArgs != null)
          'userFindUniqueArgs':
              (userFindUniqueArgs as Input$UserFindUniqueArgs),
      }));
}

class _CopyWithStubImpl$Variables$Query$UserFindOne<TRes>
    implements CopyWith$Variables$Query$UserFindOne<TRes> {
  _CopyWithStubImpl$Variables$Query$UserFindOne(this._res);

  TRes _res;

  call({Input$UserFindUniqueArgs? userFindUniqueArgs}) => _res;
}

class Query$UserFindOne {
  Query$UserFindOne({
    this.userFindOne,
    this.$__typename = 'Query',
  });

  factory Query$UserFindOne.fromJson(Map<String, dynamic> json) {
    final l$userFindOne = json['userFindOne'];
    final l$$__typename = json['__typename'];
    return Query$UserFindOne(
      userFindOne: l$userFindOne == null
          ? null
          : Query$UserFindOne$userFindOne.fromJson(
              (l$userFindOne as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$UserFindOne$userFindOne? userFindOne;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userFindOne = userFindOne;
    _resultData['userFindOne'] = l$userFindOne?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userFindOne = userFindOne;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$userFindOne,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$UserFindOne) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$userFindOne = userFindOne;
    final lOther$userFindOne = other.userFindOne;
    if (l$userFindOne != lOther$userFindOne) {
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

extension UtilityExtension$Query$UserFindOne on Query$UserFindOne {
  CopyWith$Query$UserFindOne<Query$UserFindOne> get copyWith =>
      CopyWith$Query$UserFindOne(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$UserFindOne<TRes> {
  factory CopyWith$Query$UserFindOne(
    Query$UserFindOne instance,
    TRes Function(Query$UserFindOne) then,
  ) = _CopyWithImpl$Query$UserFindOne;

  factory CopyWith$Query$UserFindOne.stub(TRes res) =
      _CopyWithStubImpl$Query$UserFindOne;

  TRes call({
    Query$UserFindOne$userFindOne? userFindOne,
    String? $__typename,
  });
  CopyWith$Query$UserFindOne$userFindOne<TRes> get userFindOne;
}

class _CopyWithImpl$Query$UserFindOne<TRes>
    implements CopyWith$Query$UserFindOne<TRes> {
  _CopyWithImpl$Query$UserFindOne(
    this._instance,
    this._then,
  );

  final Query$UserFindOne _instance;

  final TRes Function(Query$UserFindOne) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userFindOne = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$UserFindOne(
        userFindOne: userFindOne == _undefined
            ? _instance.userFindOne
            : (userFindOne as Query$UserFindOne$userFindOne?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$UserFindOne$userFindOne<TRes> get userFindOne {
    final local$userFindOne = _instance.userFindOne;
    return local$userFindOne == null
        ? CopyWith$Query$UserFindOne$userFindOne.stub(_then(_instance))
        : CopyWith$Query$UserFindOne$userFindOne(
            local$userFindOne, (e) => call(userFindOne: e));
  }
}

class _CopyWithStubImpl$Query$UserFindOne<TRes>
    implements CopyWith$Query$UserFindOne<TRes> {
  _CopyWithStubImpl$Query$UserFindOne(this._res);

  TRes _res;

  call({
    Query$UserFindOne$userFindOne? userFindOne,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$UserFindOne$userFindOne<TRes> get userFindOne =>
      CopyWith$Query$UserFindOne$userFindOne.stub(_res);
}

const documentNodeQueryUserFindOne = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'UserFindOne'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userFindUniqueArgs')),
        type: NamedTypeNode(
          name: NameNode(value: 'UserFindUniqueArgs'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'userFindOne'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userFindUniqueArgs'),
            value: VariableNode(name: NameNode(value: 'userFindUniqueArgs')),
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
            name: NameNode(value: 'claimedRewards'),
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
                name: NameNode(value: 'name'),
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
Query$UserFindOne _parserFn$Query$UserFindOne(Map<String, dynamic> data) =>
    Query$UserFindOne.fromJson(data);
typedef OnQueryComplete$Query$UserFindOne = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$UserFindOne?,
);

class Options$Query$UserFindOne
    extends graphql.QueryOptions<Query$UserFindOne> {
  Options$Query$UserFindOne({
    String? operationName,
    required Variables$Query$UserFindOne variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$UserFindOne? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$UserFindOne? onComplete,
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
                    data == null ? null : _parserFn$Query$UserFindOne(data),
                  ),
          onError: onError,
          document: documentNodeQueryUserFindOne,
          parserFn: _parserFn$Query$UserFindOne,
        );

  final OnQueryComplete$Query$UserFindOne? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$UserFindOne
    extends graphql.WatchQueryOptions<Query$UserFindOne> {
  WatchOptions$Query$UserFindOne({
    String? operationName,
    required Variables$Query$UserFindOne variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$UserFindOne? typedOptimisticResult,
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
          document: documentNodeQueryUserFindOne,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$UserFindOne,
        );
}

class FetchMoreOptions$Query$UserFindOne extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$UserFindOne({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$UserFindOne variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryUserFindOne,
        );
}

extension ClientExtension$Query$UserFindOne on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$UserFindOne>> query$UserFindOne(
          Options$Query$UserFindOne options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$UserFindOne> watchQuery$UserFindOne(
          WatchOptions$Query$UserFindOne options) =>
      this.watchQuery(options);
  void writeQuery$UserFindOne({
    required Query$UserFindOne data,
    required Variables$Query$UserFindOne variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryUserFindOne),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$UserFindOne? readQuery$UserFindOne({
    required Variables$Query$UserFindOne variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryUserFindOne),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$UserFindOne.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$UserFindOne> useQuery$UserFindOne(
        Options$Query$UserFindOne options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$UserFindOne> useWatchQuery$UserFindOne(
        WatchOptions$Query$UserFindOne options) =>
    graphql_flutter.useWatchQuery(options);

class Query$UserFindOne$Widget
    extends graphql_flutter.Query<Query$UserFindOne> {
  Query$UserFindOne$Widget({
    widgets.Key? key,
    required Options$Query$UserFindOne options,
    required graphql_flutter.QueryBuilder<Query$UserFindOne> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$UserFindOne$userFindOne {
  Query$UserFindOne$userFindOne({
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
    this.claimedRewards,
    this.$__typename = 'User',
  });

  factory Query$UserFindOne$userFindOne.fromJson(Map<String, dynamic> json) {
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
    final l$claimedRewards = json['claimedRewards'];
    final l$$__typename = json['__typename'];
    return Query$UserFindOne$userFindOne(
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
          : Query$UserFindOne$userFindOne$referredBy.fromJson(
              (l$referredBy as Map<String, dynamic>)),
      $_count: Query$UserFindOne$userFindOne$_count.fromJson(
          (l$$_count as Map<String, dynamic>)),
      PointTransactions: (l$PointTransactions as List<dynamic>?)
          ?.map((e) => Query$UserFindOne$userFindOne$PointTransactions.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      claimedRewards: (l$claimedRewards as List<dynamic>?)
          ?.map((e) => Query$UserFindOne$userFindOne$claimedRewards.fromJson(
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

  final Query$UserFindOne$userFindOne$referredBy? referredBy;

  final Query$UserFindOne$userFindOne$_count $_count;

  final List<Query$UserFindOne$userFindOne$PointTransactions>?
      PointTransactions;

  final List<Query$UserFindOne$userFindOne$claimedRewards>? claimedRewards;

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
    final l$claimedRewards = claimedRewards;
    _resultData['claimedRewards'] =
        l$claimedRewards?.map((e) => e.toJson()).toList();
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
    final l$claimedRewards = claimedRewards;
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
      l$claimedRewards == null
          ? null
          : Object.hashAll(l$claimedRewards.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$UserFindOne$userFindOne) ||
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
    final l$claimedRewards = claimedRewards;
    final lOther$claimedRewards = other.claimedRewards;
    if (l$claimedRewards != null && lOther$claimedRewards != null) {
      if (l$claimedRewards.length != lOther$claimedRewards.length) {
        return false;
      }
      for (int i = 0; i < l$claimedRewards.length; i++) {
        final l$claimedRewards$entry = l$claimedRewards[i];
        final lOther$claimedRewards$entry = lOther$claimedRewards[i];
        if (l$claimedRewards$entry != lOther$claimedRewards$entry) {
          return false;
        }
      }
    } else if (l$claimedRewards != lOther$claimedRewards) {
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

extension UtilityExtension$Query$UserFindOne$userFindOne
    on Query$UserFindOne$userFindOne {
  CopyWith$Query$UserFindOne$userFindOne<Query$UserFindOne$userFindOne>
      get copyWith => CopyWith$Query$UserFindOne$userFindOne(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$UserFindOne$userFindOne<TRes> {
  factory CopyWith$Query$UserFindOne$userFindOne(
    Query$UserFindOne$userFindOne instance,
    TRes Function(Query$UserFindOne$userFindOne) then,
  ) = _CopyWithImpl$Query$UserFindOne$userFindOne;

  factory CopyWith$Query$UserFindOne$userFindOne.stub(TRes res) =
      _CopyWithStubImpl$Query$UserFindOne$userFindOne;

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
    Query$UserFindOne$userFindOne$referredBy? referredBy,
    Query$UserFindOne$userFindOne$_count? $_count,
    List<Query$UserFindOne$userFindOne$PointTransactions>? PointTransactions,
    List<Query$UserFindOne$userFindOne$claimedRewards>? claimedRewards,
    String? $__typename,
  });
  CopyWith$Query$UserFindOne$userFindOne$referredBy<TRes> get referredBy;
  CopyWith$Query$UserFindOne$userFindOne$_count<TRes> get $_count;
  TRes PointTransactions(
      Iterable<Query$UserFindOne$userFindOne$PointTransactions>? Function(
              Iterable<
                  CopyWith$Query$UserFindOne$userFindOne$PointTransactions<
                      Query$UserFindOne$userFindOne$PointTransactions>>?)
          _fn);
  TRes claimedRewards(
      Iterable<Query$UserFindOne$userFindOne$claimedRewards>? Function(
              Iterable<
                  CopyWith$Query$UserFindOne$userFindOne$claimedRewards<
                      Query$UserFindOne$userFindOne$claimedRewards>>?)
          _fn);
}

class _CopyWithImpl$Query$UserFindOne$userFindOne<TRes>
    implements CopyWith$Query$UserFindOne$userFindOne<TRes> {
  _CopyWithImpl$Query$UserFindOne$userFindOne(
    this._instance,
    this._then,
  );

  final Query$UserFindOne$userFindOne _instance;

  final TRes Function(Query$UserFindOne$userFindOne) _then;

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
    Object? claimedRewards = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$UserFindOne$userFindOne(
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
            : (referredBy as Query$UserFindOne$userFindOne$referredBy?),
        $_count: $_count == _undefined || $_count == null
            ? _instance.$_count
            : ($_count as Query$UserFindOne$userFindOne$_count),
        PointTransactions: PointTransactions == _undefined
            ? _instance.PointTransactions
            : (PointTransactions
                as List<Query$UserFindOne$userFindOne$PointTransactions>?),
        claimedRewards: claimedRewards == _undefined
            ? _instance.claimedRewards
            : (claimedRewards
                as List<Query$UserFindOne$userFindOne$claimedRewards>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$UserFindOne$userFindOne$referredBy<TRes> get referredBy {
    final local$referredBy = _instance.referredBy;
    return local$referredBy == null
        ? CopyWith$Query$UserFindOne$userFindOne$referredBy.stub(
            _then(_instance))
        : CopyWith$Query$UserFindOne$userFindOne$referredBy(
            local$referredBy, (e) => call(referredBy: e));
  }

  CopyWith$Query$UserFindOne$userFindOne$_count<TRes> get $_count {
    final local$$_count = _instance.$_count;
    return CopyWith$Query$UserFindOne$userFindOne$_count(
        local$$_count, (e) => call($_count: e));
  }

  TRes PointTransactions(
          Iterable<Query$UserFindOne$userFindOne$PointTransactions>? Function(
                  Iterable<
                      CopyWith$Query$UserFindOne$userFindOne$PointTransactions<
                          Query$UserFindOne$userFindOne$PointTransactions>>?)
              _fn) =>
      call(
          PointTransactions: _fn(_instance.PointTransactions?.map(
              (e) => CopyWith$Query$UserFindOne$userFindOne$PointTransactions(
                    e,
                    (i) => i,
                  )))?.toList());
  TRes claimedRewards(
          Iterable<Query$UserFindOne$userFindOne$claimedRewards>? Function(
                  Iterable<
                      CopyWith$Query$UserFindOne$userFindOne$claimedRewards<
                          Query$UserFindOne$userFindOne$claimedRewards>>?)
              _fn) =>
      call(
          claimedRewards: _fn(_instance.claimedRewards?.map(
              (e) => CopyWith$Query$UserFindOne$userFindOne$claimedRewards(
                    e,
                    (i) => i,
                  )))?.toList());
}

class _CopyWithStubImpl$Query$UserFindOne$userFindOne<TRes>
    implements CopyWith$Query$UserFindOne$userFindOne<TRes> {
  _CopyWithStubImpl$Query$UserFindOne$userFindOne(this._res);

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
    Query$UserFindOne$userFindOne$referredBy? referredBy,
    Query$UserFindOne$userFindOne$_count? $_count,
    List<Query$UserFindOne$userFindOne$PointTransactions>? PointTransactions,
    List<Query$UserFindOne$userFindOne$claimedRewards>? claimedRewards,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$UserFindOne$userFindOne$referredBy<TRes> get referredBy =>
      CopyWith$Query$UserFindOne$userFindOne$referredBy.stub(_res);
  CopyWith$Query$UserFindOne$userFindOne$_count<TRes> get $_count =>
      CopyWith$Query$UserFindOne$userFindOne$_count.stub(_res);
  PointTransactions(_fn) => _res;
  claimedRewards(_fn) => _res;
}

class Query$UserFindOne$userFindOne$referredBy {
  Query$UserFindOne$userFindOne$referredBy({
    required this.id,
    required this.firstName,
    this.lastName,
    this.$__typename = 'UserAbstract',
  });

  factory Query$UserFindOne$userFindOne$referredBy.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$$__typename = json['__typename'];
    return Query$UserFindOne$userFindOne$referredBy(
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
    if (!(other is Query$UserFindOne$userFindOne$referredBy) ||
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

extension UtilityExtension$Query$UserFindOne$userFindOne$referredBy
    on Query$UserFindOne$userFindOne$referredBy {
  CopyWith$Query$UserFindOne$userFindOne$referredBy<
          Query$UserFindOne$userFindOne$referredBy>
      get copyWith => CopyWith$Query$UserFindOne$userFindOne$referredBy(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$UserFindOne$userFindOne$referredBy<TRes> {
  factory CopyWith$Query$UserFindOne$userFindOne$referredBy(
    Query$UserFindOne$userFindOne$referredBy instance,
    TRes Function(Query$UserFindOne$userFindOne$referredBy) then,
  ) = _CopyWithImpl$Query$UserFindOne$userFindOne$referredBy;

  factory CopyWith$Query$UserFindOne$userFindOne$referredBy.stub(TRes res) =
      _CopyWithStubImpl$Query$UserFindOne$userFindOne$referredBy;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$UserFindOne$userFindOne$referredBy<TRes>
    implements CopyWith$Query$UserFindOne$userFindOne$referredBy<TRes> {
  _CopyWithImpl$Query$UserFindOne$userFindOne$referredBy(
    this._instance,
    this._then,
  );

  final Query$UserFindOne$userFindOne$referredBy _instance;

  final TRes Function(Query$UserFindOne$userFindOne$referredBy) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$UserFindOne$userFindOne$referredBy(
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

class _CopyWithStubImpl$Query$UserFindOne$userFindOne$referredBy<TRes>
    implements CopyWith$Query$UserFindOne$userFindOne$referredBy<TRes> {
  _CopyWithStubImpl$Query$UserFindOne$userFindOne$referredBy(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? $__typename,
  }) =>
      _res;
}

class Query$UserFindOne$userFindOne$_count {
  Query$UserFindOne$userFindOne$_count({
    required this.referredUsers,
    required this.claimedRewards,
    this.$__typename = 'UserCount',
  });

  factory Query$UserFindOne$userFindOne$_count.fromJson(
      Map<String, dynamic> json) {
    final l$referredUsers = json['referredUsers'];
    final l$claimedRewards = json['claimedRewards'];
    final l$$__typename = json['__typename'];
    return Query$UserFindOne$userFindOne$_count(
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
    if (!(other is Query$UserFindOne$userFindOne$_count) ||
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

extension UtilityExtension$Query$UserFindOne$userFindOne$_count
    on Query$UserFindOne$userFindOne$_count {
  CopyWith$Query$UserFindOne$userFindOne$_count<
          Query$UserFindOne$userFindOne$_count>
      get copyWith => CopyWith$Query$UserFindOne$userFindOne$_count(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$UserFindOne$userFindOne$_count<TRes> {
  factory CopyWith$Query$UserFindOne$userFindOne$_count(
    Query$UserFindOne$userFindOne$_count instance,
    TRes Function(Query$UserFindOne$userFindOne$_count) then,
  ) = _CopyWithImpl$Query$UserFindOne$userFindOne$_count;

  factory CopyWith$Query$UserFindOne$userFindOne$_count.stub(TRes res) =
      _CopyWithStubImpl$Query$UserFindOne$userFindOne$_count;

  TRes call({
    int? referredUsers,
    int? claimedRewards,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$UserFindOne$userFindOne$_count<TRes>
    implements CopyWith$Query$UserFindOne$userFindOne$_count<TRes> {
  _CopyWithImpl$Query$UserFindOne$userFindOne$_count(
    this._instance,
    this._then,
  );

  final Query$UserFindOne$userFindOne$_count _instance;

  final TRes Function(Query$UserFindOne$userFindOne$_count) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? referredUsers = _undefined,
    Object? claimedRewards = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$UserFindOne$userFindOne$_count(
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

class _CopyWithStubImpl$Query$UserFindOne$userFindOne$_count<TRes>
    implements CopyWith$Query$UserFindOne$userFindOne$_count<TRes> {
  _CopyWithStubImpl$Query$UserFindOne$userFindOne$_count(this._res);

  TRes _res;

  call({
    int? referredUsers,
    int? claimedRewards,
    String? $__typename,
  }) =>
      _res;
}

class Query$UserFindOne$userFindOne$PointTransactions {
  Query$UserFindOne$userFindOne$PointTransactions({
    required this.id,
    required this.transactionType,
    required this.createdAt,
    required this.amount,
    this.$__typename = 'PointTransaction',
  });

  factory Query$UserFindOne$userFindOne$PointTransactions.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$transactionType = json['transactionType'];
    final l$createdAt = json['createdAt'];
    final l$amount = json['amount'];
    final l$$__typename = json['__typename'];
    return Query$UserFindOne$userFindOne$PointTransactions(
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
    if (!(other is Query$UserFindOne$userFindOne$PointTransactions) ||
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

extension UtilityExtension$Query$UserFindOne$userFindOne$PointTransactions
    on Query$UserFindOne$userFindOne$PointTransactions {
  CopyWith$Query$UserFindOne$userFindOne$PointTransactions<
          Query$UserFindOne$userFindOne$PointTransactions>
      get copyWith => CopyWith$Query$UserFindOne$userFindOne$PointTransactions(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$UserFindOne$userFindOne$PointTransactions<TRes> {
  factory CopyWith$Query$UserFindOne$userFindOne$PointTransactions(
    Query$UserFindOne$userFindOne$PointTransactions instance,
    TRes Function(Query$UserFindOne$userFindOne$PointTransactions) then,
  ) = _CopyWithImpl$Query$UserFindOne$userFindOne$PointTransactions;

  factory CopyWith$Query$UserFindOne$userFindOne$PointTransactions.stub(
          TRes res) =
      _CopyWithStubImpl$Query$UserFindOne$userFindOne$PointTransactions;

  TRes call({
    int? id,
    Enum$TransactionType? transactionType,
    String? createdAt,
    double? amount,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$UserFindOne$userFindOne$PointTransactions<TRes>
    implements CopyWith$Query$UserFindOne$userFindOne$PointTransactions<TRes> {
  _CopyWithImpl$Query$UserFindOne$userFindOne$PointTransactions(
    this._instance,
    this._then,
  );

  final Query$UserFindOne$userFindOne$PointTransactions _instance;

  final TRes Function(Query$UserFindOne$userFindOne$PointTransactions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? transactionType = _undefined,
    Object? createdAt = _undefined,
    Object? amount = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$UserFindOne$userFindOne$PointTransactions(
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

class _CopyWithStubImpl$Query$UserFindOne$userFindOne$PointTransactions<TRes>
    implements CopyWith$Query$UserFindOne$userFindOne$PointTransactions<TRes> {
  _CopyWithStubImpl$Query$UserFindOne$userFindOne$PointTransactions(this._res);

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

class Query$UserFindOne$userFindOne$claimedRewards {
  Query$UserFindOne$userFindOne$claimedRewards({
    required this.id,
    required this.name,
    required this.createdAt,
    this.$__typename = 'Reward',
  });

  factory Query$UserFindOne$userFindOne$claimedRewards.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$UserFindOne$userFindOne$claimedRewards(
      id: (l$id as int),
      name: (l$name as String),
      createdAt: (l$createdAt as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final String createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$UserFindOne$userFindOne$claimedRewards) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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

extension UtilityExtension$Query$UserFindOne$userFindOne$claimedRewards
    on Query$UserFindOne$userFindOne$claimedRewards {
  CopyWith$Query$UserFindOne$userFindOne$claimedRewards<
          Query$UserFindOne$userFindOne$claimedRewards>
      get copyWith => CopyWith$Query$UserFindOne$userFindOne$claimedRewards(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$UserFindOne$userFindOne$claimedRewards<TRes> {
  factory CopyWith$Query$UserFindOne$userFindOne$claimedRewards(
    Query$UserFindOne$userFindOne$claimedRewards instance,
    TRes Function(Query$UserFindOne$userFindOne$claimedRewards) then,
  ) = _CopyWithImpl$Query$UserFindOne$userFindOne$claimedRewards;

  factory CopyWith$Query$UserFindOne$userFindOne$claimedRewards.stub(TRes res) =
      _CopyWithStubImpl$Query$UserFindOne$userFindOne$claimedRewards;

  TRes call({
    int? id,
    String? name,
    String? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$UserFindOne$userFindOne$claimedRewards<TRes>
    implements CopyWith$Query$UserFindOne$userFindOne$claimedRewards<TRes> {
  _CopyWithImpl$Query$UserFindOne$userFindOne$claimedRewards(
    this._instance,
    this._then,
  );

  final Query$UserFindOne$userFindOne$claimedRewards _instance;

  final TRes Function(Query$UserFindOne$userFindOne$claimedRewards) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$UserFindOne$userFindOne$claimedRewards(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$UserFindOne$userFindOne$claimedRewards<TRes>
    implements CopyWith$Query$UserFindOne$userFindOne$claimedRewards<TRes> {
  _CopyWithStubImpl$Query$UserFindOne$userFindOne$claimedRewards(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? createdAt,
    String? $__typename,
  }) =>
      _res;
}
