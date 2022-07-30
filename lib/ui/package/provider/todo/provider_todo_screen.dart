import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/package/provider/todo/edit/todo_edit_argument.dart';
import 'package:flutter_sample/ui/package/provider/todo/todo_notifier.dart';
import 'package:provider/provider.dart';

import '../../../util/routes.dart';
import 'component/todo_item.dart';

class ProviderTodoScreen extends StatefulWidget {
  const ProviderTodoScreen({Key? key}) : super(key: key);

  @override
  State<ProviderTodoScreen> createState() => _ProviderTodoScreenState();
}

class _ProviderTodoScreenState extends State<ProviderTodoScreen> {
  @override
  Widget build(BuildContext context) {
    final todoNotifier = context.watch<TodoNotifier>();
    final todoList = todoNotifier.list;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Provider Sample Page',
        ),
      ),
      body: todoList.isNotEmpty
          ? ListView(
              children: todoList
                  .map(
                    (e) => ProviderTodoItem(
                      todo: e,
                      updateTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.providerTodoEdit,
                          arguments: TodoEditArgument(
                            title: 'title',
                            todo: e,
                          ),
                        );
                      },
                      deleteTap: () => todoNotifier.delete(e.id),
                    ),
                  )
                  .toList(),
            )
          : const Center(
              child: Text(
                'Todo is empty',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            RouteName.providerTodoEdit,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
