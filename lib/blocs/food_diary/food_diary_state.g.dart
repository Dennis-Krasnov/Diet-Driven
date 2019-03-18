// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FoodDiaryLoading extends FoodDiaryLoading {
  factory _$FoodDiaryLoading([void updates(FoodDiaryLoadingBuilder b)]) =>
      (new FoodDiaryLoadingBuilder()..update(updates)).build();

  _$FoodDiaryLoading._() : super._();

  @override
  FoodDiaryLoading rebuild(void updates(FoodDiaryLoadingBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDiaryLoadingBuilder toBuilder() =>
      new FoodDiaryLoadingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryLoading;
  }

  @override
  int get hashCode {
    return 754067686;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('FoodDiaryLoading').toString();
  }
}

class FoodDiaryLoadingBuilder
    implements Builder<FoodDiaryLoading, FoodDiaryLoadingBuilder> {
  _$FoodDiaryLoading _$v;

  FoodDiaryLoadingBuilder();

  @override
  void replace(FoodDiaryLoading other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodDiaryLoading;
  }

  @override
  void update(void updates(FoodDiaryLoadingBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryLoading build() {
    final _$result = _$v ?? new _$FoodDiaryLoading._();
    replace(_$result);
    return _$result;
  }
}

class _$FoodDiaryLoaded extends FoodDiaryLoaded {
  @override
  final StreamDataBloc<BuiltList<FoodDiaryDay>> foodDiaryDayStreamBloc;

  factory _$FoodDiaryLoaded([void updates(FoodDiaryLoadedBuilder b)]) =>
      (new FoodDiaryLoadedBuilder()..update(updates)).build();

  _$FoodDiaryLoaded._({this.foodDiaryDayStreamBloc}) : super._() {
    if (foodDiaryDayStreamBloc == null) {
      throw new BuiltValueNullFieldError(
          'FoodDiaryLoaded', 'foodDiaryDayStreamBloc');
    }
  }

  @override
  FoodDiaryLoaded rebuild(void updates(FoodDiaryLoadedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDiaryLoadedBuilder toBuilder() =>
      new FoodDiaryLoadedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryLoaded &&
        foodDiaryDayStreamBloc == other.foodDiaryDayStreamBloc;
  }

  @override
  int get hashCode {
    return $jf($jc(0, foodDiaryDayStreamBloc.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryLoaded')
          ..add('foodDiaryDayStreamBloc', foodDiaryDayStreamBloc))
        .toString();
  }
}

class FoodDiaryLoadedBuilder
    implements Builder<FoodDiaryLoaded, FoodDiaryLoadedBuilder> {
  _$FoodDiaryLoaded _$v;

  StreamDataBloc<BuiltList<FoodDiaryDay>> _foodDiaryDayStreamBloc;
  StreamDataBloc<BuiltList<FoodDiaryDay>> get foodDiaryDayStreamBloc =>
      _$this._foodDiaryDayStreamBloc;
  set foodDiaryDayStreamBloc(
          StreamDataBloc<BuiltList<FoodDiaryDay>> foodDiaryDayStreamBloc) =>
      _$this._foodDiaryDayStreamBloc = foodDiaryDayStreamBloc;

  FoodDiaryLoadedBuilder();

  FoodDiaryLoadedBuilder get _$this {
    if (_$v != null) {
      _foodDiaryDayStreamBloc = _$v.foodDiaryDayStreamBloc;
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
  void update(void updates(FoodDiaryLoadedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryLoaded build() {
    final _$result = _$v ??
        new _$FoodDiaryLoaded._(foodDiaryDayStreamBloc: foodDiaryDayStreamBloc);
    replace(_$result);
    return _$result;
  }
}

class _$FoodDiaryFailed extends FoodDiaryFailed {
  @override
  final String errorMessage;

  factory _$FoodDiaryFailed([void updates(FoodDiaryFailedBuilder b)]) =>
      (new FoodDiaryFailedBuilder()..update(updates)).build();

  _$FoodDiaryFailed._({this.errorMessage}) : super._() {
    if (errorMessage == null) {
      throw new BuiltValueNullFieldError('FoodDiaryFailed', 'errorMessage');
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
    return other is FoodDiaryFailed && errorMessage == other.errorMessage;
  }

  @override
  int get hashCode {
    return $jf($jc(0, errorMessage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryFailed')
          ..add('errorMessage', errorMessage))
        .toString();
  }
}

class FoodDiaryFailedBuilder
    implements Builder<FoodDiaryFailed, FoodDiaryFailedBuilder> {
  _$FoodDiaryFailed _$v;

  String _errorMessage;
  String get errorMessage => _$this._errorMessage;
  set errorMessage(String errorMessage) => _$this._errorMessage = errorMessage;

  FoodDiaryFailedBuilder();

  FoodDiaryFailedBuilder get _$this {
    if (_$v != null) {
      _errorMessage = _$v.errorMessage;
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
    final _$result = _$v ?? new _$FoodDiaryFailed._(errorMessage: errorMessage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
