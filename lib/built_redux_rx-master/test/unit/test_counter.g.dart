// GENERATED CODE - DO NOT MODIFY BY HAND

part of test_counter;

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$CounterActions extends CounterActions {
  factory _$CounterActions() => new _$CounterActions._();
  _$CounterActions._() : super._();

  final ActionDispatcher<int> increment =
      new ActionDispatcher<int>('CounterActions-increment');
  final ActionDispatcher<int> decrement =
      new ActionDispatcher<int>('CounterActions-decrement');
  final ActionDispatcher<int> incrementAsync =
      new ActionDispatcher<int>('CounterActions-incrementAsync');
  final ActionDispatcher<int> decrementAsync =
      new ActionDispatcher<int>('CounterActions-decrementAsync');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    increment.setDispatcher(dispatcher);
    decrement.setDispatcher(dispatcher);
    incrementAsync.setDispatcher(dispatcher);
    decrementAsync.setDispatcher(dispatcher);
  }
}

class CounterActionsNames {
  static final ActionName<int> increment =
      new ActionName<int>('CounterActions-increment');
  static final ActionName<int> decrement =
      new ActionName<int>('CounterActions-decrement');
  static final ActionName<int> incrementAsync =
      new ActionName<int>('CounterActions-incrementAsync');
  static final ActionName<int> decrementAsync =
      new ActionName<int>('CounterActions-decrementAsync');
}

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Counter extends Counter {
  @override
  final int count;

  factory _$Counter([void updates(CounterBuilder b)]) =>
      (new CounterBuilder()..update(updates)).build();

  _$Counter._({this.count}) : super._() {
    if (count == null) {
      throw new BuiltValueNullFieldError('Counter', 'count');
    }
  }

  @override
  Counter rebuild(void updates(CounterBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CounterBuilder toBuilder() => new CounterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Counter && count == other.count;
  }

  @override
  int get hashCode {
    return $jf($jc(0, count.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Counter')..add('count', count))
        .toString();
  }
}

class CounterBuilder implements Builder<Counter, CounterBuilder> {
  _$Counter _$v;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  CounterBuilder();

  CounterBuilder get _$this {
    if (_$v != null) {
      _count = _$v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Counter other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Counter;
  }

  @override
  void update(void updates(CounterBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Counter build() {
    final _$result = _$v ?? new _$Counter._(count: count);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
