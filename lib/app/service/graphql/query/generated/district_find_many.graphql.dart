import '../../schema/generated/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$DistrictFindMany {
  factory Variables$Query$DistrictFindMany(
          {required Input$DistrictFindManyArgs districtFindManyArgs}) =>
      Variables$Query$DistrictFindMany._({
        r'districtFindManyArgs': districtFindManyArgs,
      });

  Variables$Query$DistrictFindMany._(this._$data);

  factory Variables$Query$DistrictFindMany.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$districtFindManyArgs = data['districtFindManyArgs'];
    result$data['districtFindManyArgs'] = Input$DistrictFindManyArgs.fromJson(
        (l$districtFindManyArgs as Map<String, dynamic>));
    return Variables$Query$DistrictFindMany._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$DistrictFindManyArgs get districtFindManyArgs =>
      (_$data['districtFindManyArgs'] as Input$DistrictFindManyArgs);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$districtFindManyArgs = districtFindManyArgs;
    result$data['districtFindManyArgs'] = l$districtFindManyArgs.toJson();
    return result$data;
  }

  CopyWith$Variables$Query$DistrictFindMany<Variables$Query$DistrictFindMany>
      get copyWith => CopyWith$Variables$Query$DistrictFindMany(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$DistrictFindMany) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$districtFindManyArgs = districtFindManyArgs;
    final lOther$districtFindManyArgs = other.districtFindManyArgs;
    if (l$districtFindManyArgs != lOther$districtFindManyArgs) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$districtFindManyArgs = districtFindManyArgs;
    return Object.hashAll([l$districtFindManyArgs]);
  }
}

abstract class CopyWith$Variables$Query$DistrictFindMany<TRes> {
  factory CopyWith$Variables$Query$DistrictFindMany(
    Variables$Query$DistrictFindMany instance,
    TRes Function(Variables$Query$DistrictFindMany) then,
  ) = _CopyWithImpl$Variables$Query$DistrictFindMany;

  factory CopyWith$Variables$Query$DistrictFindMany.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$DistrictFindMany;

  TRes call({Input$DistrictFindManyArgs? districtFindManyArgs});
}

class _CopyWithImpl$Variables$Query$DistrictFindMany<TRes>
    implements CopyWith$Variables$Query$DistrictFindMany<TRes> {
  _CopyWithImpl$Variables$Query$DistrictFindMany(
    this._instance,
    this._then,
  );

  final Variables$Query$DistrictFindMany _instance;

  final TRes Function(Variables$Query$DistrictFindMany) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? districtFindManyArgs = _undefined}) =>
      _then(Variables$Query$DistrictFindMany._({
        ..._instance._$data,
        if (districtFindManyArgs != _undefined && districtFindManyArgs != null)
          'districtFindManyArgs':
              (districtFindManyArgs as Input$DistrictFindManyArgs),
      }));
}

class _CopyWithStubImpl$Variables$Query$DistrictFindMany<TRes>
    implements CopyWith$Variables$Query$DistrictFindMany<TRes> {
  _CopyWithStubImpl$Variables$Query$DistrictFindMany(this._res);

  TRes _res;

  call({Input$DistrictFindManyArgs? districtFindManyArgs}) => _res;
}

class Query$DistrictFindMany {
  Query$DistrictFindMany({
    this.districtFindMany,
    this.$__typename = 'Query',
  });

