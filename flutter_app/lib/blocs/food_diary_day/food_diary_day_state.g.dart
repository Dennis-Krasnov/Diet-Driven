// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_day_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FoodDiaryDayUninitialized extends FoodDiaryDayUninitialized {
  factory _$FoodDiaryDayUninitialized(
          [void Function(FoodDiaryDayUninitializedBuilder) updates]) =>
      (new FoodDiaryDayUninitializedBuilder()..update(updates)).build();

  _$FoodDiaryDayUninitialized._() : super._();

  @override
  FoodDiaryDayUninitialized rebuild(
          void Function(FoodDiaryDayUninitializedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDiaryDayUninitializedBuilder toBuilder() =>
      new FoodDiaryDayUninitializedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryDayUninitialized;
  }

  @override
  int get hashCode {
    return 703389516;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('FoodDiaryDayUninitialized').toString();
  }
}

class FoodDiaryDayUninitializedBuilder
    implements
        Builder<FoodDiaryDayUninitialized, FoodDiaryDayUninitializedBuilder> {
  _$FoodDiaryDayUninitialized _$v;

  FoodDiaryDayUninitializedBuilder();

  @override
  void replace(FoodDiaryDayUninitialized other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodDiaryDayUninitialized;
  }

  @override
  void update(void Function(FoodDiaryDayUninitializedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryDayUninitialized build() {
    final _$result = _$v ?? new _$FoodDiaryDayUninitialized._();
    replace(_$result);
    return _$result;
  }
}

class _$FoodDiaryDayLoaded extends FoodDiaryDayLoaded {
  @override
  final FoodDiaryDay foodDiaryDay;
  @override
  final Diet diet;

  factory _$FoodDiaryDayLoaded(
          [void Function(FoodDiaryDayLoadedBuilder) updates]) =>
      (new FoodDiaryDayLoadedBuilder()..update(updates)).build();

  _$FoodDiaryDayLoaded._({this.foodDiaryDay, this.diet}) : super._() {
    if (diet == null) {
      throw new BuiltValueNullFieldError('FoodDiaryDayLoaded', 'diet');
    }
  }

  @override
  FoodDiaryDayLoaded rebuild(
          void Function(FoodDiaryDayLoadedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDiaryDayLoadedBuilder toBuilder() =>
      new FoodDiaryDayLoadedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryDayLoaded &&
        foodDiaryDay == other.foodDiaryDay &&
        diet == other.diet;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, foodDiaryDay.hashCode), diet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryDayLoaded')
          ..add('foodDiaryDay', foodDiaryDay)
          ..add('diet', diet))
        .toString();
  }
}

class FoodDiaryDayLoadedBuilder
    implements Builder<FoodDiaryDayLoaded, FoodDiaryDayLoadedBuilder> {
  _$FoodDiaryDayLoaded _$v;

  FoodDiaryDayBuilder _foodDiaryDay;
  FoodDiaryDayBuilder get foodDiaryDay =>
      _$this._foodDiaryDay ??= new FoodDiaryDayBuilder();
  set foodDiaryDay(FoodDiaryDayBuilder foodDiaryDay) =>
      _$this._foodDiaryDay = foodDiaryDay;

  DietBuilder _diet;
  DietBuilder get diet => _$this._diet ??= new DietBuilder();
  set diet(DietBuilder diet) => _$this._diet = diet;

  FoodDiaryDayLoadedBuilder();

  FoodDiaryDayLoadedBuilder get _$this {
    if (_$v != null) {
      _foodDiaryDay = _$v.foodDiaryDay?.toBuilder();
      _diet = _$v.diet?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodDiaryDayLoaded other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodDiaryDayLoaded;
  }

  @override
  void update(void Function(FoodDiaryDayLoadedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryDayLoaded build() {
    _$FoodDiaryDayLoaded _$result;
    try {
      _$result = _$v ??
          new _$FoodDiaryDayLoaded._(
              foodDiaryDay: _foodDiaryDay?.build(), diet: diet.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodDiaryDay';
        _foodDiaryDay?.build();
        _$failedField = 'diet';
        diet.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FoodDiaryDayLoaded', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
