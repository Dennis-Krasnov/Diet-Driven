// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_logging_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FoodLoggingSingleSelect extends FoodLoggingSingleSelect {
  @override
  final FoodRecord selectedFoodRecord;
  @override
  final int meal;
  @override
  final BuiltList<FoodRecord> recentResults;
  @override
  final BuiltList<FoodRecord> popularResults;
  @override
  final BuiltList<FoodRecord> favoriteResults;

  factory _$FoodLoggingSingleSelect(
          [void Function(FoodLoggingSingleSelectBuilder) updates]) =>
      (new FoodLoggingSingleSelectBuilder()..update(updates)).build();

  _$FoodLoggingSingleSelect._(
      {this.selectedFoodRecord,
      this.meal,
      this.recentResults,
      this.popularResults,
      this.favoriteResults})
      : super._() {
    if (meal == null) {
      throw new BuiltValueNullFieldError('FoodLoggingSingleSelect', 'meal');
    }
  }

  @override
  FoodLoggingSingleSelect rebuild(
          void Function(FoodLoggingSingleSelectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodLoggingSingleSelectBuilder toBuilder() =>
      new FoodLoggingSingleSelectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodLoggingSingleSelect &&
        selectedFoodRecord == other.selectedFoodRecord &&
        meal == other.meal &&
        recentResults == other.recentResults &&
        popularResults == other.popularResults &&
        favoriteResults == other.favoriteResults;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, selectedFoodRecord.hashCode), meal.hashCode),
                recentResults.hashCode),
            popularResults.hashCode),
        favoriteResults.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodLoggingSingleSelect')
          ..add('selectedFoodRecord', selectedFoodRecord)
          ..add('meal', meal)
          ..add('recentResults', recentResults)
          ..add('popularResults', popularResults)
          ..add('favoriteResults', favoriteResults))
        .toString();
  }
}

