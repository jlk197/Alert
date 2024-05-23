// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pills_taking_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPillsTakingEntityCollection on Isar {
  IsarCollection<PillsTakingEntity> get pillsTakingEntitys => this.collection();
}

const PillsTakingEntitySchema = CollectionSchema(
  name: r'PillsTakingEntity',
  id: 9044710257155260744,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'hour': PropertySchema(
      id: 1,
      name: r'hour',
      type: IsarType.string,
    ),
    r'isTaken': PropertySchema(
      id: 2,
      name: r'isTaken',
      type: IsarType.bool,
    ),
    r'pillId': PropertySchema(
      id: 3,
      name: r'pillId',
      type: IsarType.long,
    )
  },
  estimateSize: _pillsTakingEntityEstimateSize,
  serialize: _pillsTakingEntitySerialize,
  deserialize: _pillsTakingEntityDeserialize,
  deserializeProp: _pillsTakingEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pillsTakingEntityGetId,
  getLinks: _pillsTakingEntityGetLinks,
  attach: _pillsTakingEntityAttach,
  version: '3.1.0+1',
);

int _pillsTakingEntityEstimateSize(
  PillsTakingEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.hour.length * 3;
  return bytesCount;
}

void _pillsTakingEntitySerialize(
  PillsTakingEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeString(offsets[1], object.hour);
  writer.writeBool(offsets[2], object.isTaken);
  writer.writeLong(offsets[3], object.pillId);
}

PillsTakingEntity _pillsTakingEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PillsTakingEntity(
    date: reader.readDateTime(offsets[0]),
    hour: reader.readStringOrNull(offsets[1]) ?? "",
    isTaken: reader.readBoolOrNull(offsets[2]) ?? false,
    pillId: reader.readLongOrNull(offsets[3]) ?? -1,
  );
  object.id = id;
  return object;
}

P _pillsTakingEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 2:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 3:
      return (reader.readLongOrNull(offset) ?? -1) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pillsTakingEntityGetId(PillsTakingEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pillsTakingEntityGetLinks(
    PillsTakingEntity object) {
  return [];
}

void _pillsTakingEntityAttach(
    IsarCollection<dynamic> col, Id id, PillsTakingEntity object) {
  object.id = id;
}

extension PillsTakingEntityQueryWhereSort
    on QueryBuilder<PillsTakingEntity, PillsTakingEntity, QWhere> {
  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PillsTakingEntityQueryWhere
    on QueryBuilder<PillsTakingEntity, PillsTakingEntity, QWhereClause> {
  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterWhereClause>
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

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterWhereClause>
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

extension PillsTakingEntityQueryFilter
    on QueryBuilder<PillsTakingEntity, PillsTakingEntity, QFilterCondition> {
  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      hourEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      hourGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      hourLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      hourBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      hourStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      hourEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      hourContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      hourMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hour',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      hourIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hour',
        value: '',
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      hourIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hour',
        value: '',
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
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

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
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

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
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

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      isTakenEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isTaken',
        value: value,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      pillIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pillId',
        value: value,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      pillIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pillId',
        value: value,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      pillIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pillId',
        value: value,
      ));
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterFilterCondition>
      pillIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pillId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PillsTakingEntityQueryObject
    on QueryBuilder<PillsTakingEntity, PillsTakingEntity, QFilterCondition> {}

extension PillsTakingEntityQueryLinks
    on QueryBuilder<PillsTakingEntity, PillsTakingEntity, QFilterCondition> {}

extension PillsTakingEntityQuerySortBy
    on QueryBuilder<PillsTakingEntity, PillsTakingEntity, QSortBy> {
  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      sortByHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.asc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      sortByHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.desc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      sortByIsTaken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaken', Sort.asc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      sortByIsTakenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaken', Sort.desc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      sortByPillId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pillId', Sort.asc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      sortByPillIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pillId', Sort.desc);
    });
  }
}

extension PillsTakingEntityQuerySortThenBy
    on QueryBuilder<PillsTakingEntity, PillsTakingEntity, QSortThenBy> {
  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      thenByHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.asc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      thenByHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.desc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      thenByIsTaken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaken', Sort.asc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      thenByIsTakenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTaken', Sort.desc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      thenByPillId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pillId', Sort.asc);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QAfterSortBy>
      thenByPillIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pillId', Sort.desc);
    });
  }
}

extension PillsTakingEntityQueryWhereDistinct
    on QueryBuilder<PillsTakingEntity, PillsTakingEntity, QDistinct> {
  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QDistinct>
      distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QDistinct> distinctByHour(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hour', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QDistinct>
      distinctByIsTaken() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isTaken');
    });
  }

  QueryBuilder<PillsTakingEntity, PillsTakingEntity, QDistinct>
      distinctByPillId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pillId');
    });
  }
}

extension PillsTakingEntityQueryProperty
    on QueryBuilder<PillsTakingEntity, PillsTakingEntity, QQueryProperty> {
  QueryBuilder<PillsTakingEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PillsTakingEntity, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<PillsTakingEntity, String, QQueryOperations> hourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hour');
    });
  }

  QueryBuilder<PillsTakingEntity, bool, QQueryOperations> isTakenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isTaken');
    });
  }

  QueryBuilder<PillsTakingEntity, int, QQueryOperations> pillIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pillId');
    });
  }
}
