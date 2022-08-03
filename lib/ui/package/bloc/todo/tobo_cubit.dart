import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/ui/package/bloc/todo/bloc_todo.dart';

class TodoCubit extends Cubit<List<BlocTodo>> {
  TodoCubit() : super([]);

  insert() {
    final id = state.isEmpty ? 0 : state.first.id + 1;
    print('id = $id');
    final todo = BlocTodo(id : id, title : 'title $id', done: true);
    state.insert(0, todo);
    emit(state.toList());
  }

  delete(int id) {
    state.removeWhere((element) => element.id == id);
    emit(state.toList());
  }



}