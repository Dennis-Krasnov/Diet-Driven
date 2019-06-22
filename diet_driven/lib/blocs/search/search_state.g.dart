// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FoodSearchQuery extends FoodSearchQuery {
  @override
  final String query;
  @override
  final BuiltList<String> suggestions;

  factory _$FoodSearchQuery([void Function(FoodSearchQueryBuilder) updates]) =>
      (new FoodSearchQueryBuilder()..update(updates)).build();

  _$FoodSearchQuery._({this.query, this.suggestions}) : super._() {
    if (query == null) {
      throw new BuiltValueNullFieldError('FoodSearchQuery', 'query');
    }
    if (suggestions == null) {
      throw new BuiltValueNullFieldError('FoodSearchQuery', 'suggestions');
    }
  }

  @override
  FoodSearchQuery rebuild(void Function(FoodSearchQueryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodSearchQueryBuilder toBuilder() =>
      new FoodSearchQueryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodSearchQuery &&
        query == other.query &&
        suggestions == other.suggestions;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, query.hashCode), suggestions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodSearchQuery')
          ..add('query', query)
          ..add('suggestions', suggestions))
        .toString();
  }
}

class FoodSearchQueryBuilder
    implements Builder<FoodSearchQuery, FoodSearchQueryBuilder> {
  _$FoodSearchQuery _$v;

  String _query;
  String get query => _$this._query;
  set query(String query) => _$this._query = query;

  ListBuilder<String> _suggestions;
  ListBuilder<String> get suggestions =>
      _$this._suggestions ??= new ListBuilder<String>();
  set suggestions(ListBuilder<String> suggestions) =>
      _$this._suggestions = suggestions;

  FoodSearchQueryBuilder();

  FoodSearchQueryBuilder get _$this {
    if (_$v != null) {
      _query = _$v.query;
      _suggestions = _$v.suggestions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodSearchQuery other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodSearchQuery;
  }

  @override
  void update(void Function(FoodSearchQueryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodSearchQuery build() {
    _$FoodSearchQuery _$result;
    try {
      _$result = _$v ??
          new _$FoodSearchQuery._(
              query: query, suggestions: suggestions.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'suggestions';
        suggestions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FoodSearchQuery', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FoodSearchLoading extends FoodSearchLoading {
  factory _$FoodSearchLoading(
          [void Function(FoodSearchLoadingBuilder) updates]) =>
      (new FoodSearchLoadingBuilder()..update(updates)).build();

  _$FoodSearchLoading._() : super._();

  @override
  FoodSearchLoading rebuild(void Function(FoodSearchLoadingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodSearchLoadingBuilder toBuilder() =>
      new FoodSearchLoadingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodSearchLoading;
  }

  @override
  int get hashCode {
    return 64274597;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('FoodSearchLoading').toString();
  }
}

class FoodSearchLoadingBuilder
    implements Builder<FoodSearchLoading, FoodSearchLoadingBuilder> {
  _$FoodSearchLoading _$v;

  FoodSearchLoadingBuilder();

  @override
  void replace(FoodSearchLoading other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodSearchLoading;
  }

  @override
  void update(void Function(FoodSearchLoadingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodSearchLoading build() {
    final _$result = _$v ?? new _$FoodSearchLoading._();
    replace(_$result);
    return _$result;
  }
}

class _$FoodSearchFailed extends FoodSearchFailed {
  @override
  final String error;
  @override
  final String trace;

  factory _$FoodSearchFailed(
          [void Function(FoodSearchFailedBuilder) updates]) =>
      (new FoodSearchFailedBuilder()..update(updates)).build();

  _$FoodSearchFailed._({this.error, this.trace}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('FoodSearchFailed', 'error');
    }
    if (trace == null) {
      throw new BuiltValueNullFieldError('FoodSearchFailed', 'trace');
    }
  }

  @override
  FoodSearchFailed rebuild(void Function(FoodSearchFailedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodSearchFailedBuilder toBuilder() =>
      new FoodSearchFailedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodSearchFailed &&
        error == other.error &&
        trace == other.trace;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), trace.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodSearchFailed')
          ..add('error', error)
          ..add('trace', trace))
        .toString();
  }
}

class FoodSearchFailedBuilder
    implements Builder<FoodSearchFailed, FoodSearchFailedBuilder> {
  _$FoodSearchFailed _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  String _trace;
  String get trace => _$this._trace;
  set trace(String trace) => _$this._trace = trace;

  FoodSearchFailedBuilder();

  FoodSearchFailedBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _trace = _$v.trace;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodSearchFailed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodSearchFailed;
  }

  @override
  void update(void Function(FoodSearchFailedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodSearchFailed build() {
    final _$result =
        _$v ?? new _$FoodSearchFailed._(error: error, trace: trace);
    replace(_$result);
    return _$result;
  }
}

class _$FoodSearchLoaded extends FoodSearchLoaded {
  @override
  final BuiltList<FoodRecordResult> results;

  factory _$FoodSearchLoaded(
          [void Function(FoodSearchLoadedBuilder) updates]) =>
      (new FoodSearchLoadedBuilder()..update(updates)).build();

  _$FoodSearchLoaded._({this.results}) : super._() {
    if (results == null) {
      throw new BuiltValueNullFieldError('FoodSearchLoaded', 'results');
    }
  }

  @override
  FoodSearchLoaded rebuild(void Function(FoodSearchLoadedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodSearchLoadedBuilder toBuilder() =>
      new FoodSearchLoadedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodSearchLoaded && results == other.results;
  }

  @override
  int get hashCode {
    return $jf($jc(0, results.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodSearchLoaded')
          ..add('results', results))
        .toString();
  }
}

class FoodSearchLoadedBuilder
    implements Builder<FoodSearchLoaded, FoodSearchLoadedBuilder> {
  _$FoodSearchLoaded _$v;

  ListBuilder<FoodRecordResult> _results;
  ListBuilder<FoodRecordResult> get results =>
      _$this._results ??= new ListBuilder<FoodRecordResult>();
  set results(ListBuilder<FoodRecordResult> results) =>
      _$this._results = results;

  FoodSearchLoadedBuilder();

  FoodSearchLoadedBuilder get _$this {
    if (_$v != null) {
      _results = _$v.results?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodSearchLoaded other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodSearchLoaded;
  }

  @override
  void update(void Function(FoodSearchLoadedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodSearchLoaded build() {
    _$FoodSearchLoaded _$result;
    try {
      _$result = _$v ?? new _$FoodSearchLoaded._(results: results.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FoodSearchLoaded', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
