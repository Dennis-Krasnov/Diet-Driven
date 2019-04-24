// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_logging_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FoodLoggingState extends FoodLoggingState {
  @override
  final int meal;
  @override
  final BuiltList<FoodRecord> selectedFoodRecords;
  @override
  final bool multiSelect;
  @override
  final BuiltList<FoodRecord> recentResults;
  @override
  final BuiltList<FoodRecord> popularResults;
  @override
  final BuiltList<FoodRecord> favoriteResults;

  factory _$FoodLoggingState(
          [void Function(FoodLoggingStateBuilder) updates]) =>
      (new FoodLoggingStateBuilder()..update(updates)).build();

  _$FoodLoggingState._(
      {this.meal,
      this.selectedFoodRecords,
      this.multiSelect,
      this.recentResults,
      this.popularResults,
      this.favoriteResults})
      : super._() {
    if (meal == null) {
      throw new BuiltValueNullFieldError('FoodLoggingState', 'meal');
    }
    if (selectedFoodRecords == null) {
      throw new BuiltValueNullFieldError(
          'FoodLoggingState', 'selectedFoodRecords');
    }
    if (multiSelect == null) {
      throw new BuiltValueNullFieldError('FoodLoggingState', 'multiSelect');
    }
  }

  @override
  FoodLoggingState rebuild(void Function(FoodLoggingStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodLoggingStateBuilder toBuilder() =>
      new FoodLoggingStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodLoggingState &&
        meal == other.meal &&
        selectedFoodRecords == other.selectedFoodRecords &&
        multiSelect == other.multiSelect &&
        recentResults == other.recentResults &&
        popularResults == other.popularResults &&
        favoriteResults == other.favoriteResults;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, meal.hashCode), selectedFoodRecords.hashCode),
                    multiSelect.hashCode),
                recentResults.hashCode),
            popularResults.hashCode),
        favoriteResults.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodLoggingState')
          ..add('meal', meal)
          ..add('selectedFoodRecords', selectedFoodRecords)
          ..add('multiSelect', multiSelect)
          ..add('recentResults', recentResults)
          ..add('popularResults', popularResults)
          ..add('favoriteResults', favoriteResults))
        .toString();
  }
}

class FoodLoggingStateBuilder
    implements Builder<FoodLoggingState, FoodLoggingStateBuilder> {
  _$FoodLoggingState _$v;

  int _meal;
  int get meal => _$this._meal;
  set meal(int meal) => _$this._meal = meal;

  ListBuilder<FoodRecord> _selectedFoodRecords;
  ListBuilder<FoodRecord> get selectedFoodRecords =>
      _$this._selectedFoodRecords ??= new ListBuilder<FoodRecord>();
  set selectedFoodRecords(ListBuilder<FoodRecord> selectedFoodRecords) =>
      _$this._selectedFoodRecords = selectedFoodRecords;

  bool _multiSelect;
  bool get multiSelect => _$this._multiSelect;
  set multiSelect(bool multiSelect) => _$this._multiSelect = multiSelect;

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

  FoodLoggingStateBuilder();

  FoodLoggingStateBuilder get _$this {
    if (_$v != null) {
      _meal = _$v.meal;
      _selectedFoodRecords = _$v.selectedFoodRecords?.toBuilder();
      _multiSelect = _$v.multiSelect;
      _recentResults = _$v.recentResults?.toBuilder();
      _popularResults = _$v.popularResults?.toBuilder();
      _favoriteResults = _$v.favoriteResults?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodLoggingState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodLoggingState;
  }

  @override
  void update(void Function(FoodLoggingStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodLoggingState build() {
    _$FoodLoggingState _$result;
    try {
      _$result = _$v ??
          new _$FoodLoggingState._(
              meal: meal,
              selectedFoodRecords: selectedFoodRecords.build(),
              multiSelect: multiSelect,
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
            'FoodLoggingState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
