// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_search_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class FoodSearchStateBuilder {
  void replace(FoodSearchState other);
  void update(void Function(FoodSearchStateBuilder) updates);
  String get query;
  set query(String query);

  bool get queryChanged;
  set queryChanged(bool queryChanged);
}

class _$FoodSearchUninitialized extends FoodSearchUninitialized {
  @override
  final String query;
  @override
  final bool queryChanged;

  factory _$FoodSearchUninitialized(
          [void Function(FoodSearchUninitializedBuilder) updates]) =>
      (new FoodSearchUninitializedBuilder()..update(updates)).build()
          as _$FoodSearchUninitialized;

  _$FoodSearchUninitialized._({this.query, this.queryChanged}) : super._() {
    if (query == null) {
      throw new BuiltValueNullFieldError('FoodSearchUninitialized', 'query');
    }
    if (queryChanged == null) {
      throw new BuiltValueNullFieldError(
          'FoodSearchUninitialized', 'queryChanged');
    }
  }

  @override
  FoodSearchUninitialized rebuild(
          void Function(FoodSearchUninitializedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$FoodSearchUninitializedBuilder toBuilder() =>
      new _$FoodSearchUninitializedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodSearchUninitialized &&
        query == other.query &&
        queryChanged == other.queryChanged;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, query.hashCode), queryChanged.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodSearchUninitialized')
          ..add('query', query)
          ..add('queryChanged', queryChanged))
        .toString();
  }
}

class _$FoodSearchUninitializedBuilder extends FoodSearchUninitializedBuilder {
  _$FoodSearchUninitialized _$v;

  @override
  String get query {
    _$this;
    return super.query;
  }

  @override
  set query(String query) {
    _$this;
    super.query = query;
  }

  @override
  bool get queryChanged {
    _$this;
    return super.queryChanged;
  }

  @override
  set queryChanged(bool queryChanged) {
    _$this;
    super.queryChanged = queryChanged;
  }

  _$FoodSearchUninitializedBuilder() : super._();

  FoodSearchUninitializedBuilder get _$this {
    if (_$v != null) {
      super.query = _$v.query;
      super.queryChanged = _$v.queryChanged;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FoodSearchUninitialized other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodSearchUninitialized;
  }

  @override
  void update(void Function(FoodSearchUninitializedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodSearchUninitialized build() {
    final _$result = _$v ??
        new _$FoodSearchUninitialized._(
            query: query, queryChanged: queryChanged);
    replace(_$result);
    return _$result;
  }
}

class _$FoodSearchLoaded extends FoodSearchLoaded {
  @override
  final BuiltList<FoodRecord> results;
  @override
  final bool loading;
  @override
  final String query;
  @override
  final bool queryChanged;

  factory _$FoodSearchLoaded(
          [void Function(FoodSearchLoadedBuilder) updates]) =>
      (new FoodSearchLoadedBuilder()..update(updates)).build();

  _$FoodSearchLoaded._(
      {this.results, this.loading, this.query, this.queryChanged})
      : super._() {
    if (loading == null) {
      throw new BuiltValueNullFieldError('FoodSearchLoaded', 'loading');
    }
    if (query == null) {
      throw new BuiltValueNullFieldError('FoodSearchLoaded', 'query');
    }
    if (queryChanged == null) {
      throw new BuiltValueNullFieldError('FoodSearchLoaded', 'queryChanged');
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
    return other is FoodSearchLoaded &&
        results == other.results &&
        loading == other.loading &&
        query == other.query &&
        queryChanged == other.queryChanged;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, results.hashCode), loading.hashCode), query.hashCode),
        queryChanged.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodSearchLoaded')
          ..add('results', results)
          ..add('loading', loading)
          ..add('query', query)
          ..add('queryChanged', queryChanged))
        .toString();
  }
}

class FoodSearchLoadedBuilder
    implements
        Builder<FoodSearchLoaded, FoodSearchLoadedBuilder>,
        FoodSearchStateBuilder {
  _$FoodSearchLoaded _$v;

  ListBuilder<FoodRecord> _results;
  ListBuilder<FoodRecord> get results =>
      _$this._results ??= new ListBuilder<FoodRecord>();
  set results(ListBuilder<FoodRecord> results) => _$this._results = results;

  bool _loading;
  bool get loading => _$this._loading;
  set loading(bool loading) => _$this._loading = loading;

  String _query;
  String get query => _$this._query;
  set query(String query) => _$this._query = query;

  bool _queryChanged;
  bool get queryChanged => _$this._queryChanged;
  set queryChanged(bool queryChanged) => _$this._queryChanged = queryChanged;

  FoodSearchLoadedBuilder();

  FoodSearchLoadedBuilder get _$this {
    if (_$v != null) {
      _results = _$v.results?.toBuilder();
      _loading = _$v.loading;
      _query = _$v.query;
      _queryChanged = _$v.queryChanged;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FoodSearchLoaded other) {
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
      _$result = _$v ??
          new _$FoodSearchLoaded._(
              results: _results?.build(),
              loading: loading,
              query: query,
              queryChanged: queryChanged);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        _results?.build();
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
