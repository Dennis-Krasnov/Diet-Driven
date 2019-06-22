// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_logging_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FoodLoggingState extends FoodLoggingState {
  @override
  final int mealIndex;
  @override
  final bool multiSelect;
  @override
  final BuiltSet<FoodRecord> selectedFoodRecords;
  @override
  final BuiltList<FoodRecord> diaryFoodRecords;

  factory _$FoodLoggingState(
          [void Function(FoodLoggingStateBuilder) updates]) =>
      (new FoodLoggingStateBuilder()..update(updates)).build();

  _$FoodLoggingState._(
      {this.mealIndex,
      this.multiSelect,
      this.selectedFoodRecords,
      this.diaryFoodRecords})
      : super._() {
    if (mealIndex == null) {
      throw new BuiltValueNullFieldError('FoodLoggingState', 'mealIndex');
    }
    if (multiSelect == null) {
      throw new BuiltValueNullFieldError('FoodLoggingState', 'multiSelect');
    }
    if (selectedFoodRecords == null) {
      throw new BuiltValueNullFieldError(
          'FoodLoggingState', 'selectedFoodRecords');
    }
    if (diaryFoodRecords == null) {
      throw new BuiltValueNullFieldError(
          'FoodLoggingState', 'diaryFoodRecords');
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
        mealIndex == other.mealIndex &&
        multiSelect == other.multiSelect &&
        selectedFoodRecords == other.selectedFoodRecords &&
        diaryFoodRecords == other.diaryFoodRecords;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, mealIndex.hashCode), multiSelect.hashCode),
            selectedFoodRecords.hashCode),
        diaryFoodRecords.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodLoggingState')
          ..add('mealIndex', mealIndex)
          ..add('multiSelect', multiSelect)
          ..add('selectedFoodRecords', selectedFoodRecords)
          ..add('diaryFoodRecords', diaryFoodRecords))
        .toString();
  }
}

class FoodLoggingStateBuilder
    implements Builder<FoodLoggingState, FoodLoggingStateBuilder> {
  _$FoodLoggingState _$v;

  int _mealIndex;
  int get mealIndex => _$this._mealIndex;
  set mealIndex(int mealIndex) => _$this._mealIndex = mealIndex;

  bool _multiSelect;
  bool get multiSelect => _$this._multiSelect;
  set multiSelect(bool multiSelect) => _$this._multiSelect = multiSelect;

  SetBuilder<FoodRecord> _selectedFoodRecords;
  SetBuilder<FoodRecord> get selectedFoodRecords =>
      _$this._selectedFoodRecords ??= new SetBuilder<FoodRecord>();
  set selectedFoodRecords(SetBuilder<FoodRecord> selectedFoodRecords) =>
      _$this._selectedFoodRecords = selectedFoodRecords;

  ListBuilder<FoodRecord> _diaryFoodRecords;
  ListBuilder<FoodRecord> get diaryFoodRecords =>
      _$this._diaryFoodRecords ??= new ListBuilder<FoodRecord>();
  set diaryFoodRecords(ListBuilder<FoodRecord> diaryFoodRecords) =>
      _$this._diaryFoodRecords = diaryFoodRecords;

  FoodLoggingStateBuilder();

  FoodLoggingStateBuilder get _$this {
    if (_$v != null) {
      _mealIndex = _$v.mealIndex;
      _multiSelect = _$v.multiSelect;
      _selectedFoodRecords = _$v.selectedFoodRecords?.toBuilder();
      _diaryFoodRecords = _$v.diaryFoodRecords?.toBuilder();
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
              mealIndex: mealIndex,
              multiSelect: multiSelect,
              selectedFoodRecords: selectedFoodRecords.build(),
              diaryFoodRecords: diaryFoodRecords.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'selectedFoodRecords';
        selectedFoodRecords.build();
        _$failedField = 'diaryFoodRecords';
        diaryFoodRecords.build();
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