import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/package/provider/todo/edit/todo_edit_argument.dart';
import 'package:provider/provider.dart';

import '../provider_todo_notifier.dart';

class ProviderTodoEditScreen extends StatefulWidget {
  const ProviderTodoEditScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProviderTodoEditScreen> createState() => _ProviderTodoEditScreenState();
}

class _ProviderTodoEditScreenState extends State<ProviderTodoEditScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  String title = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todoNotifier = context.read<ProviderTodoNotifier>();

    final args = ModalRoute.of(context)!.settings.arguments;
    final updateTargetTodo = args != null ? args as TodoEditArgument : null;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          key: formGlobalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                initialValue:
                    updateTargetTodo != null ? updateTargetTodo.todo.title : '',
                maxLength: 20,
                decoration: const InputDecoration(
                  hintText: '해야할 일을 입력해주세요.',
                  counterText: '',
                ),
                validator: (text) {
                  if (text == '') {
                    return '해야할 일을 입력해주세요.';
                  }
                },
                onSaved: (title) {
                  setState(() {
                    this.title = title!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (formGlobalKey.currentState!.validate()) {
                    formGlobalKey.currentState!.save();
                    if (updateTargetTodo == null) {
                      // insert
                      todoNotifier.insert(title);
                    } else {
                      // update
                      todoNotifier.update(
                        updateTargetTodo.todo.id,
                        title,
                      );
                    }
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  '저장',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
