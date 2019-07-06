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

  factory _$FoodDiaryLoaded([void Function(FoodDiaryLoadedBuilder) updates]) =>
      (new FoodDiaryLoadedBuilder()..update(updates)).build();

  _$FoodDiaryLoaded._({this.foodDiaryDay, this.diet}) : super._() {
    if (foodDiaryDay == null) {
      throw new BuiltValueNullFieldError('FoodDiaryLoaded', 'foodDiaryDay');
    }
    if (diet == null) {
      throw new BuiltValueNullFieldError('FoodDiaryLoaded', 'diet');
    }
  }

  @override
  FoodDiaryLoaded rebuild(void Function(FoodDiaryLoadedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDiaryLoadedBuilder toBuilder() =>
      new FoodDiaryLoadedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryLoaded &&
        foodDiaryDay == other.foodDiaryDay &&
        diet == other.diet;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, foodDiaryDay.hashCode), diet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryLoaded')
          ..add('foodDiaryDay', foodDiaryDay)
          ..add('diet', diet))
        .toString();
  }
}

class FoodDiaryLoadedBuilder
    implements Builder<FoodDiaryLoaded, FoodDiaryLoadedBuilder> {
  _$FoodDiaryLoaded _$v;

  FoodDiaryDayBuilder _foodDiaryDay;
  FoodDiaryDayBuilder get foodDiaryDay =>
      _$this._foodDiaryDay ??= new FoodDiaryDayBuilder();
  set foodDiaryDay(FoodDiaryDayBuilder foodDiaryDay) =>
      _$this._foodDiaryDay = foodDiaryDay;

  DietBuilder _diet;
  DietBuilder get diet => _$this._diet ??= new DietBuilder();
  set diet(DietBuilder diet) => _$this._diet = diet;

  FoodDiaryLoadedBuilder();

  FoodDiaryLoadedBuilder get _$this {
    if (_$v != null) {
      _foodDiaryDay = _$v.foodDiaryDay?.toBuilder();
      _diet = _$v.diet?.toBuilder();
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
    _$FoodDiaryLoaded _$result;
    try {
      _$result = _$v ??
          new _$FoodDiaryLoaded._(
              foodDiaryDay: foodDiaryDay.build(), diet: diet.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodDiaryDay';
        foodDiaryDay.build();
        _$failedField = 'diet';
        diet.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FoodDiaryLoaded', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
