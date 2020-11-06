import 'dart:io';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db.g.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get details => text()();
  BoolColumn get isdone => boolean()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Todos])
class Database extends _$Database {
  @override
  int get schemaVersion => 1;

  Database() : super(_openConnection());
  Future<List<Todo>> get allTodoEntries => select(todos).get();

  Stream<Todo> todoById(int id) {
    return (select(todos)..where((tbl) => tbl.id.equals(id))).watchSingle();
  }

  Future<int> addTodoEntry(TodosCompanion entry) {
    return into(todos).insert(entry);
  }

  Future<int> updateTodo(int id, TodosCompanion todo) {
    return (update(todos)..where((it) => it.id.equals(id))).write(todo);
  }
}
