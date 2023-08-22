import '../../schema/generated/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$UserCreate {
  factory Variables$Mutation$UserCreate(
          {required Input$UserCreateArgs userCreateArgs}) =>
      Variables$Mutation$UserCreate._({
        r'userCreateArgs': userCreateArgs,
      });

  Variables$Mutation$UserCreate._(this._$data);

  factory Variables$Mutation$UserCreate.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userCreateArgs = data['userCreateArgs'];
    result$data['userCreateArgs'] = Input$UserCreateArgs.fromJson(
        (l$userCreateArgs as Map<String, dynamic>));
    return Variables$Mutation$UserCreate._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$UserCreateArgs get userCreateArgs =>
      (_$data['userCreateArgs'] as Input$UserCreateArgs);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userCreateArgs = userCreateArgs;
    result$data['userCreateArgs'] = l$userCreateArgs.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UserCreate<Variables$Mutation$UserCreate>
      get copyWith => CopyWith$Variables$Mutation$UserCreate(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UserCreate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userCreateArgs = userCreateArgs;
    final lOther$userCreateArgs = other.userCreateArgs;
    if (l$userCreateArgs != lOther$userCreateArgs) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userCreateArgs = userCreateArgs;
    return Object.hashAll([l$userCreateArgs]);
  }
}

abstract class CopyWith$Variables$Mutation$UserCreate<TRes> {
  factory CopyWith$Variables$Mutation$UserCreate(
    Variables$Mutation$UserCreate instance,
    TRes Function(Variables$Mutation$UserCreate) then,
  ) = _CopyWithImpl$Variables$Mutation$UserCreate;

  factory CopyWith$Variables$Mutation$UserCreate.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UserCreate;

  TRes call({Input$UserCreateArgs? userCreateArgs});
}

