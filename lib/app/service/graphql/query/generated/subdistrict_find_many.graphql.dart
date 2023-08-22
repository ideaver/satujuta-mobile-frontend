import '../../schema/generated/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$SubdistrictFindMany {
  factory Variables$Query$SubdistrictFindMany(
          {required Input$SubdistrictFindManyArgs subdistrictFindManyArgs}) =>
      Variables$Query$SubdistrictFindMany._({
        r'subdistrictFindManyArgs': subdistrictFindManyArgs,
      });

  Variables$Query$SubdistrictFindMany._(this._$data);

  factory Variables$Query$SubdistrictFindMany.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$subdistrictFindManyArgs = data['subdistrictFindManyArgs'];
    result$data['subdistrictFindManyArgs'] =
        Input$SubdistrictFindManyArgs.fromJson(
            (l$subdistrictFindManyArgs as Map<String, dynamic>));
    return Variables$Query$SubdistrictFindMany._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$SubdistrictFindManyArgs get subdistrictFindManyArgs =>
      (_$data['subdistrictFindManyArgs'] as Input$SubdistrictFindManyArgs);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$subdistrictFindManyArgs = subdistrictFindManyArgs;
    result$data['subdistrictFindManyArgs'] = l$subdistrictFindManyArgs.toJson();
    return result$data;
  }

  CopyWith$Variables$Query$SubdistrictFindMany<
          Variables$Query$SubdistrictFindMany>
      get copyWith => CopyWith$Variables$Query$SubdistrictFindMany(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$SubdistrictFindMany) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$subdistrictFindManyArgs = subdistrictFindManyArgs;
    final lOther$subdistrictFindManyArgs = other.subdistrictFindManyArgs;
    if (l$subdistrictFindManyArgs != lOther$subdistrictFindManyArgs) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$subdistrictFindManyArgs = subdistrictFindManyArgs;
    return Object.hashAll([l$subdistrictFindManyArgs]);
  }
}

abstract class CopyWith$Variables$Query$SubdistrictFindMany<TRes> {
  factory CopyWith$Variables$Query$SubdistrictFindMany(
    Variables$Query$SubdistrictFindMany instance,
    TRes Function(Variables$Query$SubdistrictFindMany) then,
  ) = _CopyWithImpl$Variables$Query$SubdistrictFindMany;

  factory CopyWith$Variables$Query$SubdistrictFindMany.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$SubdistrictFindMany;

  TRes call({Input$SubdistrictFindManyArgs? subdistrictFindManyArgs});
}

class _CopyWithImpl$Variables$Query$SubdistrictFindMany<TRes>
    implements CopyWith$Variables$Query$SubdistrictFindMany<TRes> {
  _CopyWithImpl$Variables$Query$SubdistrictFindMany(
    this._instance,
    this._then,
  );

  final Variables$Query$SubdistrictFindMany _instance;

  final TRes Function(Variables$Query$SubdistrictFindMany) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? subdistrictFindManyArgs = _undefined}) =>
      _then(Variables$Query$SubdistrictFindMany._({
        ..._instance._$data,
        if (subdistrictFindManyArgs != _undefined &&
            subdistrictFindManyArgs != null)
          'subdistrictFindManyArgs':
              (subdistrictFindManyArgs as Input$SubdistrictFindManyArgs),
      }));
}

class _CopyWithStubImpl$Variables$Query$SubdistrictFindMany<TRes>
    implements CopyWith$Variables$Query$SubdistrictFindMany<TRes> {
  _CopyWithStubImpl$Variables$Query$SubdistrictFindMany(this._res);

  TRes _res;

  call({Input$SubdistrictFindManyArgs? subdistrictFindManyArgs}) => _res;
}

class Query$SubdistrictFindMany {
  Query$SubdistrictFindMany({
    this.subdistrictFindMany,
    this.$__typename = 'Query',
  });

