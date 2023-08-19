import '../../schema/generated/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$ProgramFindOne {
  factory Variables$Query$ProgramFindOne(
          {required Input$ProgramFindUniqueArgs programFindOneArgs}) =>
      Variables$Query$ProgramFindOne._({
        r'programFindOneArgs': programFindOneArgs,
      });

  Variables$Query$ProgramFindOne._(this._$data);

  factory Variables$Query$ProgramFindOne.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$programFindOneArgs = data['programFindOneArgs'];
    result$data['programFindOneArgs'] = Input$ProgramFindUniqueArgs.fromJson(
        (l$programFindOneArgs as Map<String, dynamic>));
    return Variables$Query$ProgramFindOne._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$ProgramFindUniqueArgs get programFindOneArgs =>
      (_$data['programFindOneArgs'] as Input$ProgramFindUniqueArgs);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$programFindOneArgs = programFindOneArgs;
    result$data['programFindOneArgs'] = l$programFindOneArgs.toJson();
    return result$data;
  }

  CopyWith$Variables$Query$ProgramFindOne<Variables$Query$ProgramFindOne>
      get copyWith => CopyWith$Variables$Query$ProgramFindOne(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$ProgramFindOne) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$programFindOneArgs = programFindOneArgs;
    final lOther$programFindOneArgs = other.programFindOneArgs;
    if (l$programFindOneArgs != lOther$programFindOneArgs) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$programFindOneArgs = programFindOneArgs;
    return Object.hashAll([l$programFindOneArgs]);
  }
}

abstract class CopyWith$Variables$Query$ProgramFindOne<TRes> {
  factory CopyWith$Variables$Query$ProgramFindOne(
    Variables$Query$ProgramFindOne instance,
    TRes Function(Variables$Query$ProgramFindOne) then,
  ) = _CopyWithImpl$Variables$Query$ProgramFindOne;

  factory CopyWith$Variables$Query$ProgramFindOne.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ProgramFindOne;

  TRes call({Input$ProgramFindUniqueArgs? programFindOneArgs});
}

class _CopyWithImpl$Variables$Query$ProgramFindOne<TRes>
    implements CopyWith$Variables$Query$ProgramFindOne<TRes> {
  _CopyWithImpl$Variables$Query$ProgramFindOne(
    this._instance,
    this._then,
  );

  final Variables$Query$ProgramFindOne _instance;

  final TRes Function(Variables$Query$ProgramFindOne) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? programFindOneArgs = _undefined}) =>
      _then(Variables$Query$ProgramFindOne._({
        ..._instance._$data,
        if (programFindOneArgs != _undefined && programFindOneArgs != null)
          'programFindOneArgs':
              (programFindOneArgs as Input$ProgramFindUniqueArgs),
      }));
}

class _CopyWithStubImpl$Variables$Query$ProgramFindOne<TRes>
    implements CopyWith$Variables$Query$ProgramFindOne<TRes> {
  _CopyWithStubImpl$Variables$Query$ProgramFindOne(this._res);

  TRes _res;

  call({Input$ProgramFindUniqueArgs? programFindOneArgs}) => _res;
}

class Query$ProgramFindOne {
  Query$ProgramFindOne({
    this.programFindOne,
    this.$__typename = 'Query',
  });

