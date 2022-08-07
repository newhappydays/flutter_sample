import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/ui/package/dio/remote/sample_api.dart';

class DioScreen extends StatelessWidget {
  const DioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DioMainScreen();
  }
}

class DioMainScreen extends StatelessWidget {
  const DioMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio Sample'),
      ),
      body: Center(
        child: Text('Dio'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await SampleApi().getProducts();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
