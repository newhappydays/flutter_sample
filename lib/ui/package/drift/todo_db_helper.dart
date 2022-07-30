import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_sample/ui/package/drift/model/todos.dart';
import 'package:path_provider/path_provider.dart';

part 'todo_db_helper.g.dart';

@DriftDatabase(
  tables: [Todos],
)
class TodoDbHelper extends _$TodoDbHelper {
  TodoDbHelper() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Todo>> findAll() =>
      (select(todos)..orderBy([(t) => OrderingTerm.desc(t.id)])).get();

  Future<int> insertTodo(TodosCompanion todo) => into(todos).insert(todo);

  Future<int> updateTodo(Todo todo,) =>
      (update(todos)..where((t) => t.id.equals(todo.id))).write(todo);

  Future<int> deleteTodo(int id) =>
      (delete(todos)..where((t) => t.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