  factory Query$ProgramFindOne.fromJson(Map<String, dynamic> json) {
    final l$programFindOne = json['programFindOne'];
    final l$$__typename = json['__typename'];
    return Query$ProgramFindOne(
      programFindOne: l$programFindOne == null
          ? null
          : Query$ProgramFindOne$programFindOne.fromJson(
              (l$programFindOne as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ProgramFindOne$programFindOne? programFindOne;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$programFindOne = programFindOne;
    _resultData['programFindOne'] = l$programFindOne?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$programFindOne = programFindOne;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$programFindOne,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$ProgramFindOne) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$programFindOne = programFindOne;
    final lOther$programFindOne = other.programFindOne;
    if (l$programFindOne != lOther$programFindOne) {
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

extension UtilityExtension$Query$ProgramFindOne on Query$ProgramFindOne {
  CopyWith$Query$ProgramFindOne<Query$ProgramFindOne> get copyWith =>
      CopyWith$Query$ProgramFindOne(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ProgramFindOne<TRes> {
  factory CopyWith$Query$ProgramFindOne(
    Query$ProgramFindOne instance,
    TRes Function(Query$ProgramFindOne) then,
  ) = _CopyWithImpl$Query$ProgramFindOne;

  factory CopyWith$Query$ProgramFindOne.stub(TRes res) =
      _CopyWithStubImpl$Query$ProgramFindOne;

  TRes call({
    Query$ProgramFindOne$programFindOne? programFindOne,
    String? $__typename,
  });
  CopyWith$Query$ProgramFindOne$programFindOne<TRes> get programFindOne;
}

class _CopyWithImpl$Query$ProgramFindOne<TRes>
    implements CopyWith$Query$ProgramFindOne<TRes> {
  _CopyWithImpl$Query$ProgramFindOne(
    this._instance,
    this._then,
  );

  final Query$ProgramFindOne _instance;

  final TRes Function(Query$ProgramFindOne) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? programFindOne = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ProgramFindOne(
        programFindOne: programFindOne == _undefined
            ? _instance.programFindOne
            : (programFindOne as Query$ProgramFindOne$programFindOne?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$ProgramFindOne$programFindOne<TRes> get programFindOne {
    final local$programFindOne = _instance.programFindOne;
    return local$programFindOne == null
        ? CopyWith$Query$ProgramFindOne$programFindOne.stub(_then(_instance))
        : CopyWith$Query$ProgramFindOne$programFindOne(
            local$programFindOne, (e) => call(programFindOne: e));
  }
}

class _CopyWithStubImpl$Query$ProgramFindOne<TRes>
    implements CopyWith$Query$ProgramFindOne<TRes> {
  _CopyWithStubImpl$Query$ProgramFindOne(this._res);

  TRes _res;

  call({
    Query$ProgramFindOne$programFindOne? programFindOne,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$ProgramFindOne$programFindOne<TRes> get programFindOne =>
      CopyWith$Query$ProgramFindOne$programFindOne.stub(_res);
}

const documentNodeQueryProgramFindOne = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'ProgramFindOne'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'programFindOneArgs')),
        type: NamedTypeNode(
          name: NameNode(value: 'ProgramFindUniqueArgs'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'programFindOne'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'programFindUniqueArgs'),
            value: VariableNode(name: NameNode(value: 'programFindOneArgs')),
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
            name: NameNode(value: 'startDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dueDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'description'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'category'),
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
            name: NameNode(value: 'Images'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'url'),
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
                name: NameNode(value: 'participant'),
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
Query$ProgramFindOne _parserFn$Query$ProgramFindOne(
        Map<String, dynamic> data) =>
    Query$ProgramFindOne.fromJson(data);
typedef OnQueryComplete$Query$ProgramFindOne = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$ProgramFindOne?,
);

class Options$Query$ProgramFindOne
    extends graphql.QueryOptions<Query$ProgramFindOne> {
  Options$Query$ProgramFindOne({
    String? operationName,
    required Variables$Query$ProgramFindOne variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ProgramFindOne? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ProgramFindOne? onComplete,
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
                    data == null ? null : _parserFn$Query$ProgramFindOne(data),
                  ),
          onError: onError,
          document: documentNodeQueryProgramFindOne,
          parserFn: _parserFn$Query$ProgramFindOne,
        );

  final OnQueryComplete$Query$ProgramFindOne? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$ProgramFindOne
    extends graphql.WatchQueryOptions<Query$ProgramFindOne> {
  WatchOptions$Query$ProgramFindOne({
    String? operationName,
    required Variables$Query$ProgramFindOne variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ProgramFindOne? typedOptimisticResult,
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
          document: documentNodeQueryProgramFindOne,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$ProgramFindOne,
        );
}

class FetchMoreOptions$Query$ProgramFindOne extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ProgramFindOne({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$ProgramFindOne variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryProgramFindOne,
        );
}

extension ClientExtension$Query$ProgramFindOne on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ProgramFindOne>> query$ProgramFindOne(
          Options$Query$ProgramFindOne options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$ProgramFindOne> watchQuery$ProgramFindOne(
          WatchOptions$Query$ProgramFindOne options) =>
      this.watchQuery(options);
  void writeQuery$ProgramFindOne({
    required Query$ProgramFindOne data,
    required Variables$Query$ProgramFindOne variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryProgramFindOne),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$ProgramFindOne? readQuery$ProgramFindOne({
    required Variables$Query$ProgramFindOne variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryProgramFindOne),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ProgramFindOne.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ProgramFindOne> useQuery$ProgramFindOne(
        Options$Query$ProgramFindOne options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$ProgramFindOne> useWatchQuery$ProgramFindOne(
        WatchOptions$Query$ProgramFindOne options) =>
    graphql_flutter.useWatchQuery(options);

class Query$ProgramFindOne$Widget
    extends graphql_flutter.Query<Query$ProgramFindOne> {
  Query$ProgramFindOne$Widget({
    widgets.Key? key,
    required Options$Query$ProgramFindOne options,
    required graphql_flutter.QueryBuilder<Query$ProgramFindOne> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$ProgramFindOne$programFindOne {
  Query$ProgramFindOne$programFindOne({
    required this.id,
    required this.name,
    required this.startDate,
    this.dueDate,
    required this.description,
    required this.category,
    this.Images,
    required this.$_count,
    this.$__typename = 'Program',
  });

  factory Query$ProgramFindOne$programFindOne.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$startDate = json['startDate'];
    final l$dueDate = json['dueDate'];
    final l$description = json['description'];
    final l$category = json['category'];
    final l$Images = json['Images'];
    final l$$_count = json['_count'];
    final l$$__typename = json['__typename'];
    return Query$ProgramFindOne$programFindOne(
      id: (l$id as int),
      name: (l$name as String),
      startDate: (l$startDate as String),
      dueDate: (l$dueDate as String?),
      description: (l$description as String),
      category: Query$ProgramFindOne$programFindOne$category.fromJson(
          (l$category as Map<String, dynamic>)),
      Images: (l$Images as List<dynamic>?)
          ?.map((e) => Query$ProgramFindOne$programFindOne$Images.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $_count: Query$ProgramFindOne$programFindOne$_count.fromJson(
          (l$$_count as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final String startDate;

  final String? dueDate;

  final String description;

  final Query$ProgramFindOne$programFindOne$category category;

  final List<Query$ProgramFindOne$programFindOne$Images>? Images;

  final Query$ProgramFindOne$programFindOne$_count $_count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$startDate = startDate;
    _resultData['startDate'] = l$startDate;
    final l$dueDate = dueDate;
    _resultData['dueDate'] = l$dueDate;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$category = category;
    _resultData['category'] = l$category.toJson();
    final l$Images = Images;
    _resultData['Images'] = l$Images?.map((e) => e.toJson()).toList();
    final l$$_count = $_count;
    _resultData['_count'] = l$$_count.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$startDate = startDate;
    final l$dueDate = dueDate;
    final l$description = description;
    final l$category = category;
    final l$Images = Images;
    final l$$_count = $_count;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$startDate,
      l$dueDate,
      l$description,
      l$category,
      l$Images == null ? null : Object.hashAll(l$Images.map((v) => v)),
      l$$_count,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$ProgramFindOne$programFindOne) ||
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
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$dueDate = dueDate;
    final lOther$dueDate = other.dueDate;
    if (l$dueDate != lOther$dueDate) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
      return false;
    }
    final l$Images = Images;
    final lOther$Images = other.Images;
    if (l$Images != null && lOther$Images != null) {
      if (l$Images.length != lOther$Images.length) {
        return false;
      }
      for (int i = 0; i < l$Images.length; i++) {
        final l$Images$entry = l$Images[i];
        final lOther$Images$entry = lOther$Images[i];
        if (l$Images$entry != lOther$Images$entry) {
          return false;
        }
      }
    } else if (l$Images != lOther$Images) {
      return false;
    }
    final l$$_count = $_count;
    final lOther$$_count = other.$_count;
    if (l$$_count != lOther$$_count) {
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

extension UtilityExtension$Query$ProgramFindOne$programFindOne
    on Query$ProgramFindOne$programFindOne {
  CopyWith$Query$ProgramFindOne$programFindOne<
          Query$ProgramFindOne$programFindOne>
      get copyWith => CopyWith$Query$ProgramFindOne$programFindOne(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ProgramFindOne$programFindOne<TRes> {
  factory CopyWith$Query$ProgramFindOne$programFindOne(
    Query$ProgramFindOne$programFindOne instance,
    TRes Function(Query$ProgramFindOne$programFindOne) then,
  ) = _CopyWithImpl$Query$ProgramFindOne$programFindOne;

  factory CopyWith$Query$ProgramFindOne$programFindOne.stub(TRes res) =
      _CopyWithStubImpl$Query$ProgramFindOne$programFindOne;

  TRes call({
    int? id,
    String? name,
    String? startDate,
    String? dueDate,
    String? description,
    Query$ProgramFindOne$programFindOne$category? category,
    List<Query$ProgramFindOne$programFindOne$Images>? Images,
    Query$ProgramFindOne$programFindOne$_count? $_count,
    String? $__typename,
  });
  CopyWith$Query$ProgramFindOne$programFindOne$category<TRes> get category;
  TRes Images(
      Iterable<Query$ProgramFindOne$programFindOne$Images>? Function(
              Iterable<
                  CopyWith$Query$ProgramFindOne$programFindOne$Images<
                      Query$ProgramFindOne$programFindOne$Images>>?)
          _fn);
  CopyWith$Query$ProgramFindOne$programFindOne$_count<TRes> get $_count;
}

class _CopyWithImpl$Query$ProgramFindOne$programFindOne<TRes>
    implements CopyWith$Query$ProgramFindOne$programFindOne<TRes> {
  _CopyWithImpl$Query$ProgramFindOne$programFindOne(
    this._instance,
    this._then,
  );

  final Query$ProgramFindOne$programFindOne _instance;

  final TRes Function(Query$ProgramFindOne$programFindOne) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? startDate = _undefined,
    Object? dueDate = _undefined,
    Object? description = _undefined,
    Object? category = _undefined,
    Object? Images = _undefined,
    Object? $_count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ProgramFindOne$programFindOne(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        startDate: startDate == _undefined || startDate == null
            ? _instance.startDate
            : (startDate as String),
        dueDate:
            dueDate == _undefined ? _instance.dueDate : (dueDate as String?),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        category: category == _undefined || category == null
            ? _instance.category
            : (category as Query$ProgramFindOne$programFindOne$category),
        Images: Images == _undefined
            ? _instance.Images
            : (Images as List<Query$ProgramFindOne$programFindOne$Images>?),
        $_count: $_count == _undefined || $_count == null
            ? _instance.$_count
            : ($_count as Query$ProgramFindOne$programFindOne$_count),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$ProgramFindOne$programFindOne$category<TRes> get category {
    final local$category = _instance.category;
    return CopyWith$Query$ProgramFindOne$programFindOne$category(
        local$category, (e) => call(category: e));
  }

  TRes Images(
          Iterable<Query$ProgramFindOne$programFindOne$Images>? Function(
                  Iterable<
                      CopyWith$Query$ProgramFindOne$programFindOne$Images<
                          Query$ProgramFindOne$programFindOne$Images>>?)
              _fn) =>
      call(
          Images: _fn(_instance.Images?.map(
              (e) => CopyWith$Query$ProgramFindOne$programFindOne$Images(
                    e,
                    (i) => i,
                  )))?.toList());
  CopyWith$Query$ProgramFindOne$programFindOne$_count<TRes> get $_count {
    final local$$_count = _instance.$_count;
    return CopyWith$Query$ProgramFindOne$programFindOne$_count(
        local$$_count, (e) => call($_count: e));
  }
}

class _CopyWithStubImpl$Query$ProgramFindOne$programFindOne<TRes>
    implements CopyWith$Query$ProgramFindOne$programFindOne<TRes> {
  _CopyWithStubImpl$Query$ProgramFindOne$programFindOne(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? startDate,
    String? dueDate,
    String? description,
    Query$ProgramFindOne$programFindOne$category? category,
    List<Query$ProgramFindOne$programFindOne$Images>? Images,
    Query$ProgramFindOne$programFindOne$_count? $_count,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$ProgramFindOne$programFindOne$category<TRes> get category =>
      CopyWith$Query$ProgramFindOne$programFindOne$category.stub(_res);
  Images(_fn) => _res;
  CopyWith$Query$ProgramFindOne$programFindOne$_count<TRes> get $_count =>
      CopyWith$Query$ProgramFindOne$programFindOne$_count.stub(_res);
}

class Query$ProgramFindOne$programFindOne$category {
  Query$ProgramFindOne$programFindOne$category({
    required this.id,
    required this.name,
    required this.createdAt,
    this.$__typename = 'ProgramCategory',
  });

  factory Query$ProgramFindOne$programFindOne$category.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$ProgramFindOne$programFindOne$category(
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
    if (!(other is Query$ProgramFindOne$programFindOne$category) ||
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

extension UtilityExtension$Query$ProgramFindOne$programFindOne$category
    on Query$ProgramFindOne$programFindOne$category {
  CopyWith$Query$ProgramFindOne$programFindOne$category<
          Query$ProgramFindOne$programFindOne$category>
      get copyWith => CopyWith$Query$ProgramFindOne$programFindOne$category(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ProgramFindOne$programFindOne$category<TRes> {
  factory CopyWith$Query$ProgramFindOne$programFindOne$category(
    Query$ProgramFindOne$programFindOne$category instance,
    TRes Function(Query$ProgramFindOne$programFindOne$category) then,
  ) = _CopyWithImpl$Query$ProgramFindOne$programFindOne$category;

  factory CopyWith$Query$ProgramFindOne$programFindOne$category.stub(TRes res) =
      _CopyWithStubImpl$Query$ProgramFindOne$programFindOne$category;

  TRes call({
    int? id,
    String? name,
    String? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ProgramFindOne$programFindOne$category<TRes>
    implements CopyWith$Query$ProgramFindOne$programFindOne$category<TRes> {
  _CopyWithImpl$Query$ProgramFindOne$programFindOne$category(
    this._instance,
    this._then,
  );

  final Query$ProgramFindOne$programFindOne$category _instance;

  final TRes Function(Query$ProgramFindOne$programFindOne$category) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ProgramFindOne$programFindOne$category(
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

class _CopyWithStubImpl$Query$ProgramFindOne$programFindOne$category<TRes>
    implements CopyWith$Query$ProgramFindOne$programFindOne$category<TRes> {
  _CopyWithStubImpl$Query$ProgramFindOne$programFindOne$category(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? createdAt,
    String? $__typename,
  }) =>
      _res;
}

class Query$ProgramFindOne$programFindOne$Images {
  Query$ProgramFindOne$programFindOne$Images({
    required this.url,
    this.$__typename = 'Images',
  });

  factory Query$ProgramFindOne$programFindOne$Images.fromJson(
      Map<String, dynamic> json) {
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Query$ProgramFindOne$programFindOne$Images(
      url: (l$url as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$url = url;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$url,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$ProgramFindOne$programFindOne$Images) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
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

extension UtilityExtension$Query$ProgramFindOne$programFindOne$Images
    on Query$ProgramFindOne$programFindOne$Images {
  CopyWith$Query$ProgramFindOne$programFindOne$Images<
          Query$ProgramFindOne$programFindOne$Images>
      get copyWith => CopyWith$Query$ProgramFindOne$programFindOne$Images(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ProgramFindOne$programFindOne$Images<TRes> {
  factory CopyWith$Query$ProgramFindOne$programFindOne$Images(
    Query$ProgramFindOne$programFindOne$Images instance,
    TRes Function(Query$ProgramFindOne$programFindOne$Images) then,
  ) = _CopyWithImpl$Query$ProgramFindOne$programFindOne$Images;

  factory CopyWith$Query$ProgramFindOne$programFindOne$Images.stub(TRes res) =
      _CopyWithStubImpl$Query$ProgramFindOne$programFindOne$Images;

  TRes call({
    String? url,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ProgramFindOne$programFindOne$Images<TRes>
    implements CopyWith$Query$ProgramFindOne$programFindOne$Images<TRes> {
  _CopyWithImpl$Query$ProgramFindOne$programFindOne$Images(
    this._instance,
    this._then,
  );

  final Query$ProgramFindOne$programFindOne$Images _instance;

  final TRes Function(Query$ProgramFindOne$programFindOne$Images) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ProgramFindOne$programFindOne$Images(
        url: url == _undefined || url == null ? _instance.url : (url as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ProgramFindOne$programFindOne$Images<TRes>
    implements CopyWith$Query$ProgramFindOne$programFindOne$Images<TRes> {
  _CopyWithStubImpl$Query$ProgramFindOne$programFindOne$Images(this._res);

  TRes _res;

  call({
    String? url,
    String? $__typename,
  }) =>
      _res;
}

class Query$ProgramFindOne$programFindOne$_count {
  Query$ProgramFindOne$programFindOne$_count({
    required this.participant,
    this.$__typename = 'ProgramCount',
  });

  factory Query$ProgramFindOne$programFindOne$_count.fromJson(
      Map<String, dynamic> json) {
    final l$participant = json['participant'];
    final l$$__typename = json['__typename'];
    return Query$ProgramFindOne$programFindOne$_count(
      participant: (l$participant as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int participant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$participant = participant;
    _resultData['participant'] = l$participant;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$participant = participant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$participant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$ProgramFindOne$programFindOne$_count) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$participant = participant;
    final lOther$participant = other.participant;
    if (l$participant != lOther$participant) {
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

extension UtilityExtension$Query$ProgramFindOne$programFindOne$_count
    on Query$ProgramFindOne$programFindOne$_count {
  CopyWith$Query$ProgramFindOne$programFindOne$_count<
          Query$ProgramFindOne$programFindOne$_count>
      get copyWith => CopyWith$Query$ProgramFindOne$programFindOne$_count(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ProgramFindOne$programFindOne$_count<TRes> {
  factory CopyWith$Query$ProgramFindOne$programFindOne$_count(
    Query$ProgramFindOne$programFindOne$_count instance,
    TRes Function(Query$ProgramFindOne$programFindOne$_count) then,
  ) = _CopyWithImpl$Query$ProgramFindOne$programFindOne$_count;

  factory CopyWith$Query$ProgramFindOne$programFindOne$_count.stub(TRes res) =
      _CopyWithStubImpl$Query$ProgramFindOne$programFindOne$_count;

  TRes call({
    int? participant,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ProgramFindOne$programFindOne$_count<TRes>
    implements CopyWith$Query$ProgramFindOne$programFindOne$_count<TRes> {
  _CopyWithImpl$Query$ProgramFindOne$programFindOne$_count(
    this._instance,
    this._then,
  );

  final Query$ProgramFindOne$programFindOne$_count _instance;

  final TRes Function(Query$ProgramFindOne$programFindOne$_count) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? participant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ProgramFindOne$programFindOne$_count(
        participant: participant == _undefined || participant == null
            ? _instance.participant
            : (participant as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ProgramFindOne$programFindOne$_count<TRes>
    implements CopyWith$Query$ProgramFindOne$programFindOne$_count<TRes> {
  _CopyWithStubImpl$Query$ProgramFindOne$programFindOne$_count(this._res);

  TRes _res;

  call({
    int? participant,
    String? $__typename,
  }) =>
      _res;
}
