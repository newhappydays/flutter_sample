import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/package/provider/counter/counter_notifier.dart';
import 'package:flutter_sample/ui/package/provider/counter/provider_counter_screen.dart';
import 'package:flutter_sample/ui/package/provider/todo/edit/provider_todo_edit_screen.dart';
import 'package:flutter_sample/ui/package/provider/todo/provider_todo.dart';
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
        home: ProviderTodoScreen(),
        routes: {
          RouteName.providerTodoEdit: (context) => ProviderTodoEditScreen(),
        },
      ),
    );
  }
}
