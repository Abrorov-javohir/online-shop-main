import 'package:bloc/bloc.dart';

class CounterCubid extends Cubit<int> {
  CounterCubid() : super(0);
  void decrement() {
    emit(state - 1);
  }

  void increment() {
    emit(state + 1);
  }
}
