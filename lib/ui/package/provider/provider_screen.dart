import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/component/route_button.dart';
import 'package:flutter_sample/ui/package/provider/counter/provider_counter_screen.dart';
import 'package:flutter_sample/ui/package/provider/todo/edit/provider_todo_edit_screen.dart';
import 'package:flutter_sample/ui/package/provider/todo/provider_todo_screen.dart';
import 'package:flutter_sample/ui/package/provider/todo/todo_notifier.dart';
import 'package:provider/provider.dart';

import '../../util/routes.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoNotifier(),
      child: MaterialApp(
        home: const ProviderSampleList(),
        routes: {
          RouteName.providerCounterScreen: (context) => ProviderCounterScreen(),
          RouteName.providerTodoScreen: (context) => ProviderTodoScreen(),
          RouteName.providerTodoEdit: (context) => ProviderTodoEditScreen(),
        },
      ),
    );
  }
}

class ProviderSampleList extends StatelessWidget {
  const ProviderSampleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: providerRoutes.map((e) => RouteButton(route: e)).toList(),
      ),
    );
  }
}
