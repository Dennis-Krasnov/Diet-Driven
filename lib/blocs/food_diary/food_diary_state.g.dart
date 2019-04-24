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

  factory _$FoodDiaryFailed([void Function(FoodDiaryFailedBuilder) updates]) =>
      (new FoodDiaryFailedBuilder()..update(updates)).build();

  _$FoodDiaryFailed._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('FoodDiaryFailed', 'error');
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
    return other is FoodDiaryFailed && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryFailed')..add('error', error))
        .toString();
  }
}

class FoodDiaryFailedBuilder
    implements Builder<FoodDiaryFailed, FoodDiaryFailedBuilder> {
  _$FoodDiaryFailed _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  FoodDiaryFailedBuilder();

  FoodDiaryFailedBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
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
    final _$result = _$v ?? new _$FoodDiaryFailed._(error: error);
    replace(_$result);
    return _$result;
  }
}

class _$FoodDiaryLoaded extends FoodDiaryLoaded {
  @override
  final FoodDiaryDay foodDiaryDay;

  factory _$FoodDiaryLoaded([void Function(FoodDiaryLoadedBuilder) updates]) =>
      (new FoodDiaryLoadedBuilder()..update(updates)).build();

  _$FoodDiaryLoaded._({this.foodDiaryDay}) : super._() {
    if (foodDiaryDay == null) {
      throw new BuiltValueNullFieldError('FoodDiaryLoaded', 'foodDiaryDay');
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
    return other is FoodDiaryLoaded && foodDiaryDay == other.foodDiaryDay;
  }

  @override
  int get hashCode {
    return $jf($jc(0, foodDiaryDay.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryLoaded')
          ..add('foodDiaryDay', foodDiaryDay))
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

  FoodDiaryLoadedBuilder();

  FoodDiaryLoadedBuilder get _$this {
    if (_$v != null) {
      _foodDiaryDay = _$v.foodDiaryDay?.toBuilder();
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
      _$result =
          _$v ?? new _$FoodDiaryLoaded._(foodDiaryDay: foodDiaryDay.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodDiaryDay';
        foodDiaryDay.build();
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
