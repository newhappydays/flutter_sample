import 'package:flutter_sample/ui/package/provider/todo/provider_todo.dart';

class TodoEditArgument {
  String title;
  ProviderTodo todo;

  TodoEditArgument({
    required this.title,
    required this.todo,
  });

  @override
  String toString() {
    return 'TodoEditArgument{title: $title, todo: $todo}';
  }
}
