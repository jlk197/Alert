// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pill_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPillEntityCollection on Isar {
  IsarCollection<PillEntity> get pillEntitys => this.collection();
}

const PillEntitySchema = CollectionSchema(
  name: r'PillEntity',
  id: 7072668788964723702,
  properties: {
    r'capacity': PropertySchema(
      id: 0,
      name: r'capacity',
      type: IsarType.string,
    ),
    r'comment': PropertySchema(
      id: 1,
      name: r'comment',
      type: IsarType.string,
    ),
    r'dosage': PropertySchema(
      id: 2,
      name: r'dosage',
      type: IsarType.long,
    ),
    r'frequency': PropertySchema(
      id: 3,
      name: r'frequency',
      type: IsarType.byte,
      enumMap: _PillEntityfrequencyEnumValueMap,
    ),
    r'hour': PropertySchema(
      id: 4,
      name: r'hour',
      type: IsarType.stringList,
    ),
    r'intervalFrequencyValue': PropertySchema(
      id: 5,
      name: r'intervalFrequencyValue',
      type: IsarType.long,
    ),
    r'meal': PropertySchema(
      id: 6,
      name: r'meal',
      type: IsarType.byte,
      enumMap: _PillEntitymealEnumValueMap,
    ),
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 8,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'stopDate': PropertySchema(
      id: 9,
      name: r'stopDate',
      type: IsarType.dateTime,
    ),
    r'weeklyFrequencyValue': PropertySchema(
      id: 10,
      name: r'weeklyFrequencyValue',
      type: IsarType.long,
    )
  },
  estimateSize: _pillEntityEstimateSize,
  serialize: _pillEntitySerialize,
  deserialize: _pillEntityDeserialize,
  deserializeProp: _pillEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pillEntityGetId,
  getLinks: _pillEntityGetLinks,
  attach: _pillEntityAttach,
  version: '3.1.0+1',
);

