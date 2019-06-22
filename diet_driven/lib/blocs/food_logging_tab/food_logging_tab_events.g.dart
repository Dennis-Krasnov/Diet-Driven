// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_logging_tab_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResultsArrived extends ResultsArrived {
  @override
  final BuiltList<FoodRecordResult> results;

  factory _$ResultsArrived([void Function(ResultsArrivedBuilder) updates]) =>
      (new ResultsArrivedBuilder()..update(updates)).build();

  _$ResultsArrived._({this.results}) : super._() {
    if (results == null) {
      throw new BuiltValueNullFieldError('ResultsArrived', 'results');
    }
  }

  @override
  ResultsArrived rebuild(void Function(ResultsArrivedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResultsArrivedBuilder toBuilder() =>
      new ResultsArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResultsArrived && results == other.results;
  }

  @override
  int get hashCode {
    return $jf($jc(0, results.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ResultsArrived')
          ..add('results', results))
        .toString();
  }
}

class ResultsArrivedBuilder
    implements Builder<ResultsArrived, ResultsArrivedBuilder> {
  _$ResultsArrived _$v;

  ListBuilder<FoodRecordResult> _results;
  ListBuilder<FoodRecordResult> get results =>
      _$this._results ??= new ListBuilder<FoodRecordResult>();
  set results(ListBuilder<FoodRecordResult> results) =>
      _$this._results = results;

  ResultsArrivedBuilder();

  ResultsArrivedBuilder get _$this {
    if (_$v != null) {
      _results = _$v.results?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResultsArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ResultsArrived;
  }

  @override
  void update(void Function(ResultsArrivedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ResultsArrived build() {
    _$ResultsArrived _$result;
    try {
      _$result = _$v ?? new _$ResultsArrived._(results: results.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ResultsArrived', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FoodLoggingTabError extends FoodLoggingTabError {
  @override
  final String error;
  @override
  final String trace;

  factory _$FoodLoggingTabError(
          [void Function(FoodLoggingTabErrorBuilder) updates]) =>
      (new FoodLoggingTabErrorBuilder()..update(updates)).build();

  _$FoodLoggingTabError._({this.error, this.trace}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('FoodLoggingTabError', 'error');
    }
    if (trace == null) {
      throw new BuiltValueNullFieldError('FoodLoggingTabError', 'trace');
    }
  }

  @override
  FoodLoggingTabError rebuild(
          void Function(FoodLoggingTabErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodLoggingTabErrorBuilder toBuilder() =>
      new FoodLoggingTabErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodLoggingTabError &&
        error == other.error &&
        trace == other.trace;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), trace.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodLoggingTabError')
          ..add('error', error)
          ..add('trace', trace))
        .toString();
  }
}

class FoodLoggingTabErrorBuilder
    implements Builder<FoodLoggingTabError, FoodLoggingTabErrorBuilder> {
  _$FoodLoggingTabError _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  String _trace;
  String get trace => _$this._trace;
  set trace(String trace) => _$this._trace = trace;

  FoodLoggingTabErrorBuilder();

  FoodLoggingTabErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _trace = _$v.trace;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodLoggingTabError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodLoggingTabError;
  }

  @override
  void update(void Function(FoodLoggingTabErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodLoggingTabError build() {
    final _$result =
        _$v ?? new _$FoodLoggingTabError._(error: error, trace: trace);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
