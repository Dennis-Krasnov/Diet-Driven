// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_search_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SuggestFoodRecords extends SuggestFoodRecords {
  factory _$SuggestFoodRecords(
          [void Function(SuggestFoodRecordsBuilder) updates]) =>
      (new SuggestFoodRecordsBuilder()..update(updates)).build();

  _$SuggestFoodRecords._() : super._();

  @override
  SuggestFoodRecords rebuild(
          void Function(SuggestFoodRecordsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SuggestFoodRecordsBuilder toBuilder() =>
      new SuggestFoodRecordsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SuggestFoodRecords;
  }

  @override
  int get hashCode {
    return 930010248;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SuggestFoodRecords').toString();
  }
}

class SuggestFoodRecordsBuilder
    implements Builder<SuggestFoodRecords, SuggestFoodRecordsBuilder> {
  _$SuggestFoodRecords _$v;

  SuggestFoodRecordsBuilder();

  @override
  void replace(SuggestFoodRecords other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SuggestFoodRecords;
  }

  @override
  void update(void Function(SuggestFoodRecordsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SuggestFoodRecords build() {
    final _$result = _$v ?? new _$SuggestFoodRecords._();
    replace(_$result);
    return _$result;
  }
}

class _$UpdateQuery extends UpdateQuery {
  @override
  final String query;

  factory _$UpdateQuery([void Function(UpdateQueryBuilder) updates]) =>
      (new UpdateQueryBuilder()..update(updates)).build();

  _$UpdateQuery._({this.query}) : super._() {
    if (query == null) {
      throw new BuiltValueNullFieldError('UpdateQuery', 'query');
    }
  }

  @override
  UpdateQuery rebuild(void Function(UpdateQueryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateQueryBuilder toBuilder() => new UpdateQueryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateQuery && query == other.query;
  }

  @override
  int get hashCode {
    return $jf($jc(0, query.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UpdateQuery')..add('query', query))
        .toString();
  }
}

class UpdateQueryBuilder implements Builder<UpdateQuery, UpdateQueryBuilder> {
  _$UpdateQuery _$v;

  String _query;
  String get query => _$this._query;
  set query(String query) => _$this._query = query;

  UpdateQueryBuilder();

  UpdateQueryBuilder get _$this {
    if (_$v != null) {
      _query = _$v.query;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateQuery other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UpdateQuery;
  }

  @override
  void update(void Function(UpdateQueryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdateQuery build() {
    final _$result = _$v ?? new _$UpdateQuery._(query: query);
    replace(_$result);
    return _$result;
  }
}

class _$SearchFoods extends SearchFoods {
  factory _$SearchFoods([void Function(SearchFoodsBuilder) updates]) =>
      (new SearchFoodsBuilder()..update(updates)).build();

  _$SearchFoods._() : super._();

  @override
  SearchFoods rebuild(void Function(SearchFoodsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchFoodsBuilder toBuilder() => new SearchFoodsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchFoods;
  }

  @override
  int get hashCode {
    return 329577879;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SearchFoods').toString();
  }
}

class SearchFoodsBuilder implements Builder<SearchFoods, SearchFoodsBuilder> {
  _$SearchFoods _$v;

  SearchFoodsBuilder();

  @override
  void replace(SearchFoods other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchFoods;
  }

  @override
  void update(void Function(SearchFoodsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchFoods build() {
    final _$result = _$v ?? new _$SearchFoods._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