  factory Query$DistrictFindMany.fromJson(Map<String, dynamic> json) {
    final l$districtFindMany = json['districtFindMany'];
    final l$$__typename = json['__typename'];
    return Query$DistrictFindMany(
      districtFindMany: (l$districtFindMany as List<dynamic>?)
          ?.map((e) => Query$DistrictFindMany$districtFindMany.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$DistrictFindMany$districtFindMany>? districtFindMany;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$districtFindMany = districtFindMany;
    _resultData['districtFindMany'] =
        l$districtFindMany?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$districtFindMany = districtFindMany;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$districtFindMany == null
          ? null
          : Object.hashAll(l$districtFindMany.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$DistrictFindMany) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$districtFindMany = districtFindMany;
    final lOther$districtFindMany = other.districtFindMany;
    if (l$districtFindMany != null && lOther$districtFindMany != null) {
      if (l$districtFindMany.length != lOther$districtFindMany.length) {
        return false;
      }
      for (int i = 0; i < l$districtFindMany.length; i++) {
        final l$districtFindMany$entry = l$districtFindMany[i];
        final lOther$districtFindMany$entry = lOther$districtFindMany[i];
        if (l$districtFindMany$entry != lOther$districtFindMany$entry) {
          return false;
        }
      }
    } else if (l$districtFindMany != lOther$districtFindMany) {
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

extension UtilityExtension$Query$DistrictFindMany on Query$DistrictFindMany {
  CopyWith$Query$DistrictFindMany<Query$DistrictFindMany> get copyWith =>
      CopyWith$Query$DistrictFindMany(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$DistrictFindMany<TRes> {
  factory CopyWith$Query$DistrictFindMany(
    Query$DistrictFindMany instance,
    TRes Function(Query$DistrictFindMany) then,
  ) = _CopyWithImpl$Query$DistrictFindMany;

  factory CopyWith$Query$DistrictFindMany.stub(TRes res) =
      _CopyWithStubImpl$Query$DistrictFindMany;

  TRes call({
    List<Query$DistrictFindMany$districtFindMany>? districtFindMany,
    String? $__typename,
  });
  TRes districtFindMany(
      Iterable<Query$DistrictFindMany$districtFindMany>? Function(
              Iterable<
                  CopyWith$Query$DistrictFindMany$districtFindMany<
                      Query$DistrictFindMany$districtFindMany>>?)
          _fn);
}

class _CopyWithImpl$Query$DistrictFindMany<TRes>
    implements CopyWith$Query$DistrictFindMany<TRes> {
  _CopyWithImpl$Query$DistrictFindMany(
    this._instance,
    this._then,
  );

  final Query$DistrictFindMany _instance;

  final TRes Function(Query$DistrictFindMany) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? districtFindMany = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$DistrictFindMany(
        districtFindMany: districtFindMany == _undefined
            ? _instance.districtFindMany
            : (districtFindMany
                as List<Query$DistrictFindMany$districtFindMany>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes districtFindMany(
          Iterable<Query$DistrictFindMany$districtFindMany>? Function(
                  Iterable<
                      CopyWith$Query$DistrictFindMany$districtFindMany<
                          Query$DistrictFindMany$districtFindMany>>?)
              _fn) =>
      call(
          districtFindMany: _fn(_instance.districtFindMany
              ?.map((e) => CopyWith$Query$DistrictFindMany$districtFindMany(
                    e,
                    (i) => i,
                  )))?.toList());
}

class _CopyWithStubImpl$Query$DistrictFindMany<TRes>
    implements CopyWith$Query$DistrictFindMany<TRes> {
  _CopyWithStubImpl$Query$DistrictFindMany(this._res);

  TRes _res;

  call({
    List<Query$DistrictFindMany$districtFindMany>? districtFindMany,
    String? $__typename,
  }) =>
      _res;
  districtFindMany(_fn) => _res;
}

const documentNodeQueryDistrictFindMany = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'DistrictFindMany'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'districtFindManyArgs')),
        type: NamedTypeNode(
          name: NameNode(value: 'DistrictFindManyArgs'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'districtFindMany'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'districtFindManyArgs'),
            value: VariableNode(name: NameNode(value: 'districtFindManyArgs')),
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
Query$DistrictFindMany _parserFn$Query$DistrictFindMany(
        Map<String, dynamic> data) =>
    Query$DistrictFindMany.fromJson(data);
typedef OnQueryComplete$Query$DistrictFindMany = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$DistrictFindMany?,
);

class Options$Query$DistrictFindMany
    extends graphql.QueryOptions<Query$DistrictFindMany> {
  Options$Query$DistrictFindMany({
    String? operationName,
    required Variables$Query$DistrictFindMany variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$DistrictFindMany? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$DistrictFindMany? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$DistrictFindMany(data),
                  ),
          onError: onError,
          document: documentNodeQueryDistrictFindMany,
          parserFn: _parserFn$Query$DistrictFindMany,
        );

  final OnQueryComplete$Query$DistrictFindMany? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$DistrictFindMany
    extends graphql.WatchQueryOptions<Query$DistrictFindMany> {
  WatchOptions$Query$DistrictFindMany({
    String? operationName,
    required Variables$Query$DistrictFindMany variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$DistrictFindMany? typedOptimisticResult,
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
          document: documentNodeQueryDistrictFindMany,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$DistrictFindMany,
        );
}

class FetchMoreOptions$Query$DistrictFindMany extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$DistrictFindMany({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$DistrictFindMany variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryDistrictFindMany,
        );
}

extension ClientExtension$Query$DistrictFindMany on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$DistrictFindMany>> query$DistrictFindMany(
          Options$Query$DistrictFindMany options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$DistrictFindMany> watchQuery$DistrictFindMany(
          WatchOptions$Query$DistrictFindMany options) =>
      this.watchQuery(options);
  void writeQuery$DistrictFindMany({
    required Query$DistrictFindMany data,
    required Variables$Query$DistrictFindMany variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryDistrictFindMany),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$DistrictFindMany? readQuery$DistrictFindMany({
    required Variables$Query$DistrictFindMany variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryDistrictFindMany),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$DistrictFindMany.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$DistrictFindMany>
    useQuery$DistrictFindMany(Options$Query$DistrictFindMany options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$DistrictFindMany> useWatchQuery$DistrictFindMany(
        WatchOptions$Query$DistrictFindMany options) =>
    graphql_flutter.useWatchQuery(options);

class Query$DistrictFindMany$Widget
    extends graphql_flutter.Query<Query$DistrictFindMany> {
  Query$DistrictFindMany$Widget({
    widgets.Key? key,
    required Options$Query$DistrictFindMany options,
    required graphql_flutter.QueryBuilder<Query$DistrictFindMany> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$DistrictFindMany$districtFindMany {
  Query$DistrictFindMany$districtFindMany({
    required this.id,
    required this.name,
    this.$__typename = 'District',
  });

  factory Query$DistrictFindMany$districtFindMany.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$DistrictFindMany$districtFindMany(
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
    if (!(other is Query$DistrictFindMany$districtFindMany) ||
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

extension UtilityExtension$Query$DistrictFindMany$districtFindMany
    on Query$DistrictFindMany$districtFindMany {
  CopyWith$Query$DistrictFindMany$districtFindMany<
          Query$DistrictFindMany$districtFindMany>
      get copyWith => CopyWith$Query$DistrictFindMany$districtFindMany(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$DistrictFindMany$districtFindMany<TRes> {
  factory CopyWith$Query$DistrictFindMany$districtFindMany(
    Query$DistrictFindMany$districtFindMany instance,
    TRes Function(Query$DistrictFindMany$districtFindMany) then,
  ) = _CopyWithImpl$Query$DistrictFindMany$districtFindMany;

  factory CopyWith$Query$DistrictFindMany$districtFindMany.stub(TRes res) =
      _CopyWithStubImpl$Query$DistrictFindMany$districtFindMany;

  TRes call({
    int? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$DistrictFindMany$districtFindMany<TRes>
    implements CopyWith$Query$DistrictFindMany$districtFindMany<TRes> {
  _CopyWithImpl$Query$DistrictFindMany$districtFindMany(
    this._instance,
    this._then,
  );

  final Query$DistrictFindMany$districtFindMany _instance;

  final TRes Function(Query$DistrictFindMany$districtFindMany) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$DistrictFindMany$districtFindMany(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$DistrictFindMany$districtFindMany<TRes>
    implements CopyWith$Query$DistrictFindMany$districtFindMany<TRes> {
  _CopyWithStubImpl$Query$DistrictFindMany$districtFindMany(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}
