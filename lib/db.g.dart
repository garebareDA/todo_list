// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Todo extends DataClass implements Insertable<Todo> {
  final int id;
  final String title;
  final String details;
  final bool isdone;
  Todo(
      {@required this.id,
      @required this.title,
      @required this.details,
      @required this.isdone});
  factory Todo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Todo(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      details:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}details']),
      isdone:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}isdone']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || details != null) {
      map['details'] = Variable<String>(details);
    }
    if (!nullToAbsent || isdone != null) {
      map['isdone'] = Variable<bool>(isdone);
    }
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      details: details == null && nullToAbsent
          ? const Value.absent()
          : Value(details),
      isdone:
          isdone == null && nullToAbsent ? const Value.absent() : Value(isdone),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Todo(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      details: serializer.fromJson<String>(json['details']),
      isdone: serializer.fromJson<bool>(json['isdone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'details': serializer.toJson<String>(details),
      'isdone': serializer.toJson<bool>(isdone),
    };
  }

  Todo copyWith({int id, String title, String details, bool isdone}) => Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        details: details ?? this.details,
        isdone: isdone ?? this.isdone,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('details: $details, ')
          ..write('isdone: $isdone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(title.hashCode, $mrjc(details.hashCode, isdone.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == this.id &&
          other.title == this.title &&
          other.details == this.details &&
          other.isdone == this.isdone);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> details;
  final Value<bool> isdone;
  const TodosCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.details = const Value.absent(),
    this.isdone = const Value.absent(),
  });
  TodosCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    @required String details,
    @required bool isdone,
  })  : title = Value(title),
        details = Value(details),
        isdone = Value(isdone);
  static Insertable<Todo> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<String> details,
    Expression<bool> isdone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (details != null) 'details': details,
      if (isdone != null) 'isdone': isdone,
    });
  }

  TodosCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> details,
      Value<bool> isdone}) {
    return TodosCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      details: details ?? this.details,
      isdone: isdone ?? this.isdone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    if (isdone.present) {
      map['isdone'] = Variable<bool>(isdone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('details: $details, ')
          ..write('isdone: $isdone')
          ..write(')'))
        .toString();
  }
}

class $TodosTable extends Todos with TableInfo<$TodosTable, Todo> {
  final GeneratedDatabase _db;
  final String _alias;
  $TodosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _detailsMeta = const VerificationMeta('details');
  GeneratedTextColumn _details;
  @override
  GeneratedTextColumn get details => _details ??= _constructDetails();
  GeneratedTextColumn _constructDetails() {
    return GeneratedTextColumn(
      'details',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isdoneMeta = const VerificationMeta('isdone');
  GeneratedBoolColumn _isdone;
  @override
  GeneratedBoolColumn get isdone => _isdone ??= _constructIsdone();
  GeneratedBoolColumn _constructIsdone() {
    return GeneratedBoolColumn(
      'isdone',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, details, isdone];
  @override
  $TodosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'todos';
  @override
  final String actualTableName = 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('details')) {
      context.handle(_detailsMeta,
          details.isAcceptableOrUnknown(data['details'], _detailsMeta));
    } else if (isInserting) {
      context.missing(_detailsMeta);
    }
    if (data.containsKey('isdone')) {
      context.handle(_isdoneMeta,
          isdone.isAcceptableOrUnknown(data['isdone'], _isdoneMeta));
    } else if (isInserting) {
      context.missing(_isdoneMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Todo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TodosTable _todos;
  $TodosTable get todos => _todos ??= $TodosTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todos];
}
