import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/component/route_button.dart';
import 'package:flutter_sample/ui/package/provider/counter/provider_counter_notifier.dart';
import 'package:flutter_sample/ui/package/provider/counter/provider_counter_screen.dart';
import 'package:flutter_sample/ui/package/provider/todo/edit/provider_todo_edit_screen.dart';
import 'package:flutter_sample/ui/package/provider/todo/provider_todo_screen.dart';
import 'package:flutter_sample/ui/package/provider/todo/provider_todo_notifier.dart';
import 'package:provider/provider.dart';

import '../../util/routes.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderCounterNotifier(),
        ),
        // count_provider.dart
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderTodoNotifier(),
        )
      ],
      child: MaterialApp(
        home: ProviderSampleList(parentContext: context),
        routes: {
          RouteName.providerCounterScreen: (context) =>
              const ProviderCounterScreen(),
          RouteName.providerTodoScreen: (context) => const ProviderTodoScreen(),
          RouteName.providerTodoEdit: (context) =>
              const ProviderTodoEditScreen(),
        },
      ),
    );
  }
}

class ProviderSampleList extends StatelessWidget {
  BuildContext parentContext;

  ProviderSampleList({Key? key, required this.parentContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(parentContext),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text('Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: providerRoutes.map((e) => RouteButton(route: e)).toList(),
      ),
    );
  }
}
