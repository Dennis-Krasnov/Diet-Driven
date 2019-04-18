// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FoodDiaryUninitialized extends FoodDiaryUninitialized {
  factory _$FoodDiaryUninitialized(
          [void updates(FoodDiaryUninitializedBuilder b)]) =>
      (new FoodDiaryUninitializedBuilder()..update(updates)).build();

  _$FoodDiaryUninitialized._() : super._();

  @override
  FoodDiaryUninitialized rebuild(
          void updates(FoodDiaryUninitializedBuilder b)) =>
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
  void update(void updates(FoodDiaryUninitializedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryUninitialized build() {
    final _$result = _$v ?? new _$FoodDiaryUninitialized._();
    replace(_$result);
    return _$result;
  }
}

class _$FoodDiaryReady extends FoodDiaryReady {
  @override
  final ValueObservable<FoodDiaryDay> diaryDay;

  factory _$FoodDiaryReady([void updates(FoodDiaryReadyBuilder b)]) =>
      (new FoodDiaryReadyBuilder()..update(updates)).build();

  _$FoodDiaryReady._({this.diaryDay}) : super._() {
    if (diaryDay == null) {
      throw new BuiltValueNullFieldError('FoodDiaryReady', 'diaryDay');
    }
  }

  @override
  FoodDiaryReady rebuild(void updates(FoodDiaryReadyBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDiaryReadyBuilder toBuilder() =>
      new FoodDiaryReadyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryReady && diaryDay == other.diaryDay;
  }

  @override
  int get hashCode {
    return $jf($jc(0, diaryDay.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryReady')
          ..add('diaryDay', diaryDay))
        .toString();
  }
}

class FoodDiaryReadyBuilder
    implements Builder<FoodDiaryReady, FoodDiaryReadyBuilder> {
  _$FoodDiaryReady _$v;

  ValueObservable<FoodDiaryDay> _diaryDay;
  ValueObservable<FoodDiaryDay> get diaryDay => _$this._diaryDay;
  set diaryDay(ValueObservable<FoodDiaryDay> diaryDay) =>
      _$this._diaryDay = diaryDay;

  FoodDiaryReadyBuilder();

  FoodDiaryReadyBuilder get _$this {
    if (_$v != null) {
      _diaryDay = _$v.diaryDay;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodDiaryReady other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodDiaryReady;
  }

  @override
  void update(void updates(FoodDiaryReadyBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryReady build() {
    final _$result = _$v ?? new _$FoodDiaryReady._(diaryDay: diaryDay);
    replace(_$result);
    return _$result;
  }
}

class _$FoodDiaryFailed extends FoodDiaryFailed {
  @override
  final String error;

  factory _$FoodDiaryFailed([void updates(FoodDiaryFailedBuilder b)]) =>
      (new FoodDiaryFailedBuilder()..update(updates)).build();

  _$FoodDiaryFailed._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('FoodDiaryFailed', 'error');
    }
  }

  @override
  FoodDiaryFailed rebuild(void updates(FoodDiaryFailedBuilder b)) =>
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
  void update(void updates(FoodDiaryFailedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryFailed build() {
    final _$result = _$v ?? new _$FoodDiaryFailed._(error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
