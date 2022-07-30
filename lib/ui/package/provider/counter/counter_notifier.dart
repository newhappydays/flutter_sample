import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/package/provider/todo/provider_todo.dart';

class CounterNotifier with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  List<ProviderTodo> _list = [];
  List<ProviderTodo> get list => _list;

  increment() {
    _count++;
    final newId = list.isNotEmpty ? list.first.id +1 : 0;
    final todo = ProviderTodo(id: newId, title: 'title $newId', done: true);
    list.insert(0, todo);
    notifyListeners();
  }

  decrement() {
    _count--;
    list.removeLast();
    notifyListeners();
  }

  delete(int id) {
    _list.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  update(int id) {
    final index = list.indexWhere((element) => element.id == id);
    var title =
    list[index].title.contains('update') ? 'title' : 'update title';

    final todo = ProviderTodo(id: id, title : title, done: true);

    _list[index] = todo;
    notifyListeners();
  }

}