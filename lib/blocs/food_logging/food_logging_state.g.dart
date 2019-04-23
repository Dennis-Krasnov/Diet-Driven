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

  factory _$FoodLoggingSingleSelect(
          [void updates(FoodLoggingSingleSelectBuilder b)]) =>
      (new FoodLoggingSingleSelectBuilder()..update(updates)).build();

  _$FoodLoggingSingleSelect._({this.selectedFoodRecord, this.meal})
      : super._() {
    if (meal == null) {
      throw new BuiltValueNullFieldError('FoodLoggingSingleSelect', 'meal');
    }
  }

  @override
  FoodLoggingSingleSelect rebuild(
          void updates(FoodLoggingSingleSelectBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodLoggingSingleSelectBuilder toBuilder() =>
      new FoodLoggingSingleSelectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodLoggingSingleSelect &&
        selectedFoodRecord == other.selectedFoodRecord &&
        meal == other.meal;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, selectedFoodRecord.hashCode), meal.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodLoggingSingleSelect')
          ..add('selectedFoodRecord', selectedFoodRecord)
          ..add('meal', meal))
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

  FoodLoggingSingleSelectBuilder();

  FoodLoggingSingleSelectBuilder get _$this {
    if (_$v != null) {
      _selectedFoodRecord = _$v.selectedFoodRecord?.toBuilder();
      _meal = _$v.meal;
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
  void update(void updates(FoodLoggingSingleSelectBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodLoggingSingleSelect build() {
    _$FoodLoggingSingleSelect _$result;
    try {
      _$result = _$v ??
          new _$FoodLoggingSingleSelect._(
              selectedFoodRecord: _selectedFoodRecord?.build(), meal: meal);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'selectedFoodRecord';
        _selectedFoodRecord?.build();
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

  factory _$FoodLoggingMultiSelect(
          [void updates(FoodLoggingMultiSelectBuilder b)]) =>
      (new FoodLoggingMultiSelectBuilder()..update(updates)).build();

  _$FoodLoggingMultiSelect._({this.selectedFoodRecords, this.meal})
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
          void updates(FoodLoggingMultiSelectBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodLoggingMultiSelectBuilder toBuilder() =>
      new FoodLoggingMultiSelectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodLoggingMultiSelect &&
        selectedFoodRecords == other.selectedFoodRecords &&
        meal == other.meal;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, selectedFoodRecords.hashCode), meal.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodLoggingMultiSelect')
          ..add('selectedFoodRecords', selectedFoodRecords)
          ..add('meal', meal))
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

  FoodLoggingMultiSelectBuilder();

  FoodLoggingMultiSelectBuilder get _$this {
    if (_$v != null) {
      _selectedFoodRecords = _$v.selectedFoodRecords?.toBuilder();
      _meal = _$v.meal;
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
  void update(void updates(FoodLoggingMultiSelectBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodLoggingMultiSelect build() {
    _$FoodLoggingMultiSelect _$result;
    try {
      _$result = _$v ??
          new _$FoodLoggingMultiSelect._(
              selectedFoodRecords: selectedFoodRecords.build(), meal: meal);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'selectedFoodRecords';
        selectedFoodRecords.build();
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
