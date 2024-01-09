// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaskListCollection on Isar {
  IsarCollection<TaskList> get taskLists => this.collection();
}

const TaskListSchema = CollectionSchema(
  name: r'TaskList',
  id: 3580550780980956509,
  properties: {
    r'completedTasks': PropertySchema(
      id: 0,
      name: r'completedTasks',
      type: IsarType.long,
    ),
    r'taskListDescription': PropertySchema(
      id: 1,
      name: r'taskListDescription',
      type: IsarType.string,
    ),
    r'taskListId': PropertySchema(
      id: 2,
      name: r'taskListId',
      type: IsarType.string,
    ),
    r'taskListTitle': PropertySchema(
      id: 3,
      name: r'taskListTitle',
      type: IsarType.string,
    )
  },
  estimateSize: _taskListEstimateSize,
  serialize: _taskListSerialize,
  deserialize: _taskListDeserialize,
  deserializeProp: _taskListDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _taskListGetId,
  getLinks: _taskListGetLinks,
  attach: _taskListAttach,
  version: '3.1.0+1',
);

int _taskListEstimateSize(
  TaskList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.taskListDescription.length * 3;
  bytesCount += 3 + object.taskListId.length * 3;
  bytesCount += 3 + object.taskListTitle.length * 3;
  return bytesCount;
}

void _taskListSerialize(
  TaskList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.completedTasks);
  writer.writeString(offsets[1], object.taskListDescription);
  writer.writeString(offsets[2], object.taskListId);
  writer.writeString(offsets[3], object.taskListTitle);
}

TaskList _taskListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaskList(
    completedTasks: reader.readLongOrNull(offsets[0]) ?? 0,
    taskListDescription: reader.readString(offsets[1]),
    taskListId: reader.readString(offsets[2]),
    taskListTitle: reader.readString(offsets[3]),
  );
  object.id = id;
  return object;
}

P _taskListDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taskListGetId(TaskList object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskListGetLinks(TaskList object) {
  return [];
}

void _taskListAttach(IsarCollection<dynamic> col, Id id, TaskList object) {
  object.id = id;
}

extension TaskListQueryWhereSort on QueryBuilder<TaskList, TaskList, QWhere> {
  QueryBuilder<TaskList, TaskList, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TaskListQueryWhere on QueryBuilder<TaskList, TaskList, QWhereClause> {
  QueryBuilder<TaskList, TaskList, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<TaskList, TaskList, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterWhereClause> idBetween(
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

extension TaskListQueryFilter
    on QueryBuilder<TaskList, TaskList, QFilterCondition> {
  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> completedTasksEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedTasks',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      completedTasksGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedTasks',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      completedTasksLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedTasks',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> completedTasksBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedTasks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      taskListDescriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskListDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      taskListDescriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskListDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      taskListDescriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskListDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      taskListDescriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskListDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      taskListDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskListDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      taskListDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskListDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      taskListDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskListDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      taskListDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskListDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      taskListDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskListDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      taskListDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskListDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> taskListIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskListId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> taskListIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskListId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> taskListIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskListId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> taskListIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskListId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> taskListIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskListId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> taskListIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskListId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> taskListIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskListId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> taskListIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskListId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> taskListIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskListId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      taskListIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskListId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> taskListTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskListTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      taskListTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskListTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> taskListTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskListTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> taskListTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskListTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      taskListTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskListTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> taskListTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskListTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> taskListTitleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskListTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition> taskListTitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskListTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      taskListTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskListTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterFilterCondition>
      taskListTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskListTitle',
        value: '',
      ));
    });
  }
}

extension TaskListQueryObject
    on QueryBuilder<TaskList, TaskList, QFilterCondition> {}

extension TaskListQueryLinks
    on QueryBuilder<TaskList, TaskList, QFilterCondition> {}

extension TaskListQuerySortBy on QueryBuilder<TaskList, TaskList, QSortBy> {
  QueryBuilder<TaskList, TaskList, QAfterSortBy> sortByCompletedTasks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedTasks', Sort.asc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> sortByCompletedTasksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedTasks', Sort.desc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> sortByTaskListDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskListDescription', Sort.asc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy>
      sortByTaskListDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskListDescription', Sort.desc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> sortByTaskListId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskListId', Sort.asc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> sortByTaskListIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskListId', Sort.desc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> sortByTaskListTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskListTitle', Sort.asc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> sortByTaskListTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskListTitle', Sort.desc);
    });
  }
}

extension TaskListQuerySortThenBy
    on QueryBuilder<TaskList, TaskList, QSortThenBy> {
  QueryBuilder<TaskList, TaskList, QAfterSortBy> thenByCompletedTasks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedTasks', Sort.asc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> thenByCompletedTasksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedTasks', Sort.desc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> thenByTaskListDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskListDescription', Sort.asc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy>
      thenByTaskListDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskListDescription', Sort.desc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> thenByTaskListId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskListId', Sort.asc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> thenByTaskListIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskListId', Sort.desc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> thenByTaskListTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskListTitle', Sort.asc);
    });
  }

  QueryBuilder<TaskList, TaskList, QAfterSortBy> thenByTaskListTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskListTitle', Sort.desc);
    });
  }
}

extension TaskListQueryWhereDistinct
    on QueryBuilder<TaskList, TaskList, QDistinct> {
  QueryBuilder<TaskList, TaskList, QDistinct> distinctByCompletedTasks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedTasks');
    });
  }

  QueryBuilder<TaskList, TaskList, QDistinct> distinctByTaskListDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskListDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskList, TaskList, QDistinct> distinctByTaskListId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskListId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskList, TaskList, QDistinct> distinctByTaskListTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskListTitle',
          caseSensitive: caseSensitive);
    });
  }
}

extension TaskListQueryProperty
    on QueryBuilder<TaskList, TaskList, QQueryProperty> {
  QueryBuilder<TaskList, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaskList, int, QQueryOperations> completedTasksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedTasks');
    });
  }

  QueryBuilder<TaskList, String, QQueryOperations>
      taskListDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskListDescription');
    });
  }

  QueryBuilder<TaskList, String, QQueryOperations> taskListIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskListId');
    });
  }

  QueryBuilder<TaskList, String, QQueryOperations> taskListTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskListTitle');
    });
  }
}
