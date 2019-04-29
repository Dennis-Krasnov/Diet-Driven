// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FoodDiaryUninitialized extends FoodDiaryUninitialized {
  factory _$FoodDiaryUninitialized(
          [void Function(FoodDiaryUninitializedBuilder) updates]) =>
      (new FoodDiaryUninitializedBuilder()..update(updates)).build();

  _$FoodDiaryUninitialized._() : super._();

  @override
  FoodDiaryUninitialized rebuild(
          void Function(FoodDiaryUninitializedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDiaryUninitializedBuilder toBuilder() =>
      new FoodDiaryUninitializedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryUninitialized;
  }

  @override
  int get hashCode {
    return 9984324;
  }
}

class FoodDiaryUninitializedBuilder
    implements Builder<FoodDiaryUninitialized, FoodDiaryUninitializedBuilder> {
  _$FoodDiaryUninitialized _$v;

  FoodDiaryUninitializedBuilder();

  @override
  void replace(FoodDiaryUninitialized other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodDiaryUninitialized;
  }

  @override
  void update(void Function(FoodDiaryUninitializedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryUninitialized build() {
    final _$result = _$v ?? new _$FoodDiaryUninitialized._();
    replace(_$result);
    return _$result;
  }
}

class _$FoodDiaryFailed extends FoodDiaryFailed {
  @override
  final String error;
  @override
  final String trace;

  factory _$FoodDiaryFailed([void Function(FoodDiaryFailedBuilder) updates]) =>
      (new FoodDiaryFailedBuilder()..update(updates)).build();

  _$FoodDiaryFailed._({this.error, this.trace}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('FoodDiaryFailed', 'error');
    }
    if (trace == null) {
      throw new BuiltValueNullFieldError('FoodDiaryFailed', 'trace');
    }
  }

  @override
  FoodDiaryFailed rebuild(void Function(FoodDiaryFailedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDiaryFailedBuilder toBuilder() =>
      new FoodDiaryFailedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryFailed &&
        error == other.error &&
        trace == other.trace;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), trace.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryFailed')
          ..add('error', error)
          ..add('trace', trace))
        .toString();
  }
}

class FoodDiaryFailedBuilder
    implements Builder<FoodDiaryFailed, FoodDiaryFailedBuilder> {
  _$FoodDiaryFailed _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  String _trace;
  String get trace => _$this._trace;
  set trace(String trace) => _$this._trace = trace;

  FoodDiaryFailedBuilder();

  FoodDiaryFailedBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _trace = _$v.trace;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodDiaryFailed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodDiaryFailed;
  }

  @override
  void update(void Function(FoodDiaryFailedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryFailed build() {
    final _$result = _$v ?? new _$FoodDiaryFailed._(error: error, trace: trace);
    replace(_$result);
    return _$result;
  }
}

class _$FoodDiaryLoaded extends FoodDiaryLoaded {
  @override
  final FoodDiaryDay foodDiaryDay;
  @override
  final Diet diet;
  @override
  final int skipNextNArrivals;

  factory _$FoodDiaryLoaded([void Function(FoodDiaryLoadedBuilder) updates]) =>
      (new FoodDiaryLoadedBuilder()..update(updates)).build()
          as _$FoodDiaryLoaded;

  _$FoodDiaryLoaded._({this.foodDiaryDay, this.diet, this.skipNextNArrivals})
      : super._() {
    if (foodDiaryDay == null) {
      throw new BuiltValueNullFieldError('FoodDiaryLoaded', 'foodDiaryDay');
    }
    if (diet == null) {
      throw new BuiltValueNullFieldError('FoodDiaryLoaded', 'diet');
    }
    if (skipNextNArrivals == null) {
      throw new BuiltValueNullFieldError(
          'FoodDiaryLoaded', 'skipNextNArrivals');
    }
  }

  @override
  FoodDiaryLoaded rebuild(void Function(FoodDiaryLoadedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$FoodDiaryLoadedBuilder toBuilder() =>
      new _$FoodDiaryLoadedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryLoaded &&
        foodDiaryDay == other.foodDiaryDay &&
        diet == other.diet &&
        skipNextNArrivals == other.skipNextNArrivals;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, foodDiaryDay.hashCode), diet.hashCode),
        skipNextNArrivals.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryLoaded')
          ..add('foodDiaryDay', foodDiaryDay)
          ..add('diet', diet)
          ..add('skipNextNArrivals', skipNextNArrivals))
        .toString();
  }
}

class _$FoodDiaryLoadedBuilder extends FoodDiaryLoadedBuilder {
  _$FoodDiaryLoaded _$v;

  @override
  FoodDiaryDay get foodDiaryDay {
    _$this;
    return super.foodDiaryDay;
  }

  @override
  set foodDiaryDay(FoodDiaryDay foodDiaryDay) {
    _$this;
    super.foodDiaryDay = foodDiaryDay;
  }

  @override
  Diet get diet {
    _$this;
    return super.diet;
  }

  @override
  set diet(Diet diet) {
    _$this;
    super.diet = diet;
  }

  @override
  int get skipNextNArrivals {
    _$this;
    return super.skipNextNArrivals;
  }

  @override
  set skipNextNArrivals(int skipNextNArrivals) {
    _$this;
    super.skipNextNArrivals = skipNextNArrivals;
  }

  _$FoodDiaryLoadedBuilder() : super._();

  FoodDiaryLoadedBuilder get _$this {
    if (_$v != null) {
      super.foodDiaryDay = _$v.foodDiaryDay;
      super.diet = _$v.diet;
      super.skipNextNArrivals = _$v.skipNextNArrivals;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodDiaryLoaded other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodDiaryLoaded;
  }

  @override
  void update(void Function(FoodDiaryLoadedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryLoaded build() {
    final _$result = _$v ??
        new _$FoodDiaryLoaded._(
            foodDiaryDay: foodDiaryDay,
            diet: diet,
            skipNextNArrivals: skipNextNArrivals);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
