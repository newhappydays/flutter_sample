// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_sample/main.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Todo {
  int id;
  String title;

  Todo({
    required this.id,
    required this.title
  });
}


void main() {

  test('hiveTest', () async {
    List<Todo> list = [];

    for(int i = 0 ; i < 10 ; i++) {
      list.add(
          Todo(id : i, title : 'title $i')
      );
    }

    list.sort(
       (b, a) => b.id.compareTo(a.id)
    );

    list.forEach((e) {
      print('title = ${e.title}');
    });
  });

}
