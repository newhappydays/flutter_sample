class ProviderTodo {
  int id;
  String title;
  bool done;

  ProviderTodo({
    required this.id,
    required this.title,
    required this.done
  });

  @override
  String toString() {
    return 'ProviderTodo{id: $id, title: $title, done: $done}';
  }
}