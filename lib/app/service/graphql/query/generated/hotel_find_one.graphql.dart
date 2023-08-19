import '../../schema/generated/schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$HotelFindOne {
  factory Variables$Query$HotelFindOne(
          {required Input$HotelFindUniqueArgs hotelFindUniqueArgs}) =>
      Variables$Query$HotelFindOne._({
        r'hotelFindUniqueArgs': hotelFindUniqueArgs,
      });

  Variables$Query$HotelFindOne._(this._$data);

  factory Variables$Query$HotelFindOne.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$hotelFindUniqueArgs = data['hotelFindUniqueArgs'];
    result$data['hotelFindUniqueArgs'] = Input$HotelFindUniqueArgs.fromJson(
        (l$hotelFindUniqueArgs as Map<String, dynamic>));
    return Variables$Query$HotelFindOne._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$HotelFindUniqueArgs get hotelFindUniqueArgs =>
      (_$data['hotelFindUniqueArgs'] as Input$HotelFindUniqueArgs);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$hotelFindUniqueArgs = hotelFindUniqueArgs;
    result$data['hotelFindUniqueArgs'] = l$hotelFindUniqueArgs.toJson();
    return result$data;
  }

  CopyWith$Variables$Query$HotelFindOne<Variables$Query$HotelFindOne>
      get copyWith => CopyWith$Variables$Query$HotelFindOne(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$HotelFindOne) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hotelFindUniqueArgs = hotelFindUniqueArgs;
    final lOther$hotelFindUniqueArgs = other.hotelFindUniqueArgs;
    if (l$hotelFindUniqueArgs != lOther$hotelFindUniqueArgs) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$hotelFindUniqueArgs = hotelFindUniqueArgs;
    return Object.hashAll([l$hotelFindUniqueArgs]);
  }
}

abstract class CopyWith$Variables$Query$HotelFindOne<TRes> {
  factory CopyWith$Variables$Query$HotelFindOne(
    Variables$Query$HotelFindOne instance,
    TRes Function(Variables$Query$HotelFindOne) then,
  ) = _CopyWithImpl$Variables$Query$HotelFindOne;

  factory CopyWith$Variables$Query$HotelFindOne.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$HotelFindOne;

  TRes call({Input$HotelFindUniqueArgs? hotelFindUniqueArgs});
}

class _CopyWithImpl$Variables$Query$HotelFindOne<TRes>
    implements CopyWith$Variables$Query$HotelFindOne<TRes> {
  _CopyWithImpl$Variables$Query$HotelFindOne(
    this._instance,
    this._then,
  );

  final Variables$Query$HotelFindOne _instance;

  final TRes Function(Variables$Query$HotelFindOne) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? hotelFindUniqueArgs = _undefined}) =>
      _then(Variables$Query$HotelFindOne._({
        ..._instance._$data,
        if (hotelFindUniqueArgs != _undefined && hotelFindUniqueArgs != null)
          'hotelFindUniqueArgs':
              (hotelFindUniqueArgs as Input$HotelFindUniqueArgs),
      }));
}

class _CopyWithStubImpl$Variables$Query$HotelFindOne<TRes>
    implements CopyWith$Variables$Query$HotelFindOne<TRes> {
  _CopyWithStubImpl$Variables$Query$HotelFindOne(this._res);

  TRes _res;

  call({Input$HotelFindUniqueArgs? hotelFindUniqueArgs}) => _res;
}

class Query$HotelFindOne {
  Query$HotelFindOne({
    this.hotelFindOne,
    this.$__typename = 'Query',
  });

