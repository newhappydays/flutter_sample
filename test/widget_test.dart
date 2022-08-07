// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/package/bloc/counter/counter_bloc.dart';
import 'package:flutter_sample/ui/package/bloc/counter/counter_event.dart';
import 'package:flutter_sample/ui/package/dio/model/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterBloc', () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    test('initial state is 0', () {
      expect(counterBloc.state, 0);
    });

    blocTest(
      'emits [1] when CounterIncrementPressed is added',
      build: () => CounterBloc(),
      act: (CounterBloc bloc) => bloc.add(CounterIncrementPressed()),
      expect: () => [1],
    );

    blocTest(
      'emits [-1] when CounterDecrementPressed is added',
      build: () => CounterBloc(),
      act: (CounterBloc bloc) => bloc.add(CounterDecrementPressed()),
      expect: () => [-1],
    );
  });

  blocTest(
    'emits [1] when CounterIncrementPressed is added',
    build: () => CounterBloc(),
    act: (CounterBloc bloc) => bloc.add(CounterIncrementPressed()),
    expect: () => [1],
  );

  group('dio Test', () {
    late String baseUrl;
    late Dio dio;

    setUp(() =>
    [
      dio = Dio(
        BaseOptions(
          baseUrl: 'http://172.30.1.10:8080/products',
        )
      ),
    ]);

    test('description', () async {
      await dio.get('url');
      await dio.get('url', queryParameters: { 'page' : 1, "order" : "desc" });

      await dio.post('url', data: "data");
      await dio.delete('url');
      await dio.put('url');
    });

    // test("insert", () async {
    //   final product = Product(
    //     id: 0,
    //     title: 'flutter title',
    //     description: 'flutter description',
    //     image: 'flutter image',
    //     rating: 0.0,
    //   );
    //   await dio.post('', data: product);
    //
    // });
    //
    // test("findById", () async {
    //   await dio.get('/1');
    // });
    //
    // test("update", () async {
    //   final product = Product(
    //     id: 1,
    //     title: 'flutter update title',
    //     description: 'flutter update description',
    //     image: 'flutter update image',
    //     rating: 0.0,
    //   );
    //
    //   await dio.put('/1', data: product);
    // });
    //
    // test("delete", () async {
    //   await dio.delete('/1');
    // });

    test("dummy", () async {
      final response = await dio.get('');
      final list = json.decode(response.data);
      // print('list = $list');
      // List<Product> products = response.data.map<Product>((json) {
      //   return Product.fromJson(json);
      // }).toList();
      // print('response = $products');


    });
    // test("findAll", () => null);
  });
}