class FoodLoggingSingleSelectBuilder
    implements
        Builder<FoodLoggingSingleSelect, FoodLoggingSingleSelectBuilder> {
  _$FoodLoggingSingleSelect _$v;

  FoodRecordBuilder _selectedFoodRecord;
  FoodRecordBuilder get selectedFoodRecord =>
      _$this._selectedFoodRecord ??= new FoodRecordBuilder();
  set selectedFoodRecord(FoodRecordBuilder selectedFoodRecord) =>
      _$this._selectedFoodRecord = selectedFoodRecord;

  int _meal;
  int get meal => _$this._meal;
  set meal(int meal) => _$this._meal = meal;

  ListBuilder<FoodRecord> _recentResults;
  ListBuilder<FoodRecord> get recentResults =>
      _$this._recentResults ??= new ListBuilder<FoodRecord>();
  set recentResults(ListBuilder<FoodRecord> recentResults) =>
      _$this._recentResults = recentResults;

  ListBuilder<FoodRecord> _popularResults;
  ListBuilder<FoodRecord> get popularResults =>
      _$this._popularResults ??= new ListBuilder<FoodRecord>();
  set popularResults(ListBuilder<FoodRecord> popularResults) =>
      _$this._popularResults = popularResults;

  ListBuilder<FoodRecord> _favoriteResults;
  ListBuilder<FoodRecord> get favoriteResults =>
      _$this._favoriteResults ??= new ListBuilder<FoodRecord>();
  set favoriteResults(ListBuilder<FoodRecord> favoriteResults) =>
      _$this._favoriteResults = favoriteResults;

  FoodLoggingSingleSelectBuilder();

  FoodLoggingSingleSelectBuilder get _$this {
    if (_$v != null) {
      _selectedFoodRecord = _$v.selectedFoodRecord?.toBuilder();
      _meal = _$v.meal;
      _recentResults = _$v.recentResults?.toBuilder();
      _popularResults = _$v.popularResults?.toBuilder();
      _favoriteResults = _$v.favoriteResults?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodLoggingSingleSelect other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodLoggingSingleSelect;
  }

  @override
  void update(void Function(FoodLoggingSingleSelectBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodLoggingSingleSelect build() {
    _$FoodLoggingSingleSelect _$result;
    try {
      _$result = _$v ??
          new _$FoodLoggingSingleSelect._(
              selectedFoodRecord: _selectedFoodRecord?.build(),
              meal: meal,
              recentResults: _recentResults?.build(),
              popularResults: _popularResults?.build(),
              favoriteResults: _favoriteResults?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'selectedFoodRecord';
        _selectedFoodRecord?.build();

        _$failedField = 'recentResults';
        _recentResults?.build();
        _$failedField = 'popularResults';
        _popularResults?.build();
        _$failedField = 'favoriteResults';
        _favoriteResults?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FoodLoggingSingleSelect', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FoodLoggingMultiSelect extends FoodLoggingMultiSelect {
  @override
  final BuiltList<FoodRecord> selectedFoodRecords;
  @override
  final int meal;
  @override
  final BuiltList<FoodRecord> recentResults;
  @override
  final BuiltList<FoodRecord> popularResults;
  @override
  final BuiltList<FoodRecord> favoriteResults;

  factory _$FoodLoggingMultiSelect(
          [void Function(FoodLoggingMultiSelectBuilder) updates]) =>
      (new FoodLoggingMultiSelectBuilder()..update(updates)).build();

  _$FoodLoggingMultiSelect._(
      {this.selectedFoodRecords,
      this.meal,
      this.recentResults,
      this.popularResults,
      this.favoriteResults})
      : super._() {
    if (selectedFoodRecords == null) {
      throw new BuiltValueNullFieldError(
          'FoodLoggingMultiSelect', 'selectedFoodRecords');
    }
    if (meal == null) {
      throw new BuiltValueNullFieldError('FoodLoggingMultiSelect', 'meal');
    }
  }

  @override
  FoodLoggingMultiSelect rebuild(
          void Function(FoodLoggingMultiSelectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodLoggingMultiSelectBuilder toBuilder() =>
      new FoodLoggingMultiSelectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodLoggingMultiSelect &&
        selectedFoodRecords == other.selectedFoodRecords &&
        meal == other.meal &&
        recentResults == other.recentResults &&
        popularResults == other.popularResults &&
        favoriteResults == other.favoriteResults;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, selectedFoodRecords.hashCode), meal.hashCode),
                recentResults.hashCode),
            popularResults.hashCode),
        favoriteResults.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodLoggingMultiSelect')
          ..add('selectedFoodRecords', selectedFoodRecords)
          ..add('meal', meal)
          ..add('recentResults', recentResults)
          ..add('popularResults', popularResults)
          ..add('favoriteResults', favoriteResults))
        .toString();
  }
}

class FoodLoggingMultiSelectBuilder
    implements Builder<FoodLoggingMultiSelect, FoodLoggingMultiSelectBuilder> {
  _$FoodLoggingMultiSelect _$v;

  ListBuilder<FoodRecord> _selectedFoodRecords;
  ListBuilder<FoodRecord> get selectedFoodRecords =>
      _$this._selectedFoodRecords ??= new ListBuilder<FoodRecord>();
  set selectedFoodRecords(ListBuilder<FoodRecord> selectedFoodRecords) =>
      _$this._selectedFoodRecords = selectedFoodRecords;

  int _meal;
  int get meal => _$this._meal;
  set meal(int meal) => _$this._meal = meal;

  ListBuilder<FoodRecord> _recentResults;
  ListBuilder<FoodRecord> get recentResults =>
      _$this._recentResults ??= new ListBuilder<FoodRecord>();
  set recentResults(ListBuilder<FoodRecord> recentResults) =>
      _$this._recentResults = recentResults;

  ListBuilder<FoodRecord> _popularResults;
  ListBuilder<FoodRecord> get popularResults =>
      _$this._popularResults ??= new ListBuilder<FoodRecord>();
  set popularResults(ListBuilder<FoodRecord> popularResults) =>
      _$this._popularResults = popularResults;

  ListBuilder<FoodRecord> _favoriteResults;
  ListBuilder<FoodRecord> get favoriteResults =>
      _$this._favoriteResults ??= new ListBuilder<FoodRecord>();
  set favoriteResults(ListBuilder<FoodRecord> favoriteResults) =>
      _$this._favoriteResults = favoriteResults;

  FoodLoggingMultiSelectBuilder();

  FoodLoggingMultiSelectBuilder get _$this {
    if (_$v != null) {
      _selectedFoodRecords = _$v.selectedFoodRecords?.toBuilder();
      _meal = _$v.meal;
      _recentResults = _$v.recentResults?.toBuilder();
      _popularResults = _$v.popularResults?.toBuilder();
      _favoriteResults = _$v.favoriteResults?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodLoggingMultiSelect other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodLoggingMultiSelect;
  }

  @override
  void update(void Function(FoodLoggingMultiSelectBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodLoggingMultiSelect build() {
    _$FoodLoggingMultiSelect _$result;
    try {
      _$result = _$v ??
          new _$FoodLoggingMultiSelect._(
              selectedFoodRecords: selectedFoodRecords.build(),
              meal: meal,
              recentResults: _recentResults?.build(),
              popularResults: _popularResults?.build(),
              favoriteResults: _favoriteResults?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'selectedFoodRecords';
        selectedFoodRecords.build();

        _$failedField = 'recentResults';
        _recentResults?.build();
        _$failedField = 'popularResults';
        _popularResults?.build();
        _$failedField = 'favoriteResults';
        _favoriteResults?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FoodLoggingMultiSelect', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
