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

  @override
  String toString() {
    return newBuiltValueToStringHelper('FoodDiaryUninitialized').toString();
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
  final Object error;
  @override
  final StackTrace stacktrace;

  factory _$FoodDiaryFailed([void Function(FoodDiaryFailedBuilder) updates]) =>
      (new FoodDiaryFailedBuilder()..update(updates)).build();

  _$FoodDiaryFailed._({this.error, this.stacktrace}) : super._() {
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
    return other is FoodDiaryFailed &&
        error == other.error &&
        stacktrace == other.stacktrace;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), stacktrace.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryFailed')
          ..add('error', error)
          ..add('stacktrace', stacktrace))
        .toString();
  }
}

class FoodDiaryFailedBuilder
    implements
        Builder<FoodDiaryFailed, FoodDiaryFailedBuilder>,
        BuiltErrorBuilder {
  _$FoodDiaryFailed _$v;

  Object _error;
  Object get error => _$this._error;
  set error(Object error) => _$this._error = error;

  StackTrace _stacktrace;
  StackTrace get stacktrace => _$this._stacktrace;
  set stacktrace(StackTrace stacktrace) => _$this._stacktrace = stacktrace;

  FoodDiaryFailedBuilder();

  FoodDiaryFailedBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _stacktrace = _$v.stacktrace;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FoodDiaryFailed other) {
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
    final _$result =
        _$v ?? new _$FoodDiaryFailed._(error: error, stacktrace: stacktrace);
    replace(_$result);
    return _$result;
  }
}

class _$FoodDiaryLoaded extends FoodDiaryLoaded {
  @override
  final BuiltMap<int, FoodDiaryDay> diaryDays;
  @override
  final BuiltList<Diet> diets;

  factory _$FoodDiaryLoaded([void Function(FoodDiaryLoadedBuilder) updates]) =>
      (new FoodDiaryLoadedBuilder()..update(updates)).build();

  _$FoodDiaryLoaded._({this.diaryDays, this.diets}) : super._() {
    if (diaryDays == null) {
      throw new BuiltValueNullFieldError('FoodDiaryLoaded', 'diaryDays');
    }
    if (diets == null) {
      throw new BuiltValueNullFieldError('FoodDiaryLoaded', 'diets');
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
        diaryDays == other.diaryDays &&
        diets == other.diets;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, diaryDays.hashCode), diets.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryLoaded')
          ..add('diaryDays', diaryDays)
          ..add('diets', diets))
        .toString();
  }
}

class FoodDiaryLoadedBuilder
    implements Builder<FoodDiaryLoaded, FoodDiaryLoadedBuilder> {
  _$FoodDiaryLoaded _$v;

  MapBuilder<int, FoodDiaryDay> _diaryDays;
  MapBuilder<int, FoodDiaryDay> get diaryDays =>
      _$this._diaryDays ??= new MapBuilder<int, FoodDiaryDay>();
  set diaryDays(MapBuilder<int, FoodDiaryDay> diaryDays) =>
      _$this._diaryDays = diaryDays;

  ListBuilder<Diet> _diets;
  ListBuilder<Diet> get diets => _$this._diets ??= new ListBuilder<Diet>();
  set diets(ListBuilder<Diet> diets) => _$this._diets = diets;

  FoodDiaryLoadedBuilder();

  FoodDiaryLoadedBuilder get _$this {
    if (_$v != null) {
      _diaryDays = _$v.diaryDays?.toBuilder();
      _diets = _$v.diets?.toBuilder();
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
              diaryDays: diaryDays.build(), diets: diets.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'diaryDays';
        diaryDays.build();
        _$failedField = 'diets';
        diets.build();
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
