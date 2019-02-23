library test_counter;

import 'package:built_redux/built_redux.dart';
import 'package:built_value/built_value.dart';

part 'test_counter.g.dart';

abstract class CounterActions extends ReduxActions {
  ActionDispatcher<int> increment;
  ActionDispatcher<int> decrement;
  ActionDispatcher<int> incrementAsync;
  ActionDispatcher<int> decrementAsync;

  CounterActions._();
  factory CounterActions() => _$CounterActions();
}

Reducer<Counter, CounterBuilder, dynamic> createReducer() =>
    (ReducerBuilder<Counter, CounterBuilder>()
          ..add<int>(
              CounterActionsNames.increment, (s, a, b) => b.count += a.payload)
          ..add<int>(
              CounterActionsNames.decrement, (s, a, b) => b.count -= a.payload))
        .build();

// Built Reducer
abstract class Counter implements Built<Counter, CounterBuilder> {
  int get count;

  // Built value constructor
  Counter._();
  factory Counter() => _$Counter._(count: 1);
}
