// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_logging_tab_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FoodLoggingTabUninitialized extends FoodLoggingTabUninitialized {
  factory _$FoodLoggingTabUninitialized(
          [void Function(FoodLoggingTabUninitializedBuilder) updates]) =>
      (new FoodLoggingTabUninitializedBuilder()..update(updates)).build();

  _$FoodLoggingTabUninitialized._() : super._();

  @override
  FoodLoggingTabUninitialized rebuild(
          void Function(FoodLoggingTabUninitializedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodLoggingTabUninitializedBuilder toBuilder() =>
      new FoodLoggingTabUninitializedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodLoggingTabUninitialized;
  }

  @override
  int get hashCode {
    return 206649877;
  }
}

class FoodLoggingTabUninitializedBuilder
    implements
        Builder<FoodLoggingTabUninitialized,
            FoodLoggingTabUninitializedBuilder> {
  _$FoodLoggingTabUninitialized _$v;

  FoodLoggingTabUninitializedBuilder();

  @override
  void replace(FoodLoggingTabUninitialized other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodLoggingTabUninitialized;
  }

  @override
  void update(void Function(FoodLoggingTabUninitializedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodLoggingTabUninitialized build() {
    final _$result = _$v ?? new _$FoodLoggingTabUninitialized._();
    replace(_$result);
    return _$result;
  }
}

class _$FoodLoggingTabLoaded extends FoodLoggingTabLoaded {
  @override
  final BuiltList<FoodRecordResult> results;

  factory _$FoodLoggingTabLoaded(
          [void Function(FoodLoggingTabLoadedBuilder) updates]) =>
      (new FoodLoggingTabLoadedBuilder()..update(updates)).build();

  _$FoodLoggingTabLoaded._({this.results}) : super._() {
    if (results == null) {
      throw new BuiltValueNullFieldError('FoodLoggingTabLoaded', 'results');
    }
  }

  @override
  FoodLoggingTabLoaded rebuild(
          void Function(FoodLoggingTabLoadedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodLoggingTabLoadedBuilder toBuilder() =>
      new FoodLoggingTabLoadedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodLoggingTabLoaded && results == other.results;
  }

  @override
  int get hashCode {
    return $jf($jc(0, results.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodLoggingTabLoaded')
          ..add('results', results))
        .toString();
  }
}

class FoodLoggingTabLoadedBuilder
    implements Builder<FoodLoggingTabLoaded, FoodLoggingTabLoadedBuilder> {
  _$FoodLoggingTabLoaded _$v;

  ListBuilder<FoodRecordResult> _results;
  ListBuilder<FoodRecordResult> get results =>
      _$this._results ??= new ListBuilder<FoodRecordResult>();
  set results(ListBuilder<FoodRecordResult> results) =>
      _$this._results = results;

  FoodLoggingTabLoadedBuilder();

  FoodLoggingTabLoadedBuilder get _$this {
    if (_$v != null) {
      _results = _$v.results?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodLoggingTabLoaded other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodLoggingTabLoaded;
  }

  @override
  void update(void Function(FoodLoggingTabLoadedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodLoggingTabLoaded build() {
    _$FoodLoggingTabLoaded _$result;
    try {
      _$result = _$v ?? new _$FoodLoggingTabLoaded._(results: results.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FoodLoggingTabLoaded', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FoodLoggingTabFailed extends FoodLoggingTabFailed {
  factory _$FoodLoggingTabFailed(
          [void Function(FoodLoggingTabFailedBuilder) updates]) =>
      (new FoodLoggingTabFailedBuilder()..update(updates)).build();

  _$FoodLoggingTabFailed._() : super._();

  @override
  FoodLoggingTabFailed rebuild(
          void Function(FoodLoggingTabFailedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodLoggingTabFailedBuilder toBuilder() =>
      new FoodLoggingTabFailedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodLoggingTabFailed;
  }

  @override
  int get hashCode {
    return 748410627;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('FoodLoggingTabFailed').toString();
  }
}

class FoodLoggingTabFailedBuilder
    implements Builder<FoodLoggingTabFailed, FoodLoggingTabFailedBuilder> {
  _$FoodLoggingTabFailed _$v;

  FoodLoggingTabFailedBuilder();

  @override
  void replace(FoodLoggingTabFailed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodLoggingTabFailed;
  }

  @override
  void update(void Function(FoodLoggingTabFailedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodLoggingTabFailed build() {
    final _$result = _$v ?? new _$FoodLoggingTabFailed._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
