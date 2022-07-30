import 'package:flutter/material.dart';

import '../provider_todo.dart';

class ProviderTodoItem extends StatelessWidget {
  final ProviderTodo todo;
  final VoidCallback updateTap;
  final VoidCallback deleteTap;

  const ProviderTodoItem({
    super.key,
    required this.todo,
    required this.updateTap,
    required this.deleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                '${todo.title} ${todo.id}',
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: updateTap,
                  child: const Text(
                    '수정',
                  ),
                ),
                TextButton(
                  onPressed: () => deleteDialog(context),
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
    );
  }

  deleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            '해야할 일을 삭제하시겠습니까???',
            style: TextStyle(fontSize: 20.0),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                '취소',
              ),
            ),
            TextButton(
              onPressed: () {
                deleteTap();
                Navigator.pop(context);
              },
              child: const Text(
                '확인',
              ),
            ),
          ],
        );
      },
    );
  }
}