class _CopyWithImpl$Variables$Mutation$UserCreate<TRes>
    implements CopyWith$Variables$Mutation$UserCreate<TRes> {
  _CopyWithImpl$Variables$Mutation$UserCreate(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UserCreate _instance;

  final TRes Function(Variables$Mutation$UserCreate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? userCreateArgs = _undefined}) =>
      _then(Variables$Mutation$UserCreate._({
        ..._instance._$data,
        if (userCreateArgs != _undefined && userCreateArgs != null)
          'userCreateArgs': (userCreateArgs as Input$UserCreateArgs),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UserCreate<TRes>
    implements CopyWith$Variables$Mutation$UserCreate<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UserCreate(this._res);

  TRes _res;

  call({Input$UserCreateArgs? userCreateArgs}) => _res;
}

class Mutation$UserCreate {
  Mutation$UserCreate({
    this.userCreateOne,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UserCreate.fromJson(Map<String, dynamic> json) {
    final l$userCreateOne = json['userCreateOne'];
    final l$$__typename = json['__typename'];
    return Mutation$UserCreate(
      userCreateOne: l$userCreateOne == null
          ? null
          : Mutation$UserCreate$userCreateOne.fromJson(
              (l$userCreateOne as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UserCreate$userCreateOne? userCreateOne;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userCreateOne = userCreateOne;
    _resultData['userCreateOne'] = l$userCreateOne?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userCreateOne = userCreateOne;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$userCreateOne,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UserCreate) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$userCreateOne = userCreateOne;
    final lOther$userCreateOne = other.userCreateOne;
    if (l$userCreateOne != lOther$userCreateOne) {
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

extension UtilityExtension$Mutation$UserCreate on Mutation$UserCreate {
  CopyWith$Mutation$UserCreate<Mutation$UserCreate> get copyWith =>
      CopyWith$Mutation$UserCreate(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UserCreate<TRes> {
  factory CopyWith$Mutation$UserCreate(
    Mutation$UserCreate instance,
    TRes Function(Mutation$UserCreate) then,
  ) = _CopyWithImpl$Mutation$UserCreate;

  factory CopyWith$Mutation$UserCreate.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UserCreate;

  TRes call({
    Mutation$UserCreate$userCreateOne? userCreateOne,
    String? $__typename,
  });
  CopyWith$Mutation$UserCreate$userCreateOne<TRes> get userCreateOne;
}

class _CopyWithImpl$Mutation$UserCreate<TRes>
    implements CopyWith$Mutation$UserCreate<TRes> {
  _CopyWithImpl$Mutation$UserCreate(
    this._instance,
    this._then,
  );

  final Mutation$UserCreate _instance;

  final TRes Function(Mutation$UserCreate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userCreateOne = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UserCreate(
        userCreateOne: userCreateOne == _undefined
            ? _instance.userCreateOne
            : (userCreateOne as Mutation$UserCreate$userCreateOne?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$UserCreate$userCreateOne<TRes> get userCreateOne {
    final local$userCreateOne = _instance.userCreateOne;
    return local$userCreateOne == null
        ? CopyWith$Mutation$UserCreate$userCreateOne.stub(_then(_instance))
        : CopyWith$Mutation$UserCreate$userCreateOne(
            local$userCreateOne, (e) => call(userCreateOne: e));
  }
}

class _CopyWithStubImpl$Mutation$UserCreate<TRes>
    implements CopyWith$Mutation$UserCreate<TRes> {
  _CopyWithStubImpl$Mutation$UserCreate(this._res);

  TRes _res;

  call({
    Mutation$UserCreate$userCreateOne? userCreateOne,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$UserCreate$userCreateOne<TRes> get userCreateOne =>
      CopyWith$Mutation$UserCreate$userCreateOne.stub(_res);
}

const documentNodeMutationUserCreate = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UserCreate'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userCreateArgs')),
        type: NamedTypeNode(
          name: NameNode(value: 'UserCreateArgs'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'userCreateOne'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userCreateArgs'),
            value: VariableNode(name: NameNode(value: 'userCreateArgs')),
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
            name: NameNode(value: 'school'),
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
                name: NameNode(value: 'addressId'),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'accounts'),
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
                name: NameNode(value: 'accountNumber'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'accountCategory'),
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
            name: NameNode(value: 'orders'),
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
                name: NameNode(value: 'invoice'),
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
            name: NameNode(value: 'address'),
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
                name: NameNode(value: 'subdistrict'),
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
                    name: NameNode(value: 'postalCode'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'district'),
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
                        name: NameNode(value: 'city'),
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
                            name: NameNode(value: 'province'),
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
Mutation$UserCreate _parserFn$Mutation$UserCreate(Map<String, dynamic> data) =>
    Mutation$UserCreate.fromJson(data);
typedef OnMutationCompleted$Mutation$UserCreate = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UserCreate?,
);

class Options$Mutation$UserCreate
    extends graphql.MutationOptions<Mutation$UserCreate> {
  Options$Mutation$UserCreate({
    String? operationName,
    required Variables$Mutation$UserCreate variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UserCreate? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UserCreate? onCompleted,
    graphql.OnMutationUpdate<Mutation$UserCreate>? update,
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
                    data == null ? null : _parserFn$Mutation$UserCreate(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUserCreate,
          parserFn: _parserFn$Mutation$UserCreate,
        );

  final OnMutationCompleted$Mutation$UserCreate? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UserCreate
    extends graphql.WatchQueryOptions<Mutation$UserCreate> {
  WatchOptions$Mutation$UserCreate({
    String? operationName,
    required Variables$Mutation$UserCreate variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UserCreate? typedOptimisticResult,
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
          document: documentNodeMutationUserCreate,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UserCreate,
        );
}

extension ClientExtension$Mutation$UserCreate on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UserCreate>> mutate$UserCreate(
          Options$Mutation$UserCreate options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$UserCreate> watchMutation$UserCreate(
          WatchOptions$Mutation$UserCreate options) =>
      this.watchMutation(options);
}

class Mutation$UserCreate$HookResult {
  Mutation$UserCreate$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UserCreate runMutation;

  final graphql.QueryResult<Mutation$UserCreate> result;
}

Mutation$UserCreate$HookResult useMutation$UserCreate(
    [WidgetOptions$Mutation$UserCreate? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UserCreate());
  return Mutation$UserCreate$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UserCreate> useWatchMutation$UserCreate(
        WatchOptions$Mutation$UserCreate options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UserCreate
    extends graphql.MutationOptions<Mutation$UserCreate> {
  WidgetOptions$Mutation$UserCreate({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UserCreate? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UserCreate? onCompleted,
    graphql.OnMutationUpdate<Mutation$UserCreate>? update,
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
                    data == null ? null : _parserFn$Mutation$UserCreate(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUserCreate,
          parserFn: _parserFn$Mutation$UserCreate,
        );

  final OnMutationCompleted$Mutation$UserCreate? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UserCreate
    = graphql.MultiSourceResult<Mutation$UserCreate> Function(
  Variables$Mutation$UserCreate, {
  Object? optimisticResult,
  Mutation$UserCreate? typedOptimisticResult,
});
typedef Builder$Mutation$UserCreate = widgets.Widget Function(
  RunMutation$Mutation$UserCreate,
  graphql.QueryResult<Mutation$UserCreate>?,
);

class Mutation$UserCreate$Widget
    extends graphql_flutter.Mutation<Mutation$UserCreate> {
  Mutation$UserCreate$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UserCreate? options,
    required Builder$Mutation$UserCreate builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UserCreate(),
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

class Mutation$UserCreate$userCreateOne {
  Mutation$UserCreate$userCreateOne({
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
    this.school,
    this.referredBy,
    this.accounts,
    this.orders,
    required this.address,
    this.$__typename = 'User',
  });

  factory Mutation$UserCreate$userCreateOne.fromJson(
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
    final l$school = json['school'];
    final l$referredBy = json['referredBy'];
    final l$accounts = json['accounts'];
    final l$orders = json['orders'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Mutation$UserCreate$userCreateOne(
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
      school: l$school == null
          ? null
          : Mutation$UserCreate$userCreateOne$school.fromJson(
              (l$school as Map<String, dynamic>)),
      referredBy: l$referredBy == null
          ? null
          : Mutation$UserCreate$userCreateOne$referredBy.fromJson(
              (l$referredBy as Map<String, dynamic>)),
      accounts: (l$accounts as List<dynamic>?)
          ?.map((e) => Mutation$UserCreate$userCreateOne$accounts.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      orders: (l$orders as List<dynamic>?)
          ?.map((e) => Mutation$UserCreate$userCreateOne$orders.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      address: Mutation$UserCreate$userCreateOne$address.fromJson(
          (l$address as Map<String, dynamic>)),
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

  final Mutation$UserCreate$userCreateOne$school? school;

  final Mutation$UserCreate$userCreateOne$referredBy? referredBy;

  final List<Mutation$UserCreate$userCreateOne$accounts>? accounts;

  final List<Mutation$UserCreate$userCreateOne$orders>? orders;

  final Mutation$UserCreate$userCreateOne$address address;

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
    final l$school = school;
    _resultData['school'] = l$school?.toJson();
    final l$referredBy = referredBy;
    _resultData['referredBy'] = l$referredBy?.toJson();
    final l$accounts = accounts;
    _resultData['accounts'] = l$accounts?.map((e) => e.toJson()).toList();
    final l$orders = orders;
    _resultData['orders'] = l$orders?.map((e) => e.toJson()).toList();
    final l$address = address;
    _resultData['address'] = l$address.toJson();
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
    final l$school = school;
    final l$referredBy = referredBy;
    final l$accounts = accounts;
    final l$orders = orders;
    final l$address = address;
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
      l$school,
      l$referredBy,
      l$accounts == null ? null : Object.hashAll(l$accounts.map((v) => v)),
      l$orders == null ? null : Object.hashAll(l$orders.map((v) => v)),
      l$address,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UserCreate$userCreateOne) ||
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
    final l$school = school;
    final lOther$school = other.school;
    if (l$school != lOther$school) {
      return false;
    }
    final l$referredBy = referredBy;
    final lOther$referredBy = other.referredBy;
    if (l$referredBy != lOther$referredBy) {
      return false;
    }
    final l$accounts = accounts;
    final lOther$accounts = other.accounts;
    if (l$accounts != null && lOther$accounts != null) {
      if (l$accounts.length != lOther$accounts.length) {
        return false;
      }
      for (int i = 0; i < l$accounts.length; i++) {
        final l$accounts$entry = l$accounts[i];
        final lOther$accounts$entry = lOther$accounts[i];
        if (l$accounts$entry != lOther$accounts$entry) {
          return false;
        }
      }
    } else if (l$accounts != lOther$accounts) {
      return false;
    }
    final l$orders = orders;
    final lOther$orders = other.orders;
    if (l$orders != null && lOther$orders != null) {
      if (l$orders.length != lOther$orders.length) {
        return false;
      }
      for (int i = 0; i < l$orders.length; i++) {
        final l$orders$entry = l$orders[i];
        final lOther$orders$entry = lOther$orders[i];
        if (l$orders$entry != lOther$orders$entry) {
          return false;
        }
      }
    } else if (l$orders != lOther$orders) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
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

extension UtilityExtension$Mutation$UserCreate$userCreateOne
    on Mutation$UserCreate$userCreateOne {
  CopyWith$Mutation$UserCreate$userCreateOne<Mutation$UserCreate$userCreateOne>
      get copyWith => CopyWith$Mutation$UserCreate$userCreateOne(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UserCreate$userCreateOne<TRes> {
  factory CopyWith$Mutation$UserCreate$userCreateOne(
    Mutation$UserCreate$userCreateOne instance,
    TRes Function(Mutation$UserCreate$userCreateOne) then,
  ) = _CopyWithImpl$Mutation$UserCreate$userCreateOne;

  factory CopyWith$Mutation$UserCreate$userCreateOne.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UserCreate$userCreateOne;

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
    Mutation$UserCreate$userCreateOne$school? school,
    Mutation$UserCreate$userCreateOne$referredBy? referredBy,
    List<Mutation$UserCreate$userCreateOne$accounts>? accounts,
    List<Mutation$UserCreate$userCreateOne$orders>? orders,
    Mutation$UserCreate$userCreateOne$address? address,
    String? $__typename,
  });
  CopyWith$Mutation$UserCreate$userCreateOne$school<TRes> get school;
  CopyWith$Mutation$UserCreate$userCreateOne$referredBy<TRes> get referredBy;
  TRes accounts(
      Iterable<Mutation$UserCreate$userCreateOne$accounts>? Function(
              Iterable<
                  CopyWith$Mutation$UserCreate$userCreateOne$accounts<
                      Mutation$UserCreate$userCreateOne$accounts>>?)
          _fn);
  TRes orders(
      Iterable<Mutation$UserCreate$userCreateOne$orders>? Function(
              Iterable<
                  CopyWith$Mutation$UserCreate$userCreateOne$orders<
                      Mutation$UserCreate$userCreateOne$orders>>?)
          _fn);
  CopyWith$Mutation$UserCreate$userCreateOne$address<TRes> get address;
}

class _CopyWithImpl$Mutation$UserCreate$userCreateOne<TRes>
    implements CopyWith$Mutation$UserCreate$userCreateOne<TRes> {
  _CopyWithImpl$Mutation$UserCreate$userCreateOne(
    this._instance,
    this._then,
  );

  final Mutation$UserCreate$userCreateOne _instance;

  final TRes Function(Mutation$UserCreate$userCreateOne) _then;

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
    Object? school = _undefined,
    Object? referredBy = _undefined,
    Object? accounts = _undefined,
    Object? orders = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UserCreate$userCreateOne(
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
        school: school == _undefined
            ? _instance.school
            : (school as Mutation$UserCreate$userCreateOne$school?),
        referredBy: referredBy == _undefined
            ? _instance.referredBy
            : (referredBy as Mutation$UserCreate$userCreateOne$referredBy?),
        accounts: accounts == _undefined
            ? _instance.accounts
            : (accounts as List<Mutation$UserCreate$userCreateOne$accounts>?),
        orders: orders == _undefined
            ? _instance.orders
            : (orders as List<Mutation$UserCreate$userCreateOne$orders>?),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as Mutation$UserCreate$userCreateOne$address),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$UserCreate$userCreateOne$school<TRes> get school {
    final local$school = _instance.school;
    return local$school == null
        ? CopyWith$Mutation$UserCreate$userCreateOne$school.stub(
            _then(_instance))
        : CopyWith$Mutation$UserCreate$userCreateOne$school(
            local$school, (e) => call(school: e));
  }

  CopyWith$Mutation$UserCreate$userCreateOne$referredBy<TRes> get referredBy {
    final local$referredBy = _instance.referredBy;
    return local$referredBy == null
        ? CopyWith$Mutation$UserCreate$userCreateOne$referredBy.stub(
            _then(_instance))
        : CopyWith$Mutation$UserCreate$userCreateOne$referredBy(
            local$referredBy, (e) => call(referredBy: e));
  }

  TRes accounts(
          Iterable<Mutation$UserCreate$userCreateOne$accounts>? Function(
                  Iterable<
                      CopyWith$Mutation$UserCreate$userCreateOne$accounts<
                          Mutation$UserCreate$userCreateOne$accounts>>?)
              _fn) =>
      call(
          accounts: _fn(_instance.accounts
              ?.map((e) => CopyWith$Mutation$UserCreate$userCreateOne$accounts(
                    e,
                    (i) => i,
                  )))?.toList());
  TRes orders(
          Iterable<Mutation$UserCreate$userCreateOne$orders>? Function(
                  Iterable<
                      CopyWith$Mutation$UserCreate$userCreateOne$orders<
                          Mutation$UserCreate$userCreateOne$orders>>?)
              _fn) =>
      call(
          orders: _fn(_instance.orders
              ?.map((e) => CopyWith$Mutation$UserCreate$userCreateOne$orders(
                    e,
                    (i) => i,
                  )))?.toList());
  CopyWith$Mutation$UserCreate$userCreateOne$address<TRes> get address {
    final local$address = _instance.address;
    return CopyWith$Mutation$UserCreate$userCreateOne$address(
        local$address, (e) => call(address: e));
  }
}

class _CopyWithStubImpl$Mutation$UserCreate$userCreateOne<TRes>
    implements CopyWith$Mutation$UserCreate$userCreateOne<TRes> {
  _CopyWithStubImpl$Mutation$UserCreate$userCreateOne(this._res);

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
    Mutation$UserCreate$userCreateOne$school? school,
    Mutation$UserCreate$userCreateOne$referredBy? referredBy,
    List<Mutation$UserCreate$userCreateOne$accounts>? accounts,
    List<Mutation$UserCreate$userCreateOne$orders>? orders,
    Mutation$UserCreate$userCreateOne$address? address,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$UserCreate$userCreateOne$school<TRes> get school =>
      CopyWith$Mutation$UserCreate$userCreateOne$school.stub(_res);
  CopyWith$Mutation$UserCreate$userCreateOne$referredBy<TRes> get referredBy =>
      CopyWith$Mutation$UserCreate$userCreateOne$referredBy.stub(_res);
  accounts(_fn) => _res;
  orders(_fn) => _res;
  CopyWith$Mutation$UserCreate$userCreateOne$address<TRes> get address =>
      CopyWith$Mutation$UserCreate$userCreateOne$address.stub(_res);
}

class Mutation$UserCreate$userCreateOne$school {
  Mutation$UserCreate$userCreateOne$school({
    required this.id,
    required this.name,
    required this.addressId,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'School',
  });

  factory Mutation$UserCreate$userCreateOne$school.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$addressId = json['addressId'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$UserCreate$userCreateOne$school(
      id: (l$id as int),
      name: (l$name as String),
      addressId: (l$addressId as int),
      createdAt: (l$createdAt as String),
      updatedAt: (l$updatedAt as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final int addressId;

  final String createdAt;

  final String updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$addressId = addressId;
    _resultData['addressId'] = l$addressId;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$addressId = addressId;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$addressId,
      l$createdAt,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UserCreate$userCreateOne$school) ||
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
    final l$addressId = addressId;
    final lOther$addressId = other.addressId;
    if (l$addressId != lOther$addressId) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UserCreate$userCreateOne$school
    on Mutation$UserCreate$userCreateOne$school {
  CopyWith$Mutation$UserCreate$userCreateOne$school<
          Mutation$UserCreate$userCreateOne$school>
      get copyWith => CopyWith$Mutation$UserCreate$userCreateOne$school(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UserCreate$userCreateOne$school<TRes> {
  factory CopyWith$Mutation$UserCreate$userCreateOne$school(
    Mutation$UserCreate$userCreateOne$school instance,
    TRes Function(Mutation$UserCreate$userCreateOne$school) then,
  ) = _CopyWithImpl$Mutation$UserCreate$userCreateOne$school;

  factory CopyWith$Mutation$UserCreate$userCreateOne$school.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$school;

  TRes call({
    int? id,
    String? name,
    int? addressId,
    String? createdAt,
    String? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UserCreate$userCreateOne$school<TRes>
    implements CopyWith$Mutation$UserCreate$userCreateOne$school<TRes> {
  _CopyWithImpl$Mutation$UserCreate$userCreateOne$school(
    this._instance,
    this._then,
  );

  final Mutation$UserCreate$userCreateOne$school _instance;

  final TRes Function(Mutation$UserCreate$userCreateOne$school) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? addressId = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UserCreate$userCreateOne$school(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        addressId: addressId == _undefined || addressId == null
            ? _instance.addressId
            : (addressId as int),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$school<TRes>
    implements CopyWith$Mutation$UserCreate$userCreateOne$school<TRes> {
  _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$school(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    int? addressId,
    String? createdAt,
    String? updatedAt,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$UserCreate$userCreateOne$referredBy {
  Mutation$UserCreate$userCreateOne$referredBy({
    required this.id,
    this.$__typename = 'UserAbstract',
  });

  factory Mutation$UserCreate$userCreateOne$referredBy.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$UserCreate$userCreateOne$referredBy(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UserCreate$userCreateOne$referredBy) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$UserCreate$userCreateOne$referredBy
    on Mutation$UserCreate$userCreateOne$referredBy {
  CopyWith$Mutation$UserCreate$userCreateOne$referredBy<
          Mutation$UserCreate$userCreateOne$referredBy>
      get copyWith => CopyWith$Mutation$UserCreate$userCreateOne$referredBy(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UserCreate$userCreateOne$referredBy<TRes> {
  factory CopyWith$Mutation$UserCreate$userCreateOne$referredBy(
    Mutation$UserCreate$userCreateOne$referredBy instance,
    TRes Function(Mutation$UserCreate$userCreateOne$referredBy) then,
  ) = _CopyWithImpl$Mutation$UserCreate$userCreateOne$referredBy;

  factory CopyWith$Mutation$UserCreate$userCreateOne$referredBy.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$referredBy;

  TRes call({
    String? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UserCreate$userCreateOne$referredBy<TRes>
    implements CopyWith$Mutation$UserCreate$userCreateOne$referredBy<TRes> {
  _CopyWithImpl$Mutation$UserCreate$userCreateOne$referredBy(
    this._instance,
    this._then,
  );

  final Mutation$UserCreate$userCreateOne$referredBy _instance;

  final TRes Function(Mutation$UserCreate$userCreateOne$referredBy) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UserCreate$userCreateOne$referredBy(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$referredBy<TRes>
    implements CopyWith$Mutation$UserCreate$userCreateOne$referredBy<TRes> {
  _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$referredBy(this._res);

  TRes _res;

  call({
    String? id,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$UserCreate$userCreateOne$accounts {
  Mutation$UserCreate$userCreateOne$accounts({
    required this.id,
    required this.name,
    this.accountNumber,
    required this.accountCategory,
    this.$__typename = 'Account',
  });

  factory Mutation$UserCreate$userCreateOne$accounts.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$accountNumber = json['accountNumber'];
    final l$accountCategory = json['accountCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$UserCreate$userCreateOne$accounts(
      id: (l$id as int),
      name: (l$name as String),
      accountNumber: (l$accountNumber as num?)?.toDouble(),
      accountCategory:
          fromJson$Enum$AccountCategory((l$accountCategory as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final double? accountNumber;

  final Enum$AccountCategory accountCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$accountNumber = accountNumber;
    _resultData['accountNumber'] = l$accountNumber;
    final l$accountCategory = accountCategory;
    _resultData['accountCategory'] =
        toJson$Enum$AccountCategory(l$accountCategory);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$accountNumber = accountNumber;
    final l$accountCategory = accountCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$accountNumber,
      l$accountCategory,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UserCreate$userCreateOne$accounts) ||
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
    final l$accountNumber = accountNumber;
    final lOther$accountNumber = other.accountNumber;
    if (l$accountNumber != lOther$accountNumber) {
      return false;
    }
    final l$accountCategory = accountCategory;
    final lOther$accountCategory = other.accountCategory;
    if (l$accountCategory != lOther$accountCategory) {
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

extension UtilityExtension$Mutation$UserCreate$userCreateOne$accounts
    on Mutation$UserCreate$userCreateOne$accounts {
  CopyWith$Mutation$UserCreate$userCreateOne$accounts<
          Mutation$UserCreate$userCreateOne$accounts>
      get copyWith => CopyWith$Mutation$UserCreate$userCreateOne$accounts(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UserCreate$userCreateOne$accounts<TRes> {
  factory CopyWith$Mutation$UserCreate$userCreateOne$accounts(
    Mutation$UserCreate$userCreateOne$accounts instance,
    TRes Function(Mutation$UserCreate$userCreateOne$accounts) then,
  ) = _CopyWithImpl$Mutation$UserCreate$userCreateOne$accounts;

  factory CopyWith$Mutation$UserCreate$userCreateOne$accounts.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$accounts;

  TRes call({
    int? id,
    String? name,
    double? accountNumber,
    Enum$AccountCategory? accountCategory,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UserCreate$userCreateOne$accounts<TRes>
    implements CopyWith$Mutation$UserCreate$userCreateOne$accounts<TRes> {
  _CopyWithImpl$Mutation$UserCreate$userCreateOne$accounts(
    this._instance,
    this._then,
  );

  final Mutation$UserCreate$userCreateOne$accounts _instance;

  final TRes Function(Mutation$UserCreate$userCreateOne$accounts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? accountNumber = _undefined,
    Object? accountCategory = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UserCreate$userCreateOne$accounts(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        accountNumber: accountNumber == _undefined
            ? _instance.accountNumber
            : (accountNumber as double?),
        accountCategory:
            accountCategory == _undefined || accountCategory == null
                ? _instance.accountCategory
                : (accountCategory as Enum$AccountCategory),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$accounts<TRes>
    implements CopyWith$Mutation$UserCreate$userCreateOne$accounts<TRes> {
  _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$accounts(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    double? accountNumber,
    Enum$AccountCategory? accountCategory,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$UserCreate$userCreateOne$orders {
  Mutation$UserCreate$userCreateOne$orders({
    required this.id,
    required this.invoice,
    this.$__typename = 'Order',
  });

  factory Mutation$UserCreate$userCreateOne$orders.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$invoice = json['invoice'];
    final l$$__typename = json['__typename'];
    return Mutation$UserCreate$userCreateOne$orders(
      id: (l$id as int),
      invoice: Mutation$UserCreate$userCreateOne$orders$invoice.fromJson(
          (l$invoice as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final Mutation$UserCreate$userCreateOne$orders$invoice invoice;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$invoice = invoice;
    _resultData['invoice'] = l$invoice.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$invoice = invoice;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$invoice,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UserCreate$userCreateOne$orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$invoice = invoice;
    final lOther$invoice = other.invoice;
    if (l$invoice != lOther$invoice) {
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

extension UtilityExtension$Mutation$UserCreate$userCreateOne$orders
    on Mutation$UserCreate$userCreateOne$orders {
  CopyWith$Mutation$UserCreate$userCreateOne$orders<
          Mutation$UserCreate$userCreateOne$orders>
      get copyWith => CopyWith$Mutation$UserCreate$userCreateOne$orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UserCreate$userCreateOne$orders<TRes> {
  factory CopyWith$Mutation$UserCreate$userCreateOne$orders(
    Mutation$UserCreate$userCreateOne$orders instance,
    TRes Function(Mutation$UserCreate$userCreateOne$orders) then,
  ) = _CopyWithImpl$Mutation$UserCreate$userCreateOne$orders;

  factory CopyWith$Mutation$UserCreate$userCreateOne$orders.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$orders;

  TRes call({
    int? id,
    Mutation$UserCreate$userCreateOne$orders$invoice? invoice,
    String? $__typename,
  });
  CopyWith$Mutation$UserCreate$userCreateOne$orders$invoice<TRes> get invoice;
}

class _CopyWithImpl$Mutation$UserCreate$userCreateOne$orders<TRes>
    implements CopyWith$Mutation$UserCreate$userCreateOne$orders<TRes> {
  _CopyWithImpl$Mutation$UserCreate$userCreateOne$orders(
    this._instance,
    this._then,
  );

  final Mutation$UserCreate$userCreateOne$orders _instance;

  final TRes Function(Mutation$UserCreate$userCreateOne$orders) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? invoice = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UserCreate$userCreateOne$orders(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        invoice: invoice == _undefined || invoice == null
            ? _instance.invoice
            : (invoice as Mutation$UserCreate$userCreateOne$orders$invoice),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$UserCreate$userCreateOne$orders$invoice<TRes> get invoice {
    final local$invoice = _instance.invoice;
    return CopyWith$Mutation$UserCreate$userCreateOne$orders$invoice(
        local$invoice, (e) => call(invoice: e));
  }
}

class _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$orders<TRes>
    implements CopyWith$Mutation$UserCreate$userCreateOne$orders<TRes> {
  _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$orders(this._res);

  TRes _res;

  call({
    int? id,
    Mutation$UserCreate$userCreateOne$orders$invoice? invoice,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$UserCreate$userCreateOne$orders$invoice<TRes> get invoice =>
      CopyWith$Mutation$UserCreate$userCreateOne$orders$invoice.stub(_res);
}

class Mutation$UserCreate$userCreateOne$orders$invoice {
  Mutation$UserCreate$userCreateOne$orders$invoice({
    required this.id,
    this.$__typename = 'Invoice',
  });

  factory Mutation$UserCreate$userCreateOne$orders$invoice.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$UserCreate$userCreateOne$orders$invoice(
      id: (l$id as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UserCreate$userCreateOne$orders$invoice) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$UserCreate$userCreateOne$orders$invoice
    on Mutation$UserCreate$userCreateOne$orders$invoice {
  CopyWith$Mutation$UserCreate$userCreateOne$orders$invoice<
          Mutation$UserCreate$userCreateOne$orders$invoice>
      get copyWith => CopyWith$Mutation$UserCreate$userCreateOne$orders$invoice(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UserCreate$userCreateOne$orders$invoice<TRes> {
  factory CopyWith$Mutation$UserCreate$userCreateOne$orders$invoice(
    Mutation$UserCreate$userCreateOne$orders$invoice instance,
    TRes Function(Mutation$UserCreate$userCreateOne$orders$invoice) then,
  ) = _CopyWithImpl$Mutation$UserCreate$userCreateOne$orders$invoice;

  factory CopyWith$Mutation$UserCreate$userCreateOne$orders$invoice.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$orders$invoice;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UserCreate$userCreateOne$orders$invoice<TRes>
    implements CopyWith$Mutation$UserCreate$userCreateOne$orders$invoice<TRes> {
  _CopyWithImpl$Mutation$UserCreate$userCreateOne$orders$invoice(
    this._instance,
    this._then,
  );

  final Mutation$UserCreate$userCreateOne$orders$invoice _instance;

  final TRes Function(Mutation$UserCreate$userCreateOne$orders$invoice) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UserCreate$userCreateOne$orders$invoice(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$orders$invoice<TRes>
    implements CopyWith$Mutation$UserCreate$userCreateOne$orders$invoice<TRes> {
  _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$orders$invoice(this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$UserCreate$userCreateOne$address {
  Mutation$UserCreate$userCreateOne$address({
    required this.id,
    required this.name,
    required this.subdistrict,
    this.$__typename = 'Address',
  });

  factory Mutation$UserCreate$userCreateOne$address.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$subdistrict = json['subdistrict'];
    final l$$__typename = json['__typename'];
    return Mutation$UserCreate$userCreateOne$address(
      id: (l$id as int),
      name: (l$name as String),
      subdistrict:
          Mutation$UserCreate$userCreateOne$address$subdistrict.fromJson(
              (l$subdistrict as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final Mutation$UserCreate$userCreateOne$address$subdistrict subdistrict;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$subdistrict = subdistrict;
    _resultData['subdistrict'] = l$subdistrict.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$subdistrict = subdistrict;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$subdistrict,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UserCreate$userCreateOne$address) ||
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
    final l$subdistrict = subdistrict;
    final lOther$subdistrict = other.subdistrict;
    if (l$subdistrict != lOther$subdistrict) {
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

extension UtilityExtension$Mutation$UserCreate$userCreateOne$address
    on Mutation$UserCreate$userCreateOne$address {
  CopyWith$Mutation$UserCreate$userCreateOne$address<
          Mutation$UserCreate$userCreateOne$address>
      get copyWith => CopyWith$Mutation$UserCreate$userCreateOne$address(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UserCreate$userCreateOne$address<TRes> {
  factory CopyWith$Mutation$UserCreate$userCreateOne$address(
    Mutation$UserCreate$userCreateOne$address instance,
    TRes Function(Mutation$UserCreate$userCreateOne$address) then,
  ) = _CopyWithImpl$Mutation$UserCreate$userCreateOne$address;

  factory CopyWith$Mutation$UserCreate$userCreateOne$address.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$address;

  TRes call({
    int? id,
    String? name,
    Mutation$UserCreate$userCreateOne$address$subdistrict? subdistrict,
    String? $__typename,
  });
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict<TRes>
      get subdistrict;
}

class _CopyWithImpl$Mutation$UserCreate$userCreateOne$address<TRes>
    implements CopyWith$Mutation$UserCreate$userCreateOne$address<TRes> {
  _CopyWithImpl$Mutation$UserCreate$userCreateOne$address(
    this._instance,
    this._then,
  );

  final Mutation$UserCreate$userCreateOne$address _instance;

  final TRes Function(Mutation$UserCreate$userCreateOne$address) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? subdistrict = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UserCreate$userCreateOne$address(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        subdistrict: subdistrict == _undefined || subdistrict == null
            ? _instance.subdistrict
            : (subdistrict
                as Mutation$UserCreate$userCreateOne$address$subdistrict),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict<TRes>
      get subdistrict {
    final local$subdistrict = _instance.subdistrict;
    return CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict(
        local$subdistrict, (e) => call(subdistrict: e));
  }
}

class _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$address<TRes>
    implements CopyWith$Mutation$UserCreate$userCreateOne$address<TRes> {
  _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$address(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    Mutation$UserCreate$userCreateOne$address$subdistrict? subdistrict,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict<TRes>
      get subdistrict =>
          CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict.stub(
              _res);
}

class Mutation$UserCreate$userCreateOne$address$subdistrict {
  Mutation$UserCreate$userCreateOne$address$subdistrict({
    required this.id,
    required this.name,
    required this.postalCode,
    required this.district,
    this.$__typename = 'Subdistrict',
  });

  factory Mutation$UserCreate$userCreateOne$address$subdistrict.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$postalCode = json['postalCode'];
    final l$district = json['district'];
    final l$$__typename = json['__typename'];
    return Mutation$UserCreate$userCreateOne$address$subdistrict(
      id: (l$id as int),
      name: (l$name as String),
      postalCode: (l$postalCode as String),
      district: Mutation$UserCreate$userCreateOne$address$subdistrict$district
          .fromJson((l$district as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final String postalCode;

  final Mutation$UserCreate$userCreateOne$address$subdistrict$district district;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$postalCode = postalCode;
    _resultData['postalCode'] = l$postalCode;
    final l$district = district;
    _resultData['district'] = l$district.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$postalCode = postalCode;
    final l$district = district;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$postalCode,
      l$district,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UserCreate$userCreateOne$address$subdistrict) ||
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
    final l$postalCode = postalCode;
    final lOther$postalCode = other.postalCode;
    if (l$postalCode != lOther$postalCode) {
      return false;
    }
    final l$district = district;
    final lOther$district = other.district;
    if (l$district != lOther$district) {
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

extension UtilityExtension$Mutation$UserCreate$userCreateOne$address$subdistrict
    on Mutation$UserCreate$userCreateOne$address$subdistrict {
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict<
          Mutation$UserCreate$userCreateOne$address$subdistrict>
      get copyWith =>
          CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict<
    TRes> {
  factory CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict(
    Mutation$UserCreate$userCreateOne$address$subdistrict instance,
    TRes Function(Mutation$UserCreate$userCreateOne$address$subdistrict) then,
  ) = _CopyWithImpl$Mutation$UserCreate$userCreateOne$address$subdistrict;

  factory CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$address$subdistrict;

  TRes call({
    int? id,
    String? name,
    String? postalCode,
    Mutation$UserCreate$userCreateOne$address$subdistrict$district? district,
    String? $__typename,
  });
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district<TRes>
      get district;
}

class _CopyWithImpl$Mutation$UserCreate$userCreateOne$address$subdistrict<TRes>
    implements
        CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict<TRes> {
  _CopyWithImpl$Mutation$UserCreate$userCreateOne$address$subdistrict(
    this._instance,
    this._then,
  );

  final Mutation$UserCreate$userCreateOne$address$subdistrict _instance;

  final TRes Function(Mutation$UserCreate$userCreateOne$address$subdistrict)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? postalCode = _undefined,
    Object? district = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UserCreate$userCreateOne$address$subdistrict(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        postalCode: postalCode == _undefined || postalCode == null
            ? _instance.postalCode
            : (postalCode as String),
        district: district == _undefined || district == null
            ? _instance.district
            : (district
                as Mutation$UserCreate$userCreateOne$address$subdistrict$district),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district<TRes>
      get district {
    final local$district = _instance.district;
    return CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district(
        local$district, (e) => call(district: e));
  }
}

class _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$address$subdistrict<
        TRes>
    implements
        CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict<TRes> {
  _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$address$subdistrict(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? postalCode,
    Mutation$UserCreate$userCreateOne$address$subdistrict$district? district,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district<TRes>
      get district =>
          CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district
              .stub(_res);
}

class Mutation$UserCreate$userCreateOne$address$subdistrict$district {
  Mutation$UserCreate$userCreateOne$address$subdistrict$district({
    required this.id,
    required this.name,
    required this.city,
    this.$__typename = 'District',
  });

  factory Mutation$UserCreate$userCreateOne$address$subdistrict$district.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$city = json['city'];
    final l$$__typename = json['__typename'];
    return Mutation$UserCreate$userCreateOne$address$subdistrict$district(
      id: (l$id as int),
      name: (l$name as String),
      city: Mutation$UserCreate$userCreateOne$address$subdistrict$district$city
          .fromJson((l$city as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final Mutation$UserCreate$userCreateOne$address$subdistrict$district$city
      city;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$city = city;
    _resultData['city'] = l$city.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$city = city;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$city,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$UserCreate$userCreateOne$address$subdistrict$district) ||
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
    final l$city = city;
    final lOther$city = other.city;
    if (l$city != lOther$city) {
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

extension UtilityExtension$Mutation$UserCreate$userCreateOne$address$subdistrict$district
    on Mutation$UserCreate$userCreateOne$address$subdistrict$district {
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district<
          Mutation$UserCreate$userCreateOne$address$subdistrict$district>
      get copyWith =>
          CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district<
    TRes> {
  factory CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district(
    Mutation$UserCreate$userCreateOne$address$subdistrict$district instance,
    TRes Function(
            Mutation$UserCreate$userCreateOne$address$subdistrict$district)
        then,
  ) = _CopyWithImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district;

  factory CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district;

  TRes call({
    int? id,
    String? name,
    Mutation$UserCreate$userCreateOne$address$subdistrict$district$city? city,
    String? $__typename,
  });
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city<
      TRes> get city;
}

class _CopyWithImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district<
        TRes>
    implements
        CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district<
            TRes> {
  _CopyWithImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district(
    this._instance,
    this._then,
  );

  final Mutation$UserCreate$userCreateOne$address$subdistrict$district
      _instance;

  final TRes Function(
      Mutation$UserCreate$userCreateOne$address$subdistrict$district) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? city = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UserCreate$userCreateOne$address$subdistrict$district(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        city: city == _undefined || city == null
            ? _instance.city
            : (city
                as Mutation$UserCreate$userCreateOne$address$subdistrict$district$city),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city<
      TRes> get city {
    final local$city = _instance.city;
    return CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city(
        local$city, (e) => call(city: e));
  }
}

class _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district<
        TRes>
    implements
        CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district<
            TRes> {
  _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    Mutation$UserCreate$userCreateOne$address$subdistrict$district$city? city,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city<
          TRes>
      get city =>
          CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city
              .stub(_res);
}

class Mutation$UserCreate$userCreateOne$address$subdistrict$district$city {
  Mutation$UserCreate$userCreateOne$address$subdistrict$district$city({
    required this.id,
    required this.name,
    required this.province,
    this.$__typename = 'City',
  });

  factory Mutation$UserCreate$userCreateOne$address$subdistrict$district$city.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$province = json['province'];
    final l$$__typename = json['__typename'];
    return Mutation$UserCreate$userCreateOne$address$subdistrict$district$city(
      id: (l$id as int),
      name: (l$name as String),
      province:
          Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province
              .fromJson((l$province as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province
      province;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$province = province;
    _resultData['province'] = l$province.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$province = province;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$province,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$UserCreate$userCreateOne$address$subdistrict$district$city) ||
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
    final l$province = province;
    final lOther$province = other.province;
    if (l$province != lOther$province) {
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

extension UtilityExtension$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city
    on Mutation$UserCreate$userCreateOne$address$subdistrict$district$city {
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city<
          Mutation$UserCreate$userCreateOne$address$subdistrict$district$city>
      get copyWith =>
          CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city<
    TRes> {
  factory CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city(
    Mutation$UserCreate$userCreateOne$address$subdistrict$district$city
        instance,
    TRes Function(
            Mutation$UserCreate$userCreateOne$address$subdistrict$district$city)
        then,
  ) = _CopyWithImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city;

  factory CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city;

  TRes call({
    int? id,
    String? name,
    Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province?
        province,
    String? $__typename,
  });
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province<
      TRes> get province;
}

class _CopyWithImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city<
        TRes>
    implements
        CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city<
            TRes> {
  _CopyWithImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city(
    this._instance,
    this._then,
  );

  final Mutation$UserCreate$userCreateOne$address$subdistrict$district$city
      _instance;

  final TRes Function(
          Mutation$UserCreate$userCreateOne$address$subdistrict$district$city)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? province = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UserCreate$userCreateOne$address$subdistrict$district$city(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        province: province == _undefined || province == null
            ? _instance.province
            : (province
                as Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province<
      TRes> get province {
    final local$province = _instance.province;
    return CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province(
        local$province, (e) => call(province: e));
  }
}

class _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city<
        TRes>
    implements
        CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city<
            TRes> {
  _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province?
        province,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province<
          TRes>
      get province =>
          CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province
              .stub(_res);
}

class Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province {
  Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province({
    required this.id,
    required this.name,
    this.$__typename = 'Province',
  });

  factory Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province(
      id: (l$id as int),
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province
    on Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province {
  CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province<
          Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province>
      get copyWith =>
          CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province<
    TRes> {
  factory CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province(
    Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province
        instance,
    TRes Function(
            Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province)
        then,
  ) = _CopyWithImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province;

  factory CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province;

  TRes call({
    int? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province<
        TRes>
    implements
        CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province<
            TRes> {
  _CopyWithImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province(
    this._instance,
    this._then,
  );

  final Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province
      _instance;

  final TRes Function(
          Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province<
        TRes>
    implements
        CopyWith$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province<
            TRes> {
  _CopyWithStubImpl$Mutation$UserCreate$userCreateOne$address$subdistrict$district$city$province(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}
