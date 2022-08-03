import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/ui/package/bloc/counter/bloc_counter_screen.dart';
import 'package:flutter_sample/ui/package/bloc/counter/counter_bloc.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: BlocCounterScreen()
    );
  }
}
