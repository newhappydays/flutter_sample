import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/package/drift/todo_db_helper.dart';

class DriftScreen extends StatefulWidget {
  const DriftScreen({Key? key}) : super(key: key);

  @override
  State<DriftScreen> createState() => _DriftScreenState();
}

class _DriftScreenState extends State<DriftScreen> {
  TodoDbHelper todoDbHelper = TodoDbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drift Sample'),
      ),
      body: FutureBuilder<List<Todo>>(
        future: todoDbHelper.findAll(),
        builder: (context, snapshot) {
          // loading
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // empty
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Todo is empty',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            );
          }

          return ListView(
            children: snapshot.data!
                .map(
                  (e) => ListTile(
                    title: Text('${e.title} ${e.id}'),
                    leading: updateBtn(e),
                    trailing: deleteBtn(e.id!),
                  ),
                )
                .toList(),
          );
        },
      ),
      floatingActionButton: addBtn(),
    );
  }

  Widget deleteBtn(int id) => IconButton(
        onPressed: () {
          setState(() {
            todoDbHelper.deleteTodo(id);
          });
        },
        icon: const Icon(Icons.delete_forever),
      );

  Widget updateBtn(Todo todo) => IconButton(
        onPressed: () {
          setState(() {
            var title =
                todo.title.contains('update') ? 'title' : 'update title';

            todoDbHelper.updateTodo(
              Todo(
                id : todo.id,
                title: title,
                done: false,
              ),
            );
          });
        },
        icon: const Icon(Icons.update_sharp),
      );

  FloatingActionButton addBtn() => FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            todoDbHelper.insertTodo(
              TodosCompanion(
                title: Value('title'),
                done: Value(true),
              ),
            );
          });
        },
      );
}
