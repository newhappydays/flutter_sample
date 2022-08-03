import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('$error, $stackTrace');
  }
}

class BTypeCounterCubit extends Cubit<int> {
  BTypeCounterCubit(int initialState) : super(initialState);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}