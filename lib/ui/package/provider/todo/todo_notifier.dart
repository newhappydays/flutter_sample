import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/package/provider/todo/provider_todo.dart';

class TodoNotifier with ChangeNotifier {

  final List<ProviderTodo> _list = [];
  List<ProviderTodo> get list => _list;

  ProviderTodo findById(int id) {
    return list.singleWhere((element) => element.id == id);
  }

  void insert(String title) {
    final newId = list.isNotEmpty ? list.first.id +1 : 0;
    final todo = ProviderTodo(id: newId, title: title, done: true);
    _list.insert(0, todo);
    notifyListeners();
  }

  void delete(int id) {
    _list.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void update(int id, String title) {
    final index = list.indexWhere((element) => element.id == id);
    final todo = ProviderTodo(id: id, title : title, done: true);

    _list[index] = todo;
    notifyListeners();
  }

}