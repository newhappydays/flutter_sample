import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/package/provider/counter/counter_notifier.dart';
import 'package:provider/provider.dart';

import '../todo/component/todo_item.dart';

class ProviderCounterScreen extends StatelessWidget {
  const ProviderCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterNotifier = context.watch<CounterNotifier>();
    final countState = counterNotifier.count;
    final listState = counterNotifier.list;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Provider Sample Page',
        ),
      ),
      body: ListView(
        children: listState.map((e) =>
            ProviderTodoItem(
              todo: e,
              updateTap: () => counterNotifier.update(e.id),
              deleteTap: () => counterNotifier.delete(e.id),
            )
        ).toList(),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            onPressed: counterNotifier.increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            heroTag: null,
            onPressed: counterNotifier.decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
