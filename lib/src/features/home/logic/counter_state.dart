part of 'counter_cubit.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState.initial({ required int value }) = _Initial;
}
