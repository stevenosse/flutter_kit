import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_state.dart';
part 'counter_cubit.freezed.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState.initial(value: 0));

  void increment() {
    emit(state.copyWith(value: state.value + 1));
  }
}