  factory Query$SubdistrictFindMany.fromJson(Map<String, dynamic> json) {
    final l$subdistrictFindMany = json['subdistrictFindMany'];
    final l$$__typename = json['__typename'];
    return Query$SubdistrictFindMany(
      subdistrictFindMany: (l$subdistrictFindMany as List<dynamic>?)
          ?.map((e) => Query$SubdistrictFindMany$subdistrictFindMany.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$SubdistrictFindMany$subdistrictFindMany>?
      subdistrictFindMany;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$subdistrictFindMany = subdistrictFindMany;
    _resultData['subdistrictFindMany'] =
        l$subdistrictFindMany?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$subdistrictFindMany = subdistrictFindMany;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$subdistrictFindMany == null
          ? null
          : Object.hashAll(l$subdistrictFindMany.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$SubdistrictFindMany) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$subdistrictFindMany = subdistrictFindMany;
    final lOther$subdistrictFindMany = other.subdistrictFindMany;
    if (l$subdistrictFindMany != null && lOther$subdistrictFindMany != null) {
      if (l$subdistrictFindMany.length != lOther$subdistrictFindMany.length) {
        return false;
      }
      for (int i = 0; i < l$subdistrictFindMany.length; i++) {
        final l$subdistrictFindMany$entry = l$subdistrictFindMany[i];
        final lOther$subdistrictFindMany$entry = lOther$subdistrictFindMany[i];
        if (l$subdistrictFindMany$entry != lOther$subdistrictFindMany$entry) {
          return false;
        }
      }
    } else if (l$subdistrictFindMany != lOther$subdistrictFindMany) {
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

extension UtilityExtension$Query$SubdistrictFindMany
    on Query$SubdistrictFindMany {
  CopyWith$Query$SubdistrictFindMany<Query$SubdistrictFindMany> get copyWith =>
      CopyWith$Query$SubdistrictFindMany(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$SubdistrictFindMany<TRes> {
  factory CopyWith$Query$SubdistrictFindMany(
    Query$SubdistrictFindMany instance,
    TRes Function(Query$SubdistrictFindMany) then,
  ) = _CopyWithImpl$Query$SubdistrictFindMany;

  factory CopyWith$Query$SubdistrictFindMany.stub(TRes res) =
      _CopyWithStubImpl$Query$SubdistrictFindMany;

  TRes call({
    List<Query$SubdistrictFindMany$subdistrictFindMany>? subdistrictFindMany,
    String? $__typename,
  });
  TRes subdistrictFindMany(
      Iterable<Query$SubdistrictFindMany$subdistrictFindMany>? Function(
              Iterable<
                  CopyWith$Query$SubdistrictFindMany$subdistrictFindMany<
                      Query$SubdistrictFindMany$subdistrictFindMany>>?)
          _fn);
}

class _CopyWithImpl$Query$SubdistrictFindMany<TRes>
    implements CopyWith$Query$SubdistrictFindMany<TRes> {
  _CopyWithImpl$Query$SubdistrictFindMany(
    this._instance,
    this._then,
  );

  final Query$SubdistrictFindMany _instance;

  final TRes Function(Query$SubdistrictFindMany) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? subdistrictFindMany = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SubdistrictFindMany(
        subdistrictFindMany: subdistrictFindMany == _undefined
            ? _instance.subdistrictFindMany
            : (subdistrictFindMany
                as List<Query$SubdistrictFindMany$subdistrictFindMany>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes subdistrictFindMany(
          Iterable<Query$SubdistrictFindMany$subdistrictFindMany>? Function(
                  Iterable<
                      CopyWith$Query$SubdistrictFindMany$subdistrictFindMany<
                          Query$SubdistrictFindMany$subdistrictFindMany>>?)
              _fn) =>
      call(
          subdistrictFindMany: _fn(_instance.subdistrictFindMany?.map(
              (e) => CopyWith$Query$SubdistrictFindMany$subdistrictFindMany(
                    e,
                    (i) => i,
                  )))?.toList());
}

class _CopyWithStubImpl$Query$SubdistrictFindMany<TRes>
    implements CopyWith$Query$SubdistrictFindMany<TRes> {
  _CopyWithStubImpl$Query$SubdistrictFindMany(this._res);

  TRes _res;

  call({
    List<Query$SubdistrictFindMany$subdistrictFindMany>? subdistrictFindMany,
    String? $__typename,
  }) =>
      _res;
  subdistrictFindMany(_fn) => _res;
}

const documentNodeQuerySubdistrictFindMany = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'SubdistrictFindMany'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable:
            VariableNode(name: NameNode(value: 'subdistrictFindManyArgs')),
        type: NamedTypeNode(
          name: NameNode(value: 'SubdistrictFindManyArgs'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'subdistrictFindMany'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'subdistrictFindManyArgs'),
            value:
                VariableNode(name: NameNode(value: 'subdistrictFindManyArgs')),
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
            name: NameNode(value: 'postalCode'),
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
Query$SubdistrictFindMany _parserFn$Query$SubdistrictFindMany(
        Map<String, dynamic> data) =>
    Query$SubdistrictFindMany.fromJson(data);
typedef OnQueryComplete$Query$SubdistrictFindMany = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$SubdistrictFindMany?,
);

class Options$Query$SubdistrictFindMany
    extends graphql.QueryOptions<Query$SubdistrictFindMany> {
  Options$Query$SubdistrictFindMany({
    String? operationName,
    required Variables$Query$SubdistrictFindMany variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SubdistrictFindMany? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$SubdistrictFindMany? onComplete,
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
                        : _parserFn$Query$SubdistrictFindMany(data),
                  ),
          onError: onError,
          document: documentNodeQuerySubdistrictFindMany,
          parserFn: _parserFn$Query$SubdistrictFindMany,
        );

  final OnQueryComplete$Query$SubdistrictFindMany? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$SubdistrictFindMany
    extends graphql.WatchQueryOptions<Query$SubdistrictFindMany> {
  WatchOptions$Query$SubdistrictFindMany({
    String? operationName,
    required Variables$Query$SubdistrictFindMany variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$SubdistrictFindMany? typedOptimisticResult,
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
          document: documentNodeQuerySubdistrictFindMany,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$SubdistrictFindMany,
        );
}

class FetchMoreOptions$Query$SubdistrictFindMany
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$SubdistrictFindMany({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$SubdistrictFindMany variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerySubdistrictFindMany,
        );
}

extension ClientExtension$Query$SubdistrictFindMany on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$SubdistrictFindMany>>
      query$SubdistrictFindMany(
              Options$Query$SubdistrictFindMany options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$SubdistrictFindMany>
      watchQuery$SubdistrictFindMany(
              WatchOptions$Query$SubdistrictFindMany options) =>
          this.watchQuery(options);
  void writeQuery$SubdistrictFindMany({
    required Query$SubdistrictFindMany data,
    required Variables$Query$SubdistrictFindMany variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerySubdistrictFindMany),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$SubdistrictFindMany? readQuery$SubdistrictFindMany({
    required Variables$Query$SubdistrictFindMany variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerySubdistrictFindMany),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$SubdistrictFindMany.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$SubdistrictFindMany>
    useQuery$SubdistrictFindMany(Options$Query$SubdistrictFindMany options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$SubdistrictFindMany>
    useWatchQuery$SubdistrictFindMany(
            WatchOptions$Query$SubdistrictFindMany options) =>
        graphql_flutter.useWatchQuery(options);

class Query$SubdistrictFindMany$Widget
    extends graphql_flutter.Query<Query$SubdistrictFindMany> {
  Query$SubdistrictFindMany$Widget({
    widgets.Key? key,
    required Options$Query$SubdistrictFindMany options,
    required graphql_flutter.QueryBuilder<Query$SubdistrictFindMany> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$SubdistrictFindMany$subdistrictFindMany {
  Query$SubdistrictFindMany$subdistrictFindMany({
    required this.id,
    required this.name,
    required this.postalCode,
    this.$__typename = 'Subdistrict',
  });

  factory Query$SubdistrictFindMany$subdistrictFindMany.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$postalCode = json['postalCode'];
    final l$$__typename = json['__typename'];
    return Query$SubdistrictFindMany$subdistrictFindMany(
      id: (l$id as int),
      name: (l$name as String),
      postalCode: (l$postalCode as String),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final String postalCode;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$postalCode = postalCode;
    _resultData['postalCode'] = l$postalCode;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$postalCode = postalCode;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$postalCode,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$SubdistrictFindMany$subdistrictFindMany) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$SubdistrictFindMany$subdistrictFindMany
    on Query$SubdistrictFindMany$subdistrictFindMany {
  CopyWith$Query$SubdistrictFindMany$subdistrictFindMany<
          Query$SubdistrictFindMany$subdistrictFindMany>
      get copyWith => CopyWith$Query$SubdistrictFindMany$subdistrictFindMany(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$SubdistrictFindMany$subdistrictFindMany<TRes> {
  factory CopyWith$Query$SubdistrictFindMany$subdistrictFindMany(
    Query$SubdistrictFindMany$subdistrictFindMany instance,
    TRes Function(Query$SubdistrictFindMany$subdistrictFindMany) then,
  ) = _CopyWithImpl$Query$SubdistrictFindMany$subdistrictFindMany;

  factory CopyWith$Query$SubdistrictFindMany$subdistrictFindMany.stub(
          TRes res) =
      _CopyWithStubImpl$Query$SubdistrictFindMany$subdistrictFindMany;

  TRes call({
    int? id,
    String? name,
    String? postalCode,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$SubdistrictFindMany$subdistrictFindMany<TRes>
    implements CopyWith$Query$SubdistrictFindMany$subdistrictFindMany<TRes> {
  _CopyWithImpl$Query$SubdistrictFindMany$subdistrictFindMany(
    this._instance,
    this._then,
  );

  final Query$SubdistrictFindMany$subdistrictFindMany _instance;

  final TRes Function(Query$SubdistrictFindMany$subdistrictFindMany) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? postalCode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$SubdistrictFindMany$subdistrictFindMany(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        postalCode: postalCode == _undefined || postalCode == null
            ? _instance.postalCode
            : (postalCode as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$SubdistrictFindMany$subdistrictFindMany<TRes>
    implements CopyWith$Query$SubdistrictFindMany$subdistrictFindMany<TRes> {
  _CopyWithStubImpl$Query$SubdistrictFindMany$subdistrictFindMany(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? postalCode,
    String? $__typename,
  }) =>
      _res;
}
