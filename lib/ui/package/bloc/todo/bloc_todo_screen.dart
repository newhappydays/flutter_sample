import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/ui/package/bloc/todo/bloc_todo.dart';
import 'package:flutter_sample/ui/package/bloc/todo/tobo_cubit.dart';

class BlocTodoScreen extends StatelessWidget {
  const BlocTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc(Todo)'),
      ),
      body: BlocBuilder<TodoCubit, List<BlocTodo>>(
        builder: (context, todos) {
          // empty
          if (todos.isEmpty) {
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
            children: todos.map((e) =>
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 10.0,
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${e.title}',
                              ),
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    '수정',
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.read<TodoCubit>().delete(e.id);
                                  },
                                  child: const Text(
                                    '삭제',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                )
            ).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<TodoCubit>().insert();
        },
      ),
    );
  }
}