int _pillEntityEstimateSize(
  PillEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.capacity.length * 3;
  bytesCount += 3 + object.comment.length * 3;
  bytesCount += 3 + object.hour.length * 3;
  {
    for (var i = 0; i < object.hour.length; i++) {
      final value = object.hour[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _pillEntitySerialize(
  PillEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.capacity);
  writer.writeString(offsets[1], object.comment);
  writer.writeLong(offsets[2], object.dosage);
  writer.writeByte(offsets[3], object.frequency.index);
  writer.writeStringList(offsets[4], object.hour);
  writer.writeLong(offsets[5], object.intervalFrequencyValue);
  writer.writeByte(offsets[6], object.meal.index);
  writer.writeString(offsets[7], object.name);
  writer.writeDateTime(offsets[8], object.startDate);
  writer.writeDateTime(offsets[9], object.stopDate);
  writer.writeLong(offsets[10], object.weeklyFrequencyValue);
}

PillEntity _pillEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PillEntity(
    capacity: reader.readStringOrNull(offsets[0]) ?? "",
    comment: reader.readStringOrNull(offsets[1]) ?? "",
    dosage: reader.readLongOrNull(offsets[2]) ?? 1,
    frequency:
        _PillEntityfrequencyValueEnumMap[reader.readByteOrNull(offsets[3])] ??
            DosageFrequency.daily,
    hour: reader.readStringList(offsets[4]) ?? const [],
    intervalFrequencyValue: reader.readLongOrNull(offsets[5]),
    meal: _PillEntitymealValueEnumMap[reader.readByteOrNull(offsets[6])] ??
        Meal.after,
    name: reader.readStringOrNull(offsets[7]) ?? "",
    startDate: reader.readDateTimeOrNull(offsets[8]),
    stopDate: reader.readDateTimeOrNull(offsets[9]),
    weeklyFrequencyValue: reader.readLongOrNull(offsets[10]),
  );
  object.id = id;
  return object;
}

P _pillEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 3:
      return (_PillEntityfrequencyValueEnumMap[reader.readByteOrNull(offset)] ??
          DosageFrequency.daily) as P;
    case 4:
      return (reader.readStringList(offset) ?? const []) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (_PillEntitymealValueEnumMap[reader.readByteOrNull(offset)] ??
          Meal.after) as P;
    case 7:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PillEntityfrequencyEnumValueMap = {
  'daily': 0,
  'interval': 1,
  'weekly': 2,
};
const _PillEntityfrequencyValueEnumMap = {
  0: DosageFrequency.daily,
  1: DosageFrequency.interval,
  2: DosageFrequency.weekly,
};
const _PillEntitymealEnumValueMap = {
  'before': 0,
  'during': 1,
  'after': 2,
};
const _PillEntitymealValueEnumMap = {
  0: Meal.before,
  1: Meal.during,
  2: Meal.after,
};

Id _pillEntityGetId(PillEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pillEntityGetLinks(PillEntity object) {
  return [];
}

void _pillEntityAttach(IsarCollection<dynamic> col, Id id, PillEntity object) {
  object.id = id;
}

extension PillEntityQueryWhereSort
    on QueryBuilder<PillEntity, PillEntity, QWhere> {
  QueryBuilder<PillEntity, PillEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PillEntityQueryWhere
    on QueryBuilder<PillEntity, PillEntity, QWhereClause> {
  QueryBuilder<PillEntity, PillEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PillEntity, PillEntity, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterWhereClause> idBetween(
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

extension PillEntityQueryFilter
    on QueryBuilder<PillEntity, PillEntity, QFilterCondition> {
  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> capacityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capacity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      capacityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'capacity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> capacityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'capacity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> capacityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'capacity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      capacityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'capacity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> capacityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'capacity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> capacityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'capacity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> capacityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'capacity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      capacityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capacity',
        value: '',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      capacityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'capacity',
        value: '',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> commentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      commentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> commentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> commentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> commentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> commentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> commentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> commentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> commentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      commentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> dosageEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosage',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> dosageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dosage',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> dosageLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dosage',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> dosageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dosage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> frequencyEqualTo(
      DosageFrequency value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frequency',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      frequencyGreaterThan(
    DosageFrequency value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frequency',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> frequencyLessThan(
    DosageFrequency value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frequency',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> frequencyBetween(
    DosageFrequency lower,
    DosageFrequency upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frequency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      hourElementEqualTo(
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

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      hourElementGreaterThan(
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

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      hourElementLessThan(
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

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      hourElementBetween(
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

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      hourElementStartsWith(
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

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      hourElementEndsWith(
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

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      hourElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      hourElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hour',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      hourElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hour',
        value: '',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      hourElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hour',
        value: '',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> hourLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hour',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> hourIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hour',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> hourIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hour',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      hourLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hour',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      hourLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hour',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> hourLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hour',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      intervalFrequencyValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'intervalFrequencyValue',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      intervalFrequencyValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'intervalFrequencyValue',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      intervalFrequencyValueEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intervalFrequencyValue',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      intervalFrequencyValueGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intervalFrequencyValue',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      intervalFrequencyValueLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intervalFrequencyValue',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      intervalFrequencyValueBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intervalFrequencyValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> mealEqualTo(
      Meal value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meal',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> mealGreaterThan(
    Meal value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'meal',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> mealLessThan(
    Meal value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'meal',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> mealBetween(
    Meal lower,
    Meal upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'meal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> startDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      startDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> startDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> startDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> stopDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stopDate',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      stopDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stopDate',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> stopDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stopDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      stopDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stopDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> stopDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stopDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition> stopDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stopDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      weeklyFrequencyValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weeklyFrequencyValue',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      weeklyFrequencyValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weeklyFrequencyValue',
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      weeklyFrequencyValueEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weeklyFrequencyValue',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      weeklyFrequencyValueGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weeklyFrequencyValue',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      weeklyFrequencyValueLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weeklyFrequencyValue',
        value: value,
      ));
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterFilterCondition>
      weeklyFrequencyValueBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weeklyFrequencyValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PillEntityQueryObject
    on QueryBuilder<PillEntity, PillEntity, QFilterCondition> {}

extension PillEntityQueryLinks
    on QueryBuilder<PillEntity, PillEntity, QFilterCondition> {}

extension PillEntityQuerySortBy
    on QueryBuilder<PillEntity, PillEntity, QSortBy> {
  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByDosageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy>
      sortByIntervalFrequencyValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervalFrequencyValue', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy>
      sortByIntervalFrequencyValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervalFrequencyValue', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meal', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meal', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByStopDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stopDate', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> sortByStopDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stopDate', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy>
      sortByWeeklyFrequencyValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyFrequencyValue', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy>
      sortByWeeklyFrequencyValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyFrequencyValue', Sort.desc);
    });
  }
}

extension PillEntityQuerySortThenBy
    on QueryBuilder<PillEntity, PillEntity, QSortThenBy> {
  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByDosageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequency', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy>
      thenByIntervalFrequencyValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervalFrequencyValue', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy>
      thenByIntervalFrequencyValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervalFrequencyValue', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meal', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meal', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByStopDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stopDate', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy> thenByStopDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stopDate', Sort.desc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy>
      thenByWeeklyFrequencyValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyFrequencyValue', Sort.asc);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QAfterSortBy>
      thenByWeeklyFrequencyValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyFrequencyValue', Sort.desc);
    });
  }
}

extension PillEntityQueryWhereDistinct
    on QueryBuilder<PillEntity, PillEntity, QDistinct> {
  QueryBuilder<PillEntity, PillEntity, QDistinct> distinctByCapacity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'capacity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QDistinct> distinctByComment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QDistinct> distinctByDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dosage');
    });
  }

  QueryBuilder<PillEntity, PillEntity, QDistinct> distinctByFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frequency');
    });
  }

  QueryBuilder<PillEntity, PillEntity, QDistinct> distinctByHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hour');
    });
  }

  QueryBuilder<PillEntity, PillEntity, QDistinct>
      distinctByIntervalFrequencyValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intervalFrequencyValue');
    });
  }

  QueryBuilder<PillEntity, PillEntity, QDistinct> distinctByMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meal');
    });
  }

  QueryBuilder<PillEntity, PillEntity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PillEntity, PillEntity, QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<PillEntity, PillEntity, QDistinct> distinctByStopDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stopDate');
    });
  }

  QueryBuilder<PillEntity, PillEntity, QDistinct>
      distinctByWeeklyFrequencyValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weeklyFrequencyValue');
    });
  }
}

extension PillEntityQueryProperty
    on QueryBuilder<PillEntity, PillEntity, QQueryProperty> {
  QueryBuilder<PillEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PillEntity, String, QQueryOperations> capacityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'capacity');
    });
  }

  QueryBuilder<PillEntity, String, QQueryOperations> commentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comment');
    });
  }

  QueryBuilder<PillEntity, int, QQueryOperations> dosageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dosage');
    });
  }

  QueryBuilder<PillEntity, DosageFrequency, QQueryOperations>
      frequencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frequency');
    });
  }

  QueryBuilder<PillEntity, List<String>, QQueryOperations> hourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hour');
    });
  }

  QueryBuilder<PillEntity, int?, QQueryOperations>
      intervalFrequencyValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intervalFrequencyValue');
    });
  }

  QueryBuilder<PillEntity, Meal, QQueryOperations> mealProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meal');
    });
  }

  QueryBuilder<PillEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PillEntity, DateTime?, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<PillEntity, DateTime?, QQueryOperations> stopDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stopDate');
    });
  }

  QueryBuilder<PillEntity, int?, QQueryOperations>
      weeklyFrequencyValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weeklyFrequencyValue');
    });
  }
}
