import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import 'model/hive_todo.dart';

class HiveScreen extends StatefulWidget {
  const HiveScreen({Key? key}) : super(key: key);

  @override
  State<HiveScreen> createState() => _HiveScreenState();
}

class _HiveScreenState extends State<HiveScreen> {
  Box<HiveTodo> _box = Hive.box<HiveTodo>('myBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Sample'),
      ),
      body: ValueListenableBuilder(
        valueListenable: _box.listenable(),
        builder: (BuildContext context, Box<HiveTodo> todos, _) {
          if (todos.values.isEmpty) {
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
            children: todos.values
                .toList()
                .reversed
                .map(
                  (e) => ListTile(
                    title: Text('${e.title} ${e.key}'),
                    leading: updateBtn(e),
                    trailing: deleteBtn(e.key),
                  ),
                )
                .toList(),
          );
        },
      ),
      floatingActionButton: addBtn(),
    );
  }

  Widget deleteBtn(dynamic key) => IconButton(
        onPressed: () {
          setState(() {
            _box.delete(key);
          });
        },
        icon: const Icon(Icons.delete_forever),
      );

  Widget updateBtn(HiveTodo todo) => IconButton(
        onPressed: () {
          setState(() {
            var title =
                todo.title.contains('update') ? 'title' : 'update title';

            var hiveTodo = HiveTodo(
              id: todo.id,
              title: title,
              done: false,
            );

            _box.put(todo.key, hiveTodo);
          });
        },
        icon: const Icon(Icons.update_sharp),
      );

  FloatingActionButton addBtn() => FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            var id = Uuid().v4();
            var todo = HiveTodo(id: id, title: 'title', done: true);
            _box.add(todo);
          });
        },
      );
}
