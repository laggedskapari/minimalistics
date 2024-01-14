// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cross_configration.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCrossConfigrationCollection on Isar {
  IsarCollection<CrossConfigration> get crossConfigrations => this.collection();
}

const CrossConfigrationSchema = CollectionSchema(
  name: r'CrossConfigration',
  id: 8725660075766441549,
  properties: {
    r'crossConfId': PropertySchema(
      id: 0,
      name: r'crossConfId',
      type: IsarType.string,
    ),
    r'currentTheme': PropertySchema(
      id: 1,
      name: r'currentTheme',
      type: IsarType.string,
    )
  },
  estimateSize: _crossConfigrationEstimateSize,
  serialize: _crossConfigrationSerialize,
  deserialize: _crossConfigrationDeserialize,
  deserializeProp: _crossConfigrationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _crossConfigrationGetId,
  getLinks: _crossConfigrationGetLinks,
  attach: _crossConfigrationAttach,
  version: '3.1.0+1',
);

int _crossConfigrationEstimateSize(
  CrossConfigration object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.crossConfId.length * 3;
  bytesCount += 3 + object.currentTheme.length * 3;
  return bytesCount;
}

void _crossConfigrationSerialize(
  CrossConfigration object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.crossConfId);
  writer.writeString(offsets[1], object.currentTheme);
}

CrossConfigration _crossConfigrationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CrossConfigration(
    crossConfId: reader.readStringOrNull(offsets[0]) ?? 'adalovelace',
    currentTheme: reader.readString(offsets[1]),
  );
  object.id = id;
  return object;
}

P _crossConfigrationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset) ?? 'adalovelace') as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _crossConfigrationGetId(CrossConfigration object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _crossConfigrationGetLinks(
    CrossConfigration object) {
  return [];
}

void _crossConfigrationAttach(
    IsarCollection<dynamic> col, Id id, CrossConfigration object) {
  object.id = id;
}

extension CrossConfigrationQueryWhereSort
    on QueryBuilder<CrossConfigration, CrossConfigration, QWhere> {
  QueryBuilder<CrossConfigration, CrossConfigration, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CrossConfigrationQueryWhere
    on QueryBuilder<CrossConfigration, CrossConfigration, QWhereClause> {
  QueryBuilder<CrossConfigration, CrossConfigration, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CrossConfigrationQueryFilter
    on QueryBuilder<CrossConfigration, CrossConfigration, QFilterCondition> {
  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      crossConfIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'crossConfId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      crossConfIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'crossConfId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      crossConfIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'crossConfId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      crossConfIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'crossConfId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      crossConfIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'crossConfId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      crossConfIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'crossConfId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      crossConfIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'crossConfId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      crossConfIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'crossConfId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      crossConfIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'crossConfId',
        value: '',
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      crossConfIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'crossConfId',
        value: '',
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      currentThemeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      currentThemeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      currentThemeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      currentThemeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentTheme',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      currentThemeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currentTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      currentThemeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currentTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      currentThemeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currentTheme',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      currentThemeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currentTheme',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      currentThemeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentTheme',
        value: '',
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      currentThemeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currentTheme',
        value: '',
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CrossConfigrationQueryObject
    on QueryBuilder<CrossConfigration, CrossConfigration, QFilterCondition> {}

extension CrossConfigrationQueryLinks
    on QueryBuilder<CrossConfigration, CrossConfigration, QFilterCondition> {}

extension CrossConfigrationQuerySortBy
    on QueryBuilder<CrossConfigration, CrossConfigration, QSortBy> {
  QueryBuilder<CrossConfigration, CrossConfigration, QAfterSortBy>
      sortByCrossConfId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossConfId', Sort.asc);
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterSortBy>
      sortByCrossConfIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossConfId', Sort.desc);
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterSortBy>
      sortByCurrentTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentTheme', Sort.asc);
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterSortBy>
      sortByCurrentThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentTheme', Sort.desc);
    });
  }
}

extension CrossConfigrationQuerySortThenBy
    on QueryBuilder<CrossConfigration, CrossConfigration, QSortThenBy> {
  QueryBuilder<CrossConfigration, CrossConfigration, QAfterSortBy>
      thenByCrossConfId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossConfId', Sort.asc);
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterSortBy>
      thenByCrossConfIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossConfId', Sort.desc);
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterSortBy>
      thenByCurrentTheme() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentTheme', Sort.asc);
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterSortBy>
      thenByCurrentThemeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentTheme', Sort.desc);
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension CrossConfigrationQueryWhereDistinct
    on QueryBuilder<CrossConfigration, CrossConfigration, QDistinct> {
  QueryBuilder<CrossConfigration, CrossConfigration, QDistinct>
      distinctByCrossConfId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'crossConfId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CrossConfigration, CrossConfigration, QDistinct>
      distinctByCurrentTheme({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentTheme', caseSensitive: caseSensitive);
    });
  }
}

extension CrossConfigrationQueryProperty
    on QueryBuilder<CrossConfigration, CrossConfigration, QQueryProperty> {
  QueryBuilder<CrossConfigration, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CrossConfigration, String, QQueryOperations>
      crossConfIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'crossConfId');
    });
  }

  QueryBuilder<CrossConfigration, String, QQueryOperations>
      currentThemeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentTheme');
    });
  }
}
