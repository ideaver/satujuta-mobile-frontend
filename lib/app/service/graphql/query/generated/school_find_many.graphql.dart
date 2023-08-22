import '../../schema/generated/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$SchoolFindMany {
  factory Variables$Query$SchoolFindMany(
          {required Input$SchoolFindManyArgs schoolFindManyArgs}) =>
      Variables$Query$SchoolFindMany._({
        r'schoolFindManyArgs': schoolFindManyArgs,
      });

  Variables$Query$SchoolFindMany._(this._$data);

  factory Variables$Query$SchoolFindMany.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$schoolFindManyArgs = data['schoolFindManyArgs'];
    result$data['schoolFindManyArgs'] = Input$SchoolFindManyArgs.fromJson(
        (l$schoolFindManyArgs as Map<String, dynamic>));
    return Variables$Query$SchoolFindMany._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$SchoolFindManyArgs get schoolFindManyArgs =>
      (_$data['schoolFindManyArgs'] as Input$SchoolFindManyArgs);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$schoolFindManyArgs = schoolFindManyArgs;
    result$data['schoolFindManyArgs'] = l$schoolFindManyArgs.toJson();
    return result$data;
  }

  CopyWith$Variables$Query$SchoolFindMany<Variables$Query$SchoolFindMany>
      get copyWith => CopyWith$Variables$Query$SchoolFindMany(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$SchoolFindMany) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$schoolFindManyArgs = schoolFindManyArgs;
    final lOther$schoolFindManyArgs = other.schoolFindManyArgs;
    if (l$schoolFindManyArgs != lOther$schoolFindManyArgs) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$schoolFindManyArgs = schoolFindManyArgs;
    return Object.hashAll([l$schoolFindManyArgs]);
  }
}

abstract class CopyWith$Variables$Query$SchoolFindMany<TRes> {
  factory CopyWith$Variables$Query$SchoolFindMany(
    Variables$Query$SchoolFindMany instance,
    TRes Function(Variables$Query$SchoolFindMany) then,
  ) = _CopyWithImpl$Variables$Query$SchoolFindMany;

  factory CopyWith$Variables$Query$SchoolFindMany.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$SchoolFindMany;

  TRes call({Input$SchoolFindManyArgs? schoolFindManyArgs});
}

class _CopyWithImpl$Variables$Query$SchoolFindMany<TRes>
    implements CopyWith$Variables$Query$SchoolFindMany<TRes> {
  _CopyWithImpl$Variables$Query$SchoolFindMany(
    this._instance,
    this._then,
  );

  final Variables$Query$SchoolFindMany _instance;

  final TRes Function(Variables$Query$SchoolFindMany) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? schoolFindManyArgs = _undefined}) =>
      _then(Variables$Query$SchoolFindMany._({
        ..._instance._$data,
        if (schoolFindManyArgs != _undefined && schoolFindManyArgs != null)
          'schoolFindManyArgs':
              (schoolFindManyArgs as Input$SchoolFindManyArgs),
      }));
}

class _CopyWithStubImpl$Variables$Query$SchoolFindMany<TRes>
    implements CopyWith$Variables$Query$SchoolFindMany<TRes> {
  _CopyWithStubImpl$Variables$Query$SchoolFindMany(this._res);

  TRes _res;

  call({Input$SchoolFindManyArgs? schoolFindManyArgs}) => _res;
}

class Query$SchoolFindMany {
  Query$SchoolFindMany({
    this.schoolFindMany,
    this.$__typename = 'Query',
  });

