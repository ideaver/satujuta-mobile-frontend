import '../../schema/generated/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$UserUpdateOne {
  factory Variables$Mutation$UserUpdateOne(
          {required Input$UserUpdateOneArgs userUpdateOneArgs}) =>
      Variables$Mutation$UserUpdateOne._({
        r'userUpdateOneArgs': userUpdateOneArgs,
      });

  Variables$Mutation$UserUpdateOne._(this._$data);

  factory Variables$Mutation$UserUpdateOne.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userUpdateOneArgs = data['userUpdateOneArgs'];
    result$data['userUpdateOneArgs'] = Input$UserUpdateOneArgs.fromJson(
        (l$userUpdateOneArgs as Map<String, dynamic>));
    return Variables$Mutation$UserUpdateOne._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$UserUpdateOneArgs get userUpdateOneArgs =>
      (_$data['userUpdateOneArgs'] as Input$UserUpdateOneArgs);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userUpdateOneArgs = userUpdateOneArgs;
    result$data['userUpdateOneArgs'] = l$userUpdateOneArgs.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UserUpdateOne<Variables$Mutation$UserUpdateOne>
      get copyWith => CopyWith$Variables$Mutation$UserUpdateOne(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UserUpdateOne) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userUpdateOneArgs = userUpdateOneArgs;
    final lOther$userUpdateOneArgs = other.userUpdateOneArgs;
    if (l$userUpdateOneArgs != lOther$userUpdateOneArgs) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userUpdateOneArgs = userUpdateOneArgs;
    return Object.hashAll([l$userUpdateOneArgs]);
  }
}

abstract class CopyWith$Variables$Mutation$UserUpdateOne<TRes> {
  factory CopyWith$Variables$Mutation$UserUpdateOne(
    Variables$Mutation$UserUpdateOne instance,
    TRes Function(Variables$Mutation$UserUpdateOne) then,
  ) = _CopyWithImpl$Variables$Mutation$UserUpdateOne;

  factory CopyWith$Variables$Mutation$UserUpdateOne.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UserUpdateOne;

  TRes call({Input$UserUpdateOneArgs? userUpdateOneArgs});
}

