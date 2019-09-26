// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchResult> _$searchResultSerializer =
    new _$SearchResultSerializer();

class _$SearchResultSerializer implements StructuredSerializer<SearchResult> {
  @override
  final Iterable<Type> types = const [SearchResult, _$SearchResult];
  @override
  final String wireName = 'SearchResult';

  @override
  Iterable<Object> serialize(Serializers serializers, SearchResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'foods',
      serializers.serialize(object.foods,
          specifiedType:
              const FullType(BuiltList, const [const FullType(FoodRecord)])),
      'pagination',
      serializers.serialize(object.pagination,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  SearchResult deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'foods':
          result.foods.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(FoodRecord)]))
              as BuiltList<dynamic>);
          break;
        case 'pagination':
          result.pagination = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$SearchResult extends SearchResult {
  @override
  final BuiltList<FoodRecord> foods;
  @override
  final int pagination;

  factory _$SearchResult([void Function(SearchResultBuilder) updates]) =>
      (new SearchResultBuilder()..update(updates)).build();

  _$SearchResult._({this.foods, this.pagination}) : super._() {
    if (foods == null) {
      throw new BuiltValueNullFieldError('SearchResult', 'foods');
    }
    if (pagination == null) {
      throw new BuiltValueNullFieldError('SearchResult', 'pagination');
    }
  }

  @override
  SearchResult rebuild(void Function(SearchResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchResultBuilder toBuilder() => new SearchResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchResult &&
        foods == other.foods &&
        pagination == other.pagination;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, foods.hashCode), pagination.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchResult')
          ..add('foods', foods)
          ..add('pagination', pagination))
        .toString();
  }
}

class SearchResultBuilder
    implements Builder<SearchResult, SearchResultBuilder> {
  _$SearchResult _$v;

  ListBuilder<FoodRecord> _foods;
  ListBuilder<FoodRecord> get foods =>
      _$this._foods ??= new ListBuilder<FoodRecord>();
  set foods(ListBuilder<FoodRecord> foods) => _$this._foods = foods;

  int _pagination;
  int get pagination => _$this._pagination;
  set pagination(int pagination) => _$this._pagination = pagination;

  SearchResultBuilder();

  SearchResultBuilder get _$this {
    if (_$v != null) {
      _foods = _$v.foods?.toBuilder();
      _pagination = _$v.pagination;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchResult;
  }

  @override
  void update(void Function(SearchResultBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchResult build() {
    _$SearchResult _$result;
    try {
      _$result = _$v ??
          new _$SearchResult._(foods: foods.build(), pagination: pagination);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foods';
        foods.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