  factory Query$SchoolFindMany.fromJson(Map<String, dynamic> json) {
    final l$schoolFindMany = json['schoolFindMany'];
    final l$$__typename = json['__typename'];
    return Query$SchoolFindMany(
      schoolFindMany: (l$schoolFindMany as List<dynamic>?)
          ?.map((e) => Query$SchoolFindMany$schoolFindMany.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$SchoolFindMany$schoolFindMany>? schoolFindMany;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$schoolFindMany = schoolFindMany;
    _resultData['schoolFindMany'] =
        l$schoolFindMany?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$schoolFindMany = schoolFindMany;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$schoolFindMany == null
          ? null
          : Object.hashAll(l$schoolFindMany.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$SchoolFindMany) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$schoolFindMany = schoolFindMany;
    final lOther$schoolFindMany = other.schoolFindMany;
    if (l$schoolFindMany != null && lOther$schoolFindMany != null) {
      if (l$schoolFindMany.length != lOther$schoolFindMany.length) {
        return false;
      }
      for (int i = 0; i < l$schoolFindMany.length; i++) {
        final l$schoolFindMany$entry = l$schoolFindMany[i];
        final lOther$schoolFindMany$entry = lOther$schoolFindMany[i];
        if (l$schoolFindMany$entry != lOther$schoolFindMany$entry) {
          return false;
        }
      }
    } else if (l$schoolFindMany != lOther$schoolFindMany) {
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

extension UtilityExtension$Query$SchoolFindMany on Query$SchoolFindMany {
  CopyWith$Query$SchoolFindMany<Query$SchoolFindMany> get copyWith =>
      CopyWith$Query$SchoolFindMany(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$SchoolFindMany<TRes> {
  factory CopyWith$Query$SchoolFindMany(
    Query$SchoolFindMany instance,
    TRes Function(Query$SchoolFindMany) then,
  ) = _CopyWithImpl$Query$SchoolFindMany;

  factory CopyWith$Query$SchoolFindMany.stub(TRes res) =
      _CopyWithStubImpl$Query$SchoolFindMany;

  TRes call({
    List<Query$SchoolFindMany$schoolFindMany>? schoolFindMany,
    String? $__typename,
  });
  TRes schoolFindMany(
      Iterable<Query$SchoolFindMany$schoolFindMany>? Function(
              Iterable<
                  CopyWith$Query$SchoolFindMany$schoolFindMany<
                      Query$SchoolFindMany$schoolFindMany>>?)
          _fn);
}

class _CopyWithImpl$Query$SchoolFindMany<TRes>
    implements CopyWith$Query$SchoolFindMany<TRes> {
  _CopyWithImpl$Query$SchoolFindMany(
    this._instance,
    this._then,
  );

  final Query$SchoolFindMany _instance;

  final TRes Function(Query$SchoolFindMany) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? schoolFindMany = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SchoolFindMany(
        schoolFindMany: schoolFindMany == _undefined
            ? _instance.schoolFindMany
            : (schoolFindMany as List<Query$SchoolFindMany$schoolFindMany>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes schoolFindMany(
          Iterable<Query$SchoolFindMany$schoolFindMany>? Function(
                  Iterable<
                      CopyWith$Query$SchoolFindMany$schoolFindMany<
                          Query$SchoolFindMany$schoolFindMany>>?)
              _fn) =>
      call(
          schoolFindMany: _fn(_instance.schoolFindMany
              ?.map((e) => CopyWith$Query$SchoolFindMany$schoolFindMany(
                    e,
                    (i) => i,
                  )))?.toList());
}

class _CopyWithStubImpl$Query$SchoolFindMany<TRes>
    implements CopyWith$Query$SchoolFindMany<TRes> {
  _CopyWithStubImpl$Query$SchoolFindMany(this._res);

  TRes _res;

  call({
    List<Query$SchoolFindMany$schoolFindMany>? schoolFindMany,
    String? $__typename,
  }) =>
      _res;
  schoolFindMany(_fn) => _res;
}

const documentNodeQuerySchoolFindMany = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'SchoolFindMany'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'schoolFindManyArgs')),
        type: NamedTypeNode(
          name: NameNode(value: 'SchoolFindManyArgs'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'schoolFindMany'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'schoolFindManyArgs'),
            value: VariableNode(name: NameNode(value: 'schoolFindManyArgs')),
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
Query$SchoolFindMany _parserFn$Query$SchoolFindMany(
        Map<String, dynamic> data) =>
    Query$SchoolFindMany.fromJson(data);
typedef OnQueryComplete$Query$SchoolFindMany = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$SchoolFindMany?,
);

class Options$Query$SchoolFindMany
    extends graphql.QueryOptions<Query$SchoolFindMany> {
  Options$Query$SchoolFindMany({
    String? operationName,
    required Variables$Query$SchoolFindMany variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SchoolFindMany? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$SchoolFindMany? onComplete,
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
                    data == null ? null : _parserFn$Query$SchoolFindMany(data),
                  ),
          onError: onError,
          document: documentNodeQuerySchoolFindMany,
          parserFn: _parserFn$Query$SchoolFindMany,
        );

  final OnQueryComplete$Query$SchoolFindMany? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$SchoolFindMany
    extends graphql.WatchQueryOptions<Query$SchoolFindMany> {
  WatchOptions$Query$SchoolFindMany({
    String? operationName,
    required Variables$Query$SchoolFindMany variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SchoolFindMany? typedOptimisticResult,
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
          document: documentNodeQuerySchoolFindMany,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$SchoolFindMany,
        );
}

class FetchMoreOptions$Query$SchoolFindMany extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$SchoolFindMany({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$SchoolFindMany variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerySchoolFindMany,
        );
}

extension ClientExtension$Query$SchoolFindMany on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$SchoolFindMany>> query$SchoolFindMany(
          Options$Query$SchoolFindMany options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$SchoolFindMany> watchQuery$SchoolFindMany(
          WatchOptions$Query$SchoolFindMany options) =>
      this.watchQuery(options);
  void writeQuery$SchoolFindMany({
    required Query$SchoolFindMany data,
    required Variables$Query$SchoolFindMany variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerySchoolFindMany),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$SchoolFindMany? readQuery$SchoolFindMany({
    required Variables$Query$SchoolFindMany variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerySchoolFindMany),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$SchoolFindMany.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$SchoolFindMany> useQuery$SchoolFindMany(
        Options$Query$SchoolFindMany options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$SchoolFindMany> useWatchQuery$SchoolFindMany(
        WatchOptions$Query$SchoolFindMany options) =>
    graphql_flutter.useWatchQuery(options);

class Query$SchoolFindMany$Widget
    extends graphql_flutter.Query<Query$SchoolFindMany> {
  Query$SchoolFindMany$Widget({
    widgets.Key? key,
    required Options$Query$SchoolFindMany options,
    required graphql_flutter.QueryBuilder<Query$SchoolFindMany> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$SchoolFindMany$schoolFindMany {
  Query$SchoolFindMany$schoolFindMany({
    required this.id,
    required this.name,
    required this.addressId,
    this.$__typename = 'School',
  });

  factory Query$SchoolFindMany$schoolFindMany.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$addressId = json['addressId'];
    final l$$__typename = json['__typename'];
    return Query$SchoolFindMany$schoolFindMany(
      id: (l$id as int),
      name: (l$name as String),
      addressId: (l$addressId as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final int addressId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$addressId = addressId;
    _resultData['addressId'] = l$addressId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$addressId = addressId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$addressId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$SchoolFindMany$schoolFindMany) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SchoolFindMany$schoolFindMany
    on Query$SchoolFindMany$schoolFindMany {
  CopyWith$Query$SchoolFindMany$schoolFindMany<
          Query$SchoolFindMany$schoolFindMany>
      get copyWith => CopyWith$Query$SchoolFindMany$schoolFindMany(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SchoolFindMany$schoolFindMany<TRes> {
  factory CopyWith$Query$SchoolFindMany$schoolFindMany(
    Query$SchoolFindMany$schoolFindMany instance,
    TRes Function(Query$SchoolFindMany$schoolFindMany) then,
  ) = _CopyWithImpl$Query$SchoolFindMany$schoolFindMany;

  factory CopyWith$Query$SchoolFindMany$schoolFindMany.stub(TRes res) =
      _CopyWithStubImpl$Query$SchoolFindMany$schoolFindMany;

  TRes call({
    int? id,
    String? name,
    int? addressId,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SchoolFindMany$schoolFindMany<TRes>
    implements CopyWith$Query$SchoolFindMany$schoolFindMany<TRes> {
  _CopyWithImpl$Query$SchoolFindMany$schoolFindMany(
    this._instance,
    this._then,
  );

  final Query$SchoolFindMany$schoolFindMany _instance;

  final TRes Function(Query$SchoolFindMany$schoolFindMany) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? addressId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SchoolFindMany$schoolFindMany(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        addressId: addressId == _undefined || addressId == null
            ? _instance.addressId
            : (addressId as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$SchoolFindMany$schoolFindMany<TRes>
    implements CopyWith$Query$SchoolFindMany$schoolFindMany<TRes> {
  _CopyWithStubImpl$Query$SchoolFindMany$schoolFindMany(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    int? addressId,
    String? $__typename,
  }) =>
      _res;
}