  factory Query$HotelFindOne.fromJson(Map<String, dynamic> json) {
    final l$hotelFindOne = json['hotelFindOne'];
    final l$$__typename = json['__typename'];
    return Query$HotelFindOne(
      hotelFindOne: l$hotelFindOne == null
          ? null
          : Query$HotelFindOne$hotelFindOne.fromJson(
              (l$hotelFindOne as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$HotelFindOne$hotelFindOne? hotelFindOne;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hotelFindOne = hotelFindOne;
    _resultData['hotelFindOne'] = l$hotelFindOne?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hotelFindOne = hotelFindOne;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$hotelFindOne,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$HotelFindOne) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$hotelFindOne = hotelFindOne;
    final lOther$hotelFindOne = other.hotelFindOne;
    if (l$hotelFindOne != lOther$hotelFindOne) {
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

extension UtilityExtension$Query$HotelFindOne on Query$HotelFindOne {
  CopyWith$Query$HotelFindOne<Query$HotelFindOne> get copyWith =>
      CopyWith$Query$HotelFindOne(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$HotelFindOne<TRes> {
  factory CopyWith$Query$HotelFindOne(
    Query$HotelFindOne instance,
    TRes Function(Query$HotelFindOne) then,
  ) = _CopyWithImpl$Query$HotelFindOne;

  factory CopyWith$Query$HotelFindOne.stub(TRes res) =
      _CopyWithStubImpl$Query$HotelFindOne;

  TRes call({
    Query$HotelFindOne$hotelFindOne? hotelFindOne,
    String? $__typename,
  });
  CopyWith$Query$HotelFindOne$hotelFindOne<TRes> get hotelFindOne;
}

class _CopyWithImpl$Query$HotelFindOne<TRes>
    implements CopyWith$Query$HotelFindOne<TRes> {
  _CopyWithImpl$Query$HotelFindOne(
    this._instance,
    this._then,
  );

  final Query$HotelFindOne _instance;

  final TRes Function(Query$HotelFindOne) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hotelFindOne = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$HotelFindOne(
        hotelFindOne: hotelFindOne == _undefined
            ? _instance.hotelFindOne
            : (hotelFindOne as Query$HotelFindOne$hotelFindOne?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$HotelFindOne$hotelFindOne<TRes> get hotelFindOne {
    final local$hotelFindOne = _instance.hotelFindOne;
    return local$hotelFindOne == null
        ? CopyWith$Query$HotelFindOne$hotelFindOne.stub(_then(_instance))
        : CopyWith$Query$HotelFindOne$hotelFindOne(
            local$hotelFindOne, (e) => call(hotelFindOne: e));
  }
}

class _CopyWithStubImpl$Query$HotelFindOne<TRes>
    implements CopyWith$Query$HotelFindOne<TRes> {
  _CopyWithStubImpl$Query$HotelFindOne(this._res);

  TRes _res;

  call({
    Query$HotelFindOne$hotelFindOne? hotelFindOne,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$HotelFindOne$hotelFindOne<TRes> get hotelFindOne =>
      CopyWith$Query$HotelFindOne$hotelFindOne.stub(_res);
}

const documentNodeQueryHotelFindOne = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'HotelFindOne'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'hotelFindUniqueArgs')),
        type: NamedTypeNode(
          name: NameNode(value: 'HotelFindUniqueArgs'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'hotelFindOne'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'hotelFindUniqueArgs'),
            value: VariableNode(name: NameNode(value: 'hotelFindUniqueArgs')),
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
            name: NameNode(value: 'description'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'rating'),
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
            name: NameNode(value: 'quota'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdById'),
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
            name: NameNode(value: '_count'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'checkIns'),
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
            name: NameNode(value: 'images'),
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
                name: NameNode(value: 'city'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
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
                name: NameNode(value: 'district'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
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
                name: NameNode(value: 'postalCode'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'code'),
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
            name: NameNode(value: 'checkIns'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'user'),
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
                    name: NameNode(value: 'avatarUrl'),
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
                name: NameNode(value: 'checkInAt'),
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
Query$HotelFindOne _parserFn$Query$HotelFindOne(Map<String, dynamic> data) =>
    Query$HotelFindOne.fromJson(data);
typedef OnQueryComplete$Query$HotelFindOne = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$HotelFindOne?,
);

class Options$Query$HotelFindOne
    extends graphql.QueryOptions<Query$HotelFindOne> {
  Options$Query$HotelFindOne({
    String? operationName,
    required Variables$Query$HotelFindOne variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$HotelFindOne? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$HotelFindOne? onComplete,
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
                    data == null ? null : _parserFn$Query$HotelFindOne(data),
                  ),
          onError: onError,
          document: documentNodeQueryHotelFindOne,
          parserFn: _parserFn$Query$HotelFindOne,
        );

  final OnQueryComplete$Query$HotelFindOne? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$HotelFindOne
    extends graphql.WatchQueryOptions<Query$HotelFindOne> {
  WatchOptions$Query$HotelFindOne({
    String? operationName,
    required Variables$Query$HotelFindOne variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$HotelFindOne? typedOptimisticResult,
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
          document: documentNodeQueryHotelFindOne,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$HotelFindOne,
        );
}

class FetchMoreOptions$Query$HotelFindOne extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$HotelFindOne({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$HotelFindOne variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryHotelFindOne,
        );
}

extension ClientExtension$Query$HotelFindOne on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$HotelFindOne>> query$HotelFindOne(
          Options$Query$HotelFindOne options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$HotelFindOne> watchQuery$HotelFindOne(
          WatchOptions$Query$HotelFindOne options) =>
      this.watchQuery(options);
  void writeQuery$HotelFindOne({
    required Query$HotelFindOne data,
    required Variables$Query$HotelFindOne variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryHotelFindOne),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$HotelFindOne? readQuery$HotelFindOne({
    required Variables$Query$HotelFindOne variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryHotelFindOne),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$HotelFindOne.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$HotelFindOne> useQuery$HotelFindOne(
        Options$Query$HotelFindOne options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$HotelFindOne> useWatchQuery$HotelFindOne(
        WatchOptions$Query$HotelFindOne options) =>
    graphql_flutter.useWatchQuery(options);

class Query$HotelFindOne$Widget
    extends graphql_flutter.Query<Query$HotelFindOne> {
  Query$HotelFindOne$Widget({
    widgets.Key? key,
    required Options$Query$HotelFindOne options,
    required graphql_flutter.QueryBuilder<Query$HotelFindOne> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$HotelFindOne$hotelFindOne {
  Query$HotelFindOne$hotelFindOne({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.startDate,
    required this.quota,
    required this.createdById,
    required this.createdAt,
    required this.updatedAt,
    required this.$_count,
    this.images,
    required this.address,
    this.checkIns,
    this.$__typename = 'Hotel',
  });

  factory Query$HotelFindOne$hotelFindOne.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$rating = json['rating'];
    final l$startDate = json['startDate'];
    final l$quota = json['quota'];
    final l$createdById = json['createdById'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$_count = json['_count'];
    final l$images = json['images'];
    final l$address = json['address'];
    final l$checkIns = json['checkIns'];
    final l$$__typename = json['__typename'];
    return Query$HotelFindOne$hotelFindOne(
      id: (l$id as int),
      name: (l$name as String),
      description: (l$description as String),
      rating: (l$rating as num).toDouble(),
      startDate: (l$startDate as String),
      quota: (l$quota as int),
      createdById: (l$createdById as String),
      createdAt: (l$createdAt as String),
      updatedAt: (l$updatedAt as String),
      $_count: Query$HotelFindOne$hotelFindOne$_count.fromJson(
          (l$$_count as Map<String, dynamic>)),
      images: (l$images as List<dynamic>?)
          ?.map((e) => Query$HotelFindOne$hotelFindOne$images.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      address: Query$HotelFindOne$hotelFindOne$address.fromJson(
          (l$address as Map<String, dynamic>)),
      checkIns: (l$checkIns as List<dynamic>?)
          ?.map((e) => Query$HotelFindOne$hotelFindOne$checkIns.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final String description;

  final double rating;

  final String startDate;

  final int quota;

  final String createdById;

  final String createdAt;

  final String updatedAt;

  final Query$HotelFindOne$hotelFindOne$_count $_count;

  final List<Query$HotelFindOne$hotelFindOne$images>? images;

  final Query$HotelFindOne$hotelFindOne$address address;

  final List<Query$HotelFindOne$hotelFindOne$checkIns>? checkIns;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$rating = rating;
    _resultData['rating'] = l$rating;
    final l$startDate = startDate;
    _resultData['startDate'] = l$startDate;
    final l$quota = quota;
    _resultData['quota'] = l$quota;
    final l$createdById = createdById;
    _resultData['createdById'] = l$createdById;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$$_count = $_count;
    _resultData['_count'] = l$$_count.toJson();
    final l$images = images;
    _resultData['images'] = l$images?.map((e) => e.toJson()).toList();
    final l$address = address;
    _resultData['address'] = l$address.toJson();
    final l$checkIns = checkIns;
    _resultData['checkIns'] = l$checkIns?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$rating = rating;
    final l$startDate = startDate;
    final l$quota = quota;
    final l$createdById = createdById;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$_count = $_count;
    final l$images = images;
    final l$address = address;
    final l$checkIns = checkIns;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$rating,
      l$startDate,
      l$quota,
      l$createdById,
      l$createdAt,
      l$updatedAt,
      l$$_count,
      l$images == null ? null : Object.hashAll(l$images.map((v) => v)),
      l$address,
      l$checkIns == null ? null : Object.hashAll(l$checkIns.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$HotelFindOne$hotelFindOne) ||
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
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$rating = rating;
    final lOther$rating = other.rating;
    if (l$rating != lOther$rating) {
      return false;
    }
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$quota = quota;
    final lOther$quota = other.quota;
    if (l$quota != lOther$quota) {
      return false;
    }
    final l$createdById = createdById;
    final lOther$createdById = other.createdById;
    if (l$createdById != lOther$createdById) {
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
    final l$$_count = $_count;
    final lOther$$_count = other.$_count;
    if (l$$_count != lOther$$_count) {
      return false;
    }
    final l$images = images;
    final lOther$images = other.images;
    if (l$images != null && lOther$images != null) {
      if (l$images.length != lOther$images.length) {
        return false;
      }
      for (int i = 0; i < l$images.length; i++) {
        final l$images$entry = l$images[i];
        final lOther$images$entry = lOther$images[i];
        if (l$images$entry != lOther$images$entry) {
          return false;
        }
      }
    } else if (l$images != lOther$images) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    final l$checkIns = checkIns;
    final lOther$checkIns = other.checkIns;
    if (l$checkIns != null && lOther$checkIns != null) {
      if (l$checkIns.length != lOther$checkIns.length) {
        return false;
      }
      for (int i = 0; i < l$checkIns.length; i++) {
        final l$checkIns$entry = l$checkIns[i];
        final lOther$checkIns$entry = lOther$checkIns[i];
        if (l$checkIns$entry != lOther$checkIns$entry) {
          return false;
        }
      }
    } else if (l$checkIns != lOther$checkIns) {
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

extension UtilityExtension$Query$HotelFindOne$hotelFindOne
    on Query$HotelFindOne$hotelFindOne {
  CopyWith$Query$HotelFindOne$hotelFindOne<Query$HotelFindOne$hotelFindOne>
      get copyWith => CopyWith$Query$HotelFindOne$hotelFindOne(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$HotelFindOne$hotelFindOne<TRes> {
  factory CopyWith$Query$HotelFindOne$hotelFindOne(
    Query$HotelFindOne$hotelFindOne instance,
    TRes Function(Query$HotelFindOne$hotelFindOne) then,
  ) = _CopyWithImpl$Query$HotelFindOne$hotelFindOne;

  factory CopyWith$Query$HotelFindOne$hotelFindOne.stub(TRes res) =
      _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne;

  TRes call({
    int? id,
    String? name,
    String? description,
    double? rating,
    String? startDate,
    int? quota,
    String? createdById,
    String? createdAt,
    String? updatedAt,
    Query$HotelFindOne$hotelFindOne$_count? $_count,
    List<Query$HotelFindOne$hotelFindOne$images>? images,
    Query$HotelFindOne$hotelFindOne$address? address,
    List<Query$HotelFindOne$hotelFindOne$checkIns>? checkIns,
    String? $__typename,
  });
  CopyWith$Query$HotelFindOne$hotelFindOne$_count<TRes> get $_count;
  TRes images(
      Iterable<Query$HotelFindOne$hotelFindOne$images>? Function(
              Iterable<
                  CopyWith$Query$HotelFindOne$hotelFindOne$images<
                      Query$HotelFindOne$hotelFindOne$images>>?)
          _fn);
  CopyWith$Query$HotelFindOne$hotelFindOne$address<TRes> get address;
  TRes checkIns(
      Iterable<Query$HotelFindOne$hotelFindOne$checkIns>? Function(
              Iterable<
                  CopyWith$Query$HotelFindOne$hotelFindOne$checkIns<
                      Query$HotelFindOne$hotelFindOne$checkIns>>?)
          _fn);
}

class _CopyWithImpl$Query$HotelFindOne$hotelFindOne<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne<TRes> {
  _CopyWithImpl$Query$HotelFindOne$hotelFindOne(
    this._instance,
    this._then,
  );

  final Query$HotelFindOne$hotelFindOne _instance;

  final TRes Function(Query$HotelFindOne$hotelFindOne) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? rating = _undefined,
    Object? startDate = _undefined,
    Object? quota = _undefined,
    Object? createdById = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $_count = _undefined,
    Object? images = _undefined,
    Object? address = _undefined,
    Object? checkIns = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$HotelFindOne$hotelFindOne(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        description: description == _undefined || description == null
            ? _instance.description
            : (description as String),
        rating: rating == _undefined || rating == null
            ? _instance.rating
            : (rating as double),
        startDate: startDate == _undefined || startDate == null
            ? _instance.startDate
            : (startDate as String),
        quota: quota == _undefined || quota == null
            ? _instance.quota
            : (quota as int),
        createdById: createdById == _undefined || createdById == null
            ? _instance.createdById
            : (createdById as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as String),
        $_count: $_count == _undefined || $_count == null
            ? _instance.$_count
            : ($_count as Query$HotelFindOne$hotelFindOne$_count),
        images: images == _undefined
            ? _instance.images
            : (images as List<Query$HotelFindOne$hotelFindOne$images>?),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as Query$HotelFindOne$hotelFindOne$address),
        checkIns: checkIns == _undefined
            ? _instance.checkIns
            : (checkIns as List<Query$HotelFindOne$hotelFindOne$checkIns>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$HotelFindOne$hotelFindOne$_count<TRes> get $_count {
    final local$$_count = _instance.$_count;
    return CopyWith$Query$HotelFindOne$hotelFindOne$_count(
        local$$_count, (e) => call($_count: e));
  }

  TRes images(
          Iterable<Query$HotelFindOne$hotelFindOne$images>? Function(
                  Iterable<
                      CopyWith$Query$HotelFindOne$hotelFindOne$images<
                          Query$HotelFindOne$hotelFindOne$images>>?)
              _fn) =>
      call(
          images: _fn(_instance.images
              ?.map((e) => CopyWith$Query$HotelFindOne$hotelFindOne$images(
                    e,
                    (i) => i,
                  )))?.toList());
  CopyWith$Query$HotelFindOne$hotelFindOne$address<TRes> get address {
    final local$address = _instance.address;
    return CopyWith$Query$HotelFindOne$hotelFindOne$address(
        local$address, (e) => call(address: e));
  }

  TRes checkIns(
          Iterable<Query$HotelFindOne$hotelFindOne$checkIns>? Function(
                  Iterable<
                      CopyWith$Query$HotelFindOne$hotelFindOne$checkIns<
                          Query$HotelFindOne$hotelFindOne$checkIns>>?)
              _fn) =>
      call(
          checkIns: _fn(_instance.checkIns
              ?.map((e) => CopyWith$Query$HotelFindOne$hotelFindOne$checkIns(
                    e,
                    (i) => i,
                  )))?.toList());
}

class _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne<TRes> {
  _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? description,
    double? rating,
    String? startDate,
    int? quota,
    String? createdById,
    String? createdAt,
    String? updatedAt,
    Query$HotelFindOne$hotelFindOne$_count? $_count,
    List<Query$HotelFindOne$hotelFindOne$images>? images,
    Query$HotelFindOne$hotelFindOne$address? address,
    List<Query$HotelFindOne$hotelFindOne$checkIns>? checkIns,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$HotelFindOne$hotelFindOne$_count<TRes> get $_count =>
      CopyWith$Query$HotelFindOne$hotelFindOne$_count.stub(_res);
  images(_fn) => _res;
  CopyWith$Query$HotelFindOne$hotelFindOne$address<TRes> get address =>
      CopyWith$Query$HotelFindOne$hotelFindOne$address.stub(_res);
  checkIns(_fn) => _res;
}

class Query$HotelFindOne$hotelFindOne$_count {
  Query$HotelFindOne$hotelFindOne$_count({
    required this.checkIns,
    this.$__typename = 'HotelCount',
  });

  factory Query$HotelFindOne$hotelFindOne$_count.fromJson(
      Map<String, dynamic> json) {
    final l$checkIns = json['checkIns'];
    final l$$__typename = json['__typename'];
    return Query$HotelFindOne$hotelFindOne$_count(
      checkIns: (l$checkIns as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int checkIns;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$checkIns = checkIns;
    _resultData['checkIns'] = l$checkIns;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$checkIns = checkIns;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$checkIns,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$HotelFindOne$hotelFindOne$_count) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$checkIns = checkIns;
    final lOther$checkIns = other.checkIns;
    if (l$checkIns != lOther$checkIns) {
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

extension UtilityExtension$Query$HotelFindOne$hotelFindOne$_count
    on Query$HotelFindOne$hotelFindOne$_count {
  CopyWith$Query$HotelFindOne$hotelFindOne$_count<
          Query$HotelFindOne$hotelFindOne$_count>
      get copyWith => CopyWith$Query$HotelFindOne$hotelFindOne$_count(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$HotelFindOne$hotelFindOne$_count<TRes> {
  factory CopyWith$Query$HotelFindOne$hotelFindOne$_count(
    Query$HotelFindOne$hotelFindOne$_count instance,
    TRes Function(Query$HotelFindOne$hotelFindOne$_count) then,
  ) = _CopyWithImpl$Query$HotelFindOne$hotelFindOne$_count;

  factory CopyWith$Query$HotelFindOne$hotelFindOne$_count.stub(TRes res) =
      _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$_count;

  TRes call({
    int? checkIns,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$HotelFindOne$hotelFindOne$_count<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne$_count<TRes> {
  _CopyWithImpl$Query$HotelFindOne$hotelFindOne$_count(
    this._instance,
    this._then,
  );

  final Query$HotelFindOne$hotelFindOne$_count _instance;

  final TRes Function(Query$HotelFindOne$hotelFindOne$_count) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? checkIns = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$HotelFindOne$hotelFindOne$_count(
        checkIns: checkIns == _undefined || checkIns == null
            ? _instance.checkIns
            : (checkIns as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$_count<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne$_count<TRes> {
  _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$_count(this._res);

  TRes _res;

  call({
    int? checkIns,
    String? $__typename,
  }) =>
      _res;
}

class Query$HotelFindOne$hotelFindOne$images {
  Query$HotelFindOne$hotelFindOne$images({
    required this.url,
    this.$__typename = 'Images',
  });

  factory Query$HotelFindOne$hotelFindOne$images.fromJson(
      Map<String, dynamic> json) {
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Query$HotelFindOne$hotelFindOne$images(
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
    if (!(other is Query$HotelFindOne$hotelFindOne$images) ||
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

extension UtilityExtension$Query$HotelFindOne$hotelFindOne$images
    on Query$HotelFindOne$hotelFindOne$images {
  CopyWith$Query$HotelFindOne$hotelFindOne$images<
          Query$HotelFindOne$hotelFindOne$images>
      get copyWith => CopyWith$Query$HotelFindOne$hotelFindOne$images(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$HotelFindOne$hotelFindOne$images<TRes> {
  factory CopyWith$Query$HotelFindOne$hotelFindOne$images(
    Query$HotelFindOne$hotelFindOne$images instance,
    TRes Function(Query$HotelFindOne$hotelFindOne$images) then,
  ) = _CopyWithImpl$Query$HotelFindOne$hotelFindOne$images;

  factory CopyWith$Query$HotelFindOne$hotelFindOne$images.stub(TRes res) =
      _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$images;

  TRes call({
    String? url,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$HotelFindOne$hotelFindOne$images<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne$images<TRes> {
  _CopyWithImpl$Query$HotelFindOne$hotelFindOne$images(
    this._instance,
    this._then,
  );

  final Query$HotelFindOne$hotelFindOne$images _instance;

  final TRes Function(Query$HotelFindOne$hotelFindOne$images) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$HotelFindOne$hotelFindOne$images(
        url: url == _undefined || url == null ? _instance.url : (url as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$images<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne$images<TRes> {
  _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$images(this._res);

  TRes _res;

  call({
    String? url,
    String? $__typename,
  }) =>
      _res;
}

class Query$HotelFindOne$hotelFindOne$address {
  Query$HotelFindOne$hotelFindOne$address({
    required this.id,
    required this.name,
    required this.city,
    required this.district,
    required this.postalCode,
    this.$__typename = 'Address',
  });

  factory Query$HotelFindOne$hotelFindOne$address.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$city = json['city'];
    final l$district = json['district'];
    final l$postalCode = json['postalCode'];
    final l$$__typename = json['__typename'];
    return Query$HotelFindOne$hotelFindOne$address(
      id: (l$id as int),
      name: (l$name as String),
      city: Query$HotelFindOne$hotelFindOne$address$city.fromJson(
          (l$city as Map<String, dynamic>)),
      district: Query$HotelFindOne$hotelFindOne$address$district.fromJson(
          (l$district as Map<String, dynamic>)),
      postalCode: Query$HotelFindOne$hotelFindOne$address$postalCode.fromJson(
          (l$postalCode as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final int id;

  final String name;

  final Query$HotelFindOne$hotelFindOne$address$city city;

  final Query$HotelFindOne$hotelFindOne$address$district district;

  final Query$HotelFindOne$hotelFindOne$address$postalCode postalCode;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$city = city;
    _resultData['city'] = l$city.toJson();
    final l$district = district;
    _resultData['district'] = l$district.toJson();
    final l$postalCode = postalCode;
    _resultData['postalCode'] = l$postalCode.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$city = city;
    final l$district = district;
    final l$postalCode = postalCode;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$city,
      l$district,
      l$postalCode,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$HotelFindOne$hotelFindOne$address) ||
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
    final l$district = district;
    final lOther$district = other.district;
    if (l$district != lOther$district) {
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

extension UtilityExtension$Query$HotelFindOne$hotelFindOne$address
    on Query$HotelFindOne$hotelFindOne$address {
  CopyWith$Query$HotelFindOne$hotelFindOne$address<
          Query$HotelFindOne$hotelFindOne$address>
      get copyWith => CopyWith$Query$HotelFindOne$hotelFindOne$address(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$HotelFindOne$hotelFindOne$address<TRes> {
  factory CopyWith$Query$HotelFindOne$hotelFindOne$address(
    Query$HotelFindOne$hotelFindOne$address instance,
    TRes Function(Query$HotelFindOne$hotelFindOne$address) then,
  ) = _CopyWithImpl$Query$HotelFindOne$hotelFindOne$address;

  factory CopyWith$Query$HotelFindOne$hotelFindOne$address.stub(TRes res) =
      _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$address;

  TRes call({
    int? id,
    String? name,
    Query$HotelFindOne$hotelFindOne$address$city? city,
    Query$HotelFindOne$hotelFindOne$address$district? district,
    Query$HotelFindOne$hotelFindOne$address$postalCode? postalCode,
    String? $__typename,
  });
  CopyWith$Query$HotelFindOne$hotelFindOne$address$city<TRes> get city;
  CopyWith$Query$HotelFindOne$hotelFindOne$address$district<TRes> get district;
  CopyWith$Query$HotelFindOne$hotelFindOne$address$postalCode<TRes>
      get postalCode;
}

class _CopyWithImpl$Query$HotelFindOne$hotelFindOne$address<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne$address<TRes> {
  _CopyWithImpl$Query$HotelFindOne$hotelFindOne$address(
    this._instance,
    this._then,
  );

  final Query$HotelFindOne$hotelFindOne$address _instance;

  final TRes Function(Query$HotelFindOne$hotelFindOne$address) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? city = _undefined,
    Object? district = _undefined,
    Object? postalCode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$HotelFindOne$hotelFindOne$address(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        city: city == _undefined || city == null
            ? _instance.city
            : (city as Query$HotelFindOne$hotelFindOne$address$city),
        district: district == _undefined || district == null
            ? _instance.district
            : (district as Query$HotelFindOne$hotelFindOne$address$district),
        postalCode: postalCode == _undefined || postalCode == null
            ? _instance.postalCode
            : (postalCode
                as Query$HotelFindOne$hotelFindOne$address$postalCode),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$HotelFindOne$hotelFindOne$address$city<TRes> get city {
    final local$city = _instance.city;
    return CopyWith$Query$HotelFindOne$hotelFindOne$address$city(
        local$city, (e) => call(city: e));
  }

  CopyWith$Query$HotelFindOne$hotelFindOne$address$district<TRes> get district {
    final local$district = _instance.district;
    return CopyWith$Query$HotelFindOne$hotelFindOne$address$district(
        local$district, (e) => call(district: e));
  }

  CopyWith$Query$HotelFindOne$hotelFindOne$address$postalCode<TRes>
      get postalCode {
    final local$postalCode = _instance.postalCode;
    return CopyWith$Query$HotelFindOne$hotelFindOne$address$postalCode(
        local$postalCode, (e) => call(postalCode: e));
  }
}

class _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$address<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne$address<TRes> {
  _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$address(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    Query$HotelFindOne$hotelFindOne$address$city? city,
    Query$HotelFindOne$hotelFindOne$address$district? district,
    Query$HotelFindOne$hotelFindOne$address$postalCode? postalCode,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$HotelFindOne$hotelFindOne$address$city<TRes> get city =>
      CopyWith$Query$HotelFindOne$hotelFindOne$address$city.stub(_res);
  CopyWith$Query$HotelFindOne$hotelFindOne$address$district<TRes>
      get district =>
          CopyWith$Query$HotelFindOne$hotelFindOne$address$district.stub(_res);
  CopyWith$Query$HotelFindOne$hotelFindOne$address$postalCode<TRes>
      get postalCode =>
          CopyWith$Query$HotelFindOne$hotelFindOne$address$postalCode.stub(
              _res);
}

class Query$HotelFindOne$hotelFindOne$address$city {
  Query$HotelFindOne$hotelFindOne$address$city({
    required this.name,
    this.$__typename = 'City',
  });

  factory Query$HotelFindOne$hotelFindOne$address$city.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$HotelFindOne$hotelFindOne$address$city(
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$HotelFindOne$hotelFindOne$address$city) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$HotelFindOne$hotelFindOne$address$city
    on Query$HotelFindOne$hotelFindOne$address$city {
  CopyWith$Query$HotelFindOne$hotelFindOne$address$city<
          Query$HotelFindOne$hotelFindOne$address$city>
      get copyWith => CopyWith$Query$HotelFindOne$hotelFindOne$address$city(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$HotelFindOne$hotelFindOne$address$city<TRes> {
  factory CopyWith$Query$HotelFindOne$hotelFindOne$address$city(
    Query$HotelFindOne$hotelFindOne$address$city instance,
    TRes Function(Query$HotelFindOne$hotelFindOne$address$city) then,
  ) = _CopyWithImpl$Query$HotelFindOne$hotelFindOne$address$city;

  factory CopyWith$Query$HotelFindOne$hotelFindOne$address$city.stub(TRes res) =
      _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$address$city;

  TRes call({
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$HotelFindOne$hotelFindOne$address$city<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne$address$city<TRes> {
  _CopyWithImpl$Query$HotelFindOne$hotelFindOne$address$city(
    this._instance,
    this._then,
  );

  final Query$HotelFindOne$hotelFindOne$address$city _instance;

  final TRes Function(Query$HotelFindOne$hotelFindOne$address$city) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$HotelFindOne$hotelFindOne$address$city(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$address$city<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne$address$city<TRes> {
  _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$address$city(this._res);

  TRes _res;

  call({
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$HotelFindOne$hotelFindOne$address$district {
  Query$HotelFindOne$hotelFindOne$address$district({
    required this.name,
    this.$__typename = 'District',
  });

  factory Query$HotelFindOne$hotelFindOne$address$district.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$HotelFindOne$hotelFindOne$address$district(
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$HotelFindOne$hotelFindOne$address$district) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$HotelFindOne$hotelFindOne$address$district
    on Query$HotelFindOne$hotelFindOne$address$district {
  CopyWith$Query$HotelFindOne$hotelFindOne$address$district<
          Query$HotelFindOne$hotelFindOne$address$district>
      get copyWith => CopyWith$Query$HotelFindOne$hotelFindOne$address$district(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$HotelFindOne$hotelFindOne$address$district<TRes> {
  factory CopyWith$Query$HotelFindOne$hotelFindOne$address$district(
    Query$HotelFindOne$hotelFindOne$address$district instance,
    TRes Function(Query$HotelFindOne$hotelFindOne$address$district) then,
  ) = _CopyWithImpl$Query$HotelFindOne$hotelFindOne$address$district;

  factory CopyWith$Query$HotelFindOne$hotelFindOne$address$district.stub(
          TRes res) =
      _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$address$district;

  TRes call({
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$HotelFindOne$hotelFindOne$address$district<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne$address$district<TRes> {
  _CopyWithImpl$Query$HotelFindOne$hotelFindOne$address$district(
    this._instance,
    this._then,
  );

  final Query$HotelFindOne$hotelFindOne$address$district _instance;

  final TRes Function(Query$HotelFindOne$hotelFindOne$address$district) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$HotelFindOne$hotelFindOne$address$district(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$address$district<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne$address$district<TRes> {
  _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$address$district(this._res);

  TRes _res;

  call({
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$HotelFindOne$hotelFindOne$address$postalCode {
  Query$HotelFindOne$hotelFindOne$address$postalCode({
    required this.code,
    this.$__typename = 'PostalCode',
  });

  factory Query$HotelFindOne$hotelFindOne$address$postalCode.fromJson(
      Map<String, dynamic> json) {
    final l$code = json['code'];
    final l$$__typename = json['__typename'];
    return Query$HotelFindOne$hotelFindOne$address$postalCode(
      code: (l$code as int),
      $__typename: (l$$__typename as String),
    );
  }

  final int code;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$code = code;
    _resultData['code'] = l$code;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$code = code;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$code,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$HotelFindOne$hotelFindOne$address$postalCode) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) {
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

extension UtilityExtension$Query$HotelFindOne$hotelFindOne$address$postalCode
    on Query$HotelFindOne$hotelFindOne$address$postalCode {
  CopyWith$Query$HotelFindOne$hotelFindOne$address$postalCode<
          Query$HotelFindOne$hotelFindOne$address$postalCode>
      get copyWith =>
          CopyWith$Query$HotelFindOne$hotelFindOne$address$postalCode(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$HotelFindOne$hotelFindOne$address$postalCode<
    TRes> {
  factory CopyWith$Query$HotelFindOne$hotelFindOne$address$postalCode(
    Query$HotelFindOne$hotelFindOne$address$postalCode instance,
    TRes Function(Query$HotelFindOne$hotelFindOne$address$postalCode) then,
  ) = _CopyWithImpl$Query$HotelFindOne$hotelFindOne$address$postalCode;

  factory CopyWith$Query$HotelFindOne$hotelFindOne$address$postalCode.stub(
          TRes res) =
      _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$address$postalCode;

  TRes call({
    int? code,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$HotelFindOne$hotelFindOne$address$postalCode<TRes>
    implements
        CopyWith$Query$HotelFindOne$hotelFindOne$address$postalCode<TRes> {
  _CopyWithImpl$Query$HotelFindOne$hotelFindOne$address$postalCode(
    this._instance,
    this._then,
  );

  final Query$HotelFindOne$hotelFindOne$address$postalCode _instance;

  final TRes Function(Query$HotelFindOne$hotelFindOne$address$postalCode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? code = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$HotelFindOne$hotelFindOne$address$postalCode(
        code:
            code == _undefined || code == null ? _instance.code : (code as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$address$postalCode<TRes>
    implements
        CopyWith$Query$HotelFindOne$hotelFindOne$address$postalCode<TRes> {
  _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$address$postalCode(
      this._res);

  TRes _res;

  call({
    int? code,
    String? $__typename,
  }) =>
      _res;
}

class Query$HotelFindOne$hotelFindOne$checkIns {
  Query$HotelFindOne$hotelFindOne$checkIns({
    required this.user,
    required this.checkInAt,
    required this.createdAt,
    this.$__typename = 'CheckIn',
  });

  factory Query$HotelFindOne$hotelFindOne$checkIns.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$checkInAt = json['checkInAt'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$HotelFindOne$hotelFindOne$checkIns(
      user: Query$HotelFindOne$hotelFindOne$checkIns$user.fromJson(
          (l$user as Map<String, dynamic>)),
      checkInAt: (l$checkInAt as String),
      createdAt: (l$createdAt as String),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$HotelFindOne$hotelFindOne$checkIns$user user;

  final String checkInAt;

  final String createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$checkInAt = checkInAt;
    _resultData['checkInAt'] = l$checkInAt;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$checkInAt = checkInAt;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$checkInAt,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$HotelFindOne$hotelFindOne$checkIns) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$checkInAt = checkInAt;
    final lOther$checkInAt = other.checkInAt;
    if (l$checkInAt != lOther$checkInAt) {
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

extension UtilityExtension$Query$HotelFindOne$hotelFindOne$checkIns
    on Query$HotelFindOne$hotelFindOne$checkIns {
  CopyWith$Query$HotelFindOne$hotelFindOne$checkIns<
          Query$HotelFindOne$hotelFindOne$checkIns>
      get copyWith => CopyWith$Query$HotelFindOne$hotelFindOne$checkIns(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$HotelFindOne$hotelFindOne$checkIns<TRes> {
  factory CopyWith$Query$HotelFindOne$hotelFindOne$checkIns(
    Query$HotelFindOne$hotelFindOne$checkIns instance,
    TRes Function(Query$HotelFindOne$hotelFindOne$checkIns) then,
  ) = _CopyWithImpl$Query$HotelFindOne$hotelFindOne$checkIns;

  factory CopyWith$Query$HotelFindOne$hotelFindOne$checkIns.stub(TRes res) =
      _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$checkIns;

  TRes call({
    Query$HotelFindOne$hotelFindOne$checkIns$user? user,
    String? checkInAt,
    String? createdAt,
    String? $__typename,
  });
  CopyWith$Query$HotelFindOne$hotelFindOne$checkIns$user<TRes> get user;
}

class _CopyWithImpl$Query$HotelFindOne$hotelFindOne$checkIns<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne$checkIns<TRes> {
  _CopyWithImpl$Query$HotelFindOne$hotelFindOne$checkIns(
    this._instance,
    this._then,
  );

  final Query$HotelFindOne$hotelFindOne$checkIns _instance;

  final TRes Function(Query$HotelFindOne$hotelFindOne$checkIns) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? checkInAt = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$HotelFindOne$hotelFindOne$checkIns(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$HotelFindOne$hotelFindOne$checkIns$user),
        checkInAt: checkInAt == _undefined || checkInAt == null
            ? _instance.checkInAt
            : (checkInAt as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$HotelFindOne$hotelFindOne$checkIns$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$HotelFindOne$hotelFindOne$checkIns$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$checkIns<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne$checkIns<TRes> {
  _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$checkIns(this._res);

  TRes _res;

  call({
    Query$HotelFindOne$hotelFindOne$checkIns$user? user,
    String? checkInAt,
    String? createdAt,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$HotelFindOne$hotelFindOne$checkIns$user<TRes> get user =>
      CopyWith$Query$HotelFindOne$hotelFindOne$checkIns$user.stub(_res);
}

class Query$HotelFindOne$hotelFindOne$checkIns$user {
  Query$HotelFindOne$hotelFindOne$checkIns$user({
    required this.id,
    required this.firstName,
    this.lastName,
    this.avatarUrl,
    this.$__typename = 'UserAbstract',
  });

  factory Query$HotelFindOne$hotelFindOne$checkIns$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$avatarUrl = json['avatarUrl'];
    final l$$__typename = json['__typename'];
    return Query$HotelFindOne$hotelFindOne$checkIns$user(
      id: (l$id as String),
      firstName: (l$firstName as String),
      lastName: (l$lastName as String?),
      avatarUrl: (l$avatarUrl as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String firstName;

  final String? lastName;

  final String? avatarUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$avatarUrl = avatarUrl;
    _resultData['avatarUrl'] = l$avatarUrl;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$avatarUrl = avatarUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firstName,
      l$lastName,
      l$avatarUrl,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$HotelFindOne$hotelFindOne$checkIns$user) ||
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
    final l$avatarUrl = avatarUrl;
    final lOther$avatarUrl = other.avatarUrl;
    if (l$avatarUrl != lOther$avatarUrl) {
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

extension UtilityExtension$Query$HotelFindOne$hotelFindOne$checkIns$user
    on Query$HotelFindOne$hotelFindOne$checkIns$user {
  CopyWith$Query$HotelFindOne$hotelFindOne$checkIns$user<
          Query$HotelFindOne$hotelFindOne$checkIns$user>
      get copyWith => CopyWith$Query$HotelFindOne$hotelFindOne$checkIns$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$HotelFindOne$hotelFindOne$checkIns$user<TRes> {
  factory CopyWith$Query$HotelFindOne$hotelFindOne$checkIns$user(
    Query$HotelFindOne$hotelFindOne$checkIns$user instance,
    TRes Function(Query$HotelFindOne$hotelFindOne$checkIns$user) then,
  ) = _CopyWithImpl$Query$HotelFindOne$hotelFindOne$checkIns$user;

  factory CopyWith$Query$HotelFindOne$hotelFindOne$checkIns$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$checkIns$user;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? avatarUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$HotelFindOne$hotelFindOne$checkIns$user<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne$checkIns$user<TRes> {
  _CopyWithImpl$Query$HotelFindOne$hotelFindOne$checkIns$user(
    this._instance,
    this._then,
  );

  final Query$HotelFindOne$hotelFindOne$checkIns$user _instance;

  final TRes Function(Query$HotelFindOne$hotelFindOne$checkIns$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? avatarUrl = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$HotelFindOne$hotelFindOne$checkIns$user(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        firstName: firstName == _undefined || firstName == null
            ? _instance.firstName
            : (firstName as String),
        lastName:
            lastName == _undefined ? _instance.lastName : (lastName as String?),
        avatarUrl: avatarUrl == _undefined
            ? _instance.avatarUrl
            : (avatarUrl as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$checkIns$user<TRes>
    implements CopyWith$Query$HotelFindOne$hotelFindOne$checkIns$user<TRes> {
  _CopyWithStubImpl$Query$HotelFindOne$hotelFindOne$checkIns$user(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? avatarUrl,
    String? $__typename,
  }) =>
      _res;
}
