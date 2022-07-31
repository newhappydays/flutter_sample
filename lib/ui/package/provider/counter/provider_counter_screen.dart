import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/package/provider/counter/provider_counter_notifier.dart';
import 'package:provider/provider.dart';

class ProviderCounterScreen extends StatelessWidget {
  const ProviderCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterNotifier = context.watch<ProviderCounterNotifier>();
    final countState = counterNotifier.count;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Provider Counter',
        ),
      ),
      body: Center(
        child: Text(
          '$countState',
          style: TextStyle(
            fontSize: 30.0
          ),
        ),
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