class _CopyWithImpl$Variables$Mutation$UserUpdateOne<TRes>
    implements CopyWith$Variables$Mutation$UserUpdateOne<TRes> {
  _CopyWithImpl$Variables$Mutation$UserUpdateOne(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UserUpdateOne _instance;

  final TRes Function(Variables$Mutation$UserUpdateOne) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? userUpdateOneArgs = _undefined}) =>
      _then(Variables$Mutation$UserUpdateOne._({
        ..._instance._$data,
        if (userUpdateOneArgs != _undefined && userUpdateOneArgs != null)
          'userUpdateOneArgs': (userUpdateOneArgs as Input$UserUpdateOneArgs),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UserUpdateOne<TRes>
    implements CopyWith$Variables$Mutation$UserUpdateOne<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UserUpdateOne(this._res);

  TRes _res;

  call({Input$UserUpdateOneArgs? userUpdateOneArgs}) => _res;
}

class Mutation$UserUpdateOne {
  Mutation$UserUpdateOne({
    required this.userUpdateOne,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UserUpdateOne.fromJson(Map<String, dynamic> json) {
    final l$userUpdateOne = json['userUpdateOne'];
    final l$$__typename = json['__typename'];
    return Mutation$UserUpdateOne(
      userUpdateOne: Mutation$UserUpdateOne$userUpdateOne.fromJson(
          (l$userUpdateOne as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UserUpdateOne$userUpdateOne userUpdateOne;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userUpdateOne = userUpdateOne;
    _resultData['userUpdateOne'] = l$userUpdateOne.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userUpdateOne = userUpdateOne;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$userUpdateOne,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UserUpdateOne) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userUpdateOne = userUpdateOne;
    final lOther$userUpdateOne = other.userUpdateOne;
    if (l$userUpdateOne != lOther$userUpdateOne) {
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

extension UtilityExtension$Mutation$UserUpdateOne on Mutation$UserUpdateOne {
  CopyWith$Mutation$UserUpdateOne<Mutation$UserUpdateOne> get copyWith =>
      CopyWith$Mutation$UserUpdateOne(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UserUpdateOne<TRes> {
  factory CopyWith$Mutation$UserUpdateOne(
    Mutation$UserUpdateOne instance,
    TRes Function(Mutation$UserUpdateOne) then,
  ) = _CopyWithImpl$Mutation$UserUpdateOne;

  factory CopyWith$Mutation$UserUpdateOne.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UserUpdateOne;

  TRes call({
    Mutation$UserUpdateOne$userUpdateOne? userUpdateOne,
    String? $__typename,
  });
  CopyWith$Mutation$UserUpdateOne$userUpdateOne<TRes> get userUpdateOne;
}

class _CopyWithImpl$Mutation$UserUpdateOne<TRes>
    implements CopyWith$Mutation$UserUpdateOne<TRes> {
  _CopyWithImpl$Mutation$UserUpdateOne(
    this._instance,
    this._then,
  );

  final Mutation$UserUpdateOne _instance;

  final TRes Function(Mutation$UserUpdateOne) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userUpdateOne = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UserUpdateOne(
        userUpdateOne: userUpdateOne == _undefined || userUpdateOne == null
            ? _instance.userUpdateOne
            : (userUpdateOne as Mutation$UserUpdateOne$userUpdateOne),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$UserUpdateOne$userUpdateOne<TRes> get userUpdateOne {
    final local$userUpdateOne = _instance.userUpdateOne;
    return CopyWith$Mutation$UserUpdateOne$userUpdateOne(
        local$userUpdateOne, (e) => call(userUpdateOne: e));
  }
}

class _CopyWithStubImpl$Mutation$UserUpdateOne<TRes>
    implements CopyWith$Mutation$UserUpdateOne<TRes> {
  _CopyWithStubImpl$Mutation$UserUpdateOne(this._res);

  TRes _res;

  call({
    Mutation$UserUpdateOne$userUpdateOne? userUpdateOne,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$UserUpdateOne$userUpdateOne<TRes> get userUpdateOne =>
      CopyWith$Mutation$UserUpdateOne$userUpdateOne.stub(_res);
}

const documentNodeMutationUserUpdateOne = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UserUpdateOne'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userUpdateOneArgs')),
        type: NamedTypeNode(
          name: NameNode(value: 'UserUpdateOneArgs'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'userUpdateOne'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userUpdateOneArgs'),
            value: VariableNode(name: NameNode(value: 'userUpdateOneArgs')),
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
            name: NameNode(value: 'theme'),
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
]);
Mutation$UserUpdateOne _parserFn$Mutation$UserUpdateOne(
        Map<String, dynamic> data) =>
    Mutation$UserUpdateOne.fromJson(data);
typedef OnMutationCompleted$Mutation$UserUpdateOne = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UserUpdateOne?,
);

class Options$Mutation$UserUpdateOne
    extends graphql.MutationOptions<Mutation$UserUpdateOne> {
  Options$Mutation$UserUpdateOne({
    String? operationName,
    required Variables$Mutation$UserUpdateOne variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UserUpdateOne? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UserUpdateOne? onCompleted,
    graphql.OnMutationUpdate<Mutation$UserUpdateOne>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$UserUpdateOne(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUserUpdateOne,
          parserFn: _parserFn$Mutation$UserUpdateOne,
        );

  final OnMutationCompleted$Mutation$UserUpdateOne? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UserUpdateOne
    extends graphql.WatchQueryOptions<Mutation$UserUpdateOne> {
  WatchOptions$Mutation$UserUpdateOne({
    String? operationName,
    required Variables$Mutation$UserUpdateOne variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UserUpdateOne? typedOptimisticResult,
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
          document: documentNodeMutationUserUpdateOne,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UserUpdateOne,
        );
}

extension ClientExtension$Mutation$UserUpdateOne on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UserUpdateOne>> mutate$UserUpdateOne(
          Options$Mutation$UserUpdateOne options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$UserUpdateOne> watchMutation$UserUpdateOne(
          WatchOptions$Mutation$UserUpdateOne options) =>
      this.watchMutation(options);
}

class Mutation$UserUpdateOne$HookResult {
  Mutation$UserUpdateOne$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UserUpdateOne runMutation;

  final graphql.QueryResult<Mutation$UserUpdateOne> result;
}

Mutation$UserUpdateOne$HookResult useMutation$UserUpdateOne(
    [WidgetOptions$Mutation$UserUpdateOne? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UserUpdateOne());
  return Mutation$UserUpdateOne$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UserUpdateOne> useWatchMutation$UserUpdateOne(
        WatchOptions$Mutation$UserUpdateOne options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UserUpdateOne
    extends graphql.MutationOptions<Mutation$UserUpdateOne> {
  WidgetOptions$Mutation$UserUpdateOne({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UserUpdateOne? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UserUpdateOne? onCompleted,
    graphql.OnMutationUpdate<Mutation$UserUpdateOne>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$UserUpdateOne(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUserUpdateOne,
          parserFn: _parserFn$Mutation$UserUpdateOne,
        );

  final OnMutationCompleted$Mutation$UserUpdateOne? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UserUpdateOne
    = graphql.MultiSourceResult<Mutation$UserUpdateOne> Function(
  Variables$Mutation$UserUpdateOne, {
  Object? optimisticResult,
  Mutation$UserUpdateOne? typedOptimisticResult,
});
typedef Builder$Mutation$UserUpdateOne = widgets.Widget Function(
  RunMutation$Mutation$UserUpdateOne,
  graphql.QueryResult<Mutation$UserUpdateOne>?,
);

class Mutation$UserUpdateOne$Widget
    extends graphql_flutter.Mutation<Mutation$UserUpdateOne> {
  Mutation$UserUpdateOne$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UserUpdateOne? options,
    required Builder$Mutation$UserUpdateOne builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UserUpdateOne(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$UserUpdateOne$userUpdateOne {
  Mutation$UserUpdateOne$userUpdateOne({
    required this.id,
    required this.firstName,
    this.lastName,
    required this.email,
    required this.userRole,
    required this.userType,
    this.avatarUrl,
    required this.whatsappNumber,
    required this.referralCode,
    required this.status,
    this.schoolId,
    required this.createdAt,
    required this.updatedAt,
    required this.theme,
    this.$__typename = 'User',
  });

  factory Mutation$UserUpdateOne$userUpdateOne.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$email = json['email'];
    final l$userRole = json['userRole'];
    final l$userType = json['userType'];
    final l$avatarUrl = json['avatarUrl'];
    final l$whatsappNumber = json['whatsappNumber'];
    final l$referralCode = json['referralCode'];
    final l$status = json['status'];
    final l$schoolId = json['schoolId'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$theme = json['theme'];
    final l$$__typename = json['__typename'];
    return Mutation$UserUpdateOne$userUpdateOne(
      id: (l$id as String),
      firstName: (l$firstName as String),
      lastName: (l$lastName as String?),
      email: (l$email as String),
      userRole: fromJson$Enum$UserRole((l$userRole as String)),
      userType: fromJson$Enum$UserType((l$userType as String)),
      avatarUrl: (l$avatarUrl as String?),
      whatsappNumber: (l$whatsappNumber as String),
      referralCode: (l$referralCode as String),
      status: fromJson$Enum$UserStatus((l$status as String)),
      schoolId: (l$schoolId as int?),
      createdAt: (l$createdAt as String),
      updatedAt: (l$updatedAt as String),
      theme: fromJson$Enum$Theme((l$theme as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String firstName;

  final String? lastName;

  final String email;

  final Enum$UserRole userRole;

  final Enum$UserType userType;

  final String? avatarUrl;

  final String whatsappNumber;

  final String referralCode;

  final Enum$UserStatus status;

  final int? schoolId;

  final String createdAt;

  final String updatedAt;

  final Enum$Theme theme;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$userRole = userRole;
    _resultData['userRole'] = toJson$Enum$UserRole(l$userRole);
    final l$userType = userType;
    _resultData['userType'] = toJson$Enum$UserType(l$userType);
    final l$avatarUrl = avatarUrl;
    _resultData['avatarUrl'] = l$avatarUrl;
    final l$whatsappNumber = whatsappNumber;
    _resultData['whatsappNumber'] = l$whatsappNumber;
    final l$referralCode = referralCode;
    _resultData['referralCode'] = l$referralCode;
    final l$status = status;
    _resultData['status'] = toJson$Enum$UserStatus(l$status);
    final l$schoolId = schoolId;
    _resultData['schoolId'] = l$schoolId;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$theme = theme;
    _resultData['theme'] = toJson$Enum$Theme(l$theme);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$email = email;
    final l$userRole = userRole;
    final l$userType = userType;
    final l$avatarUrl = avatarUrl;
    final l$whatsappNumber = whatsappNumber;
    final l$referralCode = referralCode;
    final l$status = status;
    final l$schoolId = schoolId;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$theme = theme;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firstName,
      l$lastName,
      l$email,
      l$userRole,
      l$userType,
      l$avatarUrl,
      l$whatsappNumber,
      l$referralCode,
      l$status,
      l$schoolId,
      l$createdAt,
      l$updatedAt,
      l$theme,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UserUpdateOne$userUpdateOne) ||
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
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
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
    final l$avatarUrl = avatarUrl;
    final lOther$avatarUrl = other.avatarUrl;
    if (l$avatarUrl != lOther$avatarUrl) {
      return false;
    }
    final l$whatsappNumber = whatsappNumber;
    final lOther$whatsappNumber = other.whatsappNumber;
    if (l$whatsappNumber != lOther$whatsappNumber) {
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
    final l$theme = theme;
    final lOther$theme = other.theme;
    if (l$theme != lOther$theme) {
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

extension UtilityExtension$Mutation$UserUpdateOne$userUpdateOne
    on Mutation$UserUpdateOne$userUpdateOne {
  CopyWith$Mutation$UserUpdateOne$userUpdateOne<
          Mutation$UserUpdateOne$userUpdateOne>
      get copyWith => CopyWith$Mutation$UserUpdateOne$userUpdateOne(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UserUpdateOne$userUpdateOne<TRes> {
  factory CopyWith$Mutation$UserUpdateOne$userUpdateOne(
    Mutation$UserUpdateOne$userUpdateOne instance,
    TRes Function(Mutation$UserUpdateOne$userUpdateOne) then,
  ) = _CopyWithImpl$Mutation$UserUpdateOne$userUpdateOne;

  factory CopyWith$Mutation$UserUpdateOne$userUpdateOne.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UserUpdateOne$userUpdateOne;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    Enum$UserRole? userRole,
    Enum$UserType? userType,
    String? avatarUrl,
    String? whatsappNumber,
    String? referralCode,
    Enum$UserStatus? status,
    int? schoolId,
    String? createdAt,
    String? updatedAt,
    Enum$Theme? theme,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UserUpdateOne$userUpdateOne<TRes>
    implements CopyWith$Mutation$UserUpdateOne$userUpdateOne<TRes> {
  _CopyWithImpl$Mutation$UserUpdateOne$userUpdateOne(
    this._instance,
    this._then,
  );

  final Mutation$UserUpdateOne$userUpdateOne _instance;

  final TRes Function(Mutation$UserUpdateOne$userUpdateOne) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? email = _undefined,
    Object? userRole = _undefined,
    Object? userType = _undefined,
    Object? avatarUrl = _undefined,
    Object? whatsappNumber = _undefined,
    Object? referralCode = _undefined,
    Object? status = _undefined,
    Object? schoolId = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? theme = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UserUpdateOne$userUpdateOne(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        firstName: firstName == _undefined || firstName == null
            ? _instance.firstName
            : (firstName as String),
        lastName:
            lastName == _undefined ? _instance.lastName : (lastName as String?),
        email: email == _undefined || email == null
            ? _instance.email
            : (email as String),
        userRole: userRole == _undefined || userRole == null
            ? _instance.userRole
            : (userRole as Enum$UserRole),
        userType: userType == _undefined || userType == null
            ? _instance.userType
            : (userType as Enum$UserType),
        avatarUrl: avatarUrl == _undefined
            ? _instance.avatarUrl
            : (avatarUrl as String?),
        whatsappNumber: whatsappNumber == _undefined || whatsappNumber == null
            ? _instance.whatsappNumber
            : (whatsappNumber as String),
        referralCode: referralCode == _undefined || referralCode == null
            ? _instance.referralCode
            : (referralCode as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$UserStatus),
        schoolId:
            schoolId == _undefined ? _instance.schoolId : (schoolId as int?),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as String),
        theme: theme == _undefined || theme == null
            ? _instance.theme
            : (theme as Enum$Theme),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UserUpdateOne$userUpdateOne<TRes>
    implements CopyWith$Mutation$UserUpdateOne$userUpdateOne<TRes> {
  _CopyWithStubImpl$Mutation$UserUpdateOne$userUpdateOne(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    Enum$UserRole? userRole,
    Enum$UserType? userType,
    String? avatarUrl,
    String? whatsappNumber,
    String? referralCode,
    Enum$UserStatus? status,
    int? schoolId,
    String? createdAt,
    String? updatedAt,
    Enum$Theme? theme,
    String? $__typename,
  }) =>
      _res;
}
