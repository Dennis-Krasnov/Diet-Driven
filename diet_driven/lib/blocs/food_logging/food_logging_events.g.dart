// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_logging_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChangeMeal extends ChangeMeal {
  @override
  final int mealIndex;

  factory _$ChangeMeal([void Function(ChangeMealBuilder) updates]) =>
      (new ChangeMealBuilder()..update(updates)).build();

  _$ChangeMeal._({this.mealIndex}) : super._() {
    if (mealIndex == null) {
      throw new BuiltValueNullFieldError('ChangeMeal', 'mealIndex');
    }
  }

  @override
  ChangeMeal rebuild(void Function(ChangeMealBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeMealBuilder toBuilder() => new ChangeMealBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeMeal && mealIndex == other.mealIndex;
  }

  @override
  int get hashCode {
    return $jf($jc(0, mealIndex.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChangeMeal')
          ..add('mealIndex', mealIndex))
        .toString();
  }
}

class ChangeMealBuilder implements Builder<ChangeMeal, ChangeMealBuilder> {
  _$ChangeMeal _$v;

  int _mealIndex;
  int get mealIndex => _$this._mealIndex;
  set mealIndex(int mealIndex) => _$this._mealIndex = mealIndex;

  ChangeMealBuilder();

  ChangeMealBuilder get _$this {
    if (_$v != null) {
      _mealIndex = _$v.mealIndex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeMeal other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChangeMeal;
  }

  @override
  void update(void Function(ChangeMealBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChangeMeal build() {
    final _$result = _$v ?? new _$ChangeMeal._(mealIndex: mealIndex);
    replace(_$result);
    return _$result;
  }
}

class _$AddToSelection extends AddToSelection {
  @override
  final FoodRecord foodRecord;

  factory _$AddToSelection([void Function(AddToSelectionBuilder) updates]) =>
      (new AddToSelectionBuilder()..update(updates)).build();

  _$AddToSelection._({this.foodRecord}) : super._() {
    if (foodRecord == null) {
      throw new BuiltValueNullFieldError('AddToSelection', 'foodRecord');
    }
  }

  @override
  AddToSelection rebuild(void Function(AddToSelectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddToSelectionBuilder toBuilder() =>
      new AddToSelectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddToSelection && foodRecord == other.foodRecord;
  }

  @override
  int get hashCode {
    return $jf($jc(0, foodRecord.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddToSelection')
          ..add('foodRecord', foodRecord))
        .toString();
  }
}

class AddToSelectionBuilder
    implements Builder<AddToSelection, AddToSelectionBuilder> {
  _$AddToSelection _$v;

  FoodRecordBuilder _foodRecord;
  FoodRecordBuilder get foodRecord =>
      _$this._foodRecord ??= new FoodRecordBuilder();
  set foodRecord(FoodRecordBuilder foodRecord) =>
      _$this._foodRecord = foodRecord;

  AddToSelectionBuilder();

  AddToSelectionBuilder get _$this {
    if (_$v != null) {
      _foodRecord = _$v.foodRecord?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddToSelection other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AddToSelection;
  }

  @override
  void update(void Function(AddToSelectionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AddToSelection build() {
    _$AddToSelection _$result;
    try {
      _$result = _$v ?? new _$AddToSelection._(foodRecord: foodRecord.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodRecord';
        foodRecord.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AddToSelection', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$RemoveFromSelection extends RemoveFromSelection {
  @override
  final FoodRecord foodRecord;

  factory _$RemoveFromSelection(
          [void Function(RemoveFromSelectionBuilder) updates]) =>
      (new RemoveFromSelectionBuilder()..update(updates)).build();

  _$RemoveFromSelection._({this.foodRecord}) : super._() {
    if (foodRecord == null) {
      throw new BuiltValueNullFieldError('RemoveFromSelection', 'foodRecord');
    }
  }

  @override
  RemoveFromSelection rebuild(
          void Function(RemoveFromSelectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoveFromSelectionBuilder toBuilder() =>
      new RemoveFromSelectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoveFromSelection && foodRecord == other.foodRecord;
  }

  @override
  int get hashCode {
    return $jf($jc(0, foodRecord.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoveFromSelection')
          ..add('foodRecord', foodRecord))
        .toString();
  }
}

class RemoveFromSelectionBuilder
    implements Builder<RemoveFromSelection, RemoveFromSelectionBuilder> {
  _$RemoveFromSelection _$v;

  FoodRecordBuilder _foodRecord;
  FoodRecordBuilder get foodRecord =>
      _$this._foodRecord ??= new FoodRecordBuilder();
  set foodRecord(FoodRecordBuilder foodRecord) =>
      _$this._foodRecord = foodRecord;

  RemoveFromSelectionBuilder();

  RemoveFromSelectionBuilder get _$this {
    if (_$v != null) {
      _foodRecord = _$v.foodRecord?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoveFromSelection other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoveFromSelection;
  }

  @override
  void update(void Function(RemoveFromSelectionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoveFromSelection build() {
    _$RemoveFromSelection _$result;
    try {
      _$result =
          _$v ?? new _$RemoveFromSelection._(foodRecord: foodRecord.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodRecord';
        foodRecord.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RemoveFromSelection', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ReplaceSelected extends ReplaceSelected {
  @override
  final FoodRecord oldRecord;
  @override
  final FoodRecord newRecord;

  factory _$ReplaceSelected([void Function(ReplaceSelectedBuilder) updates]) =>
      (new ReplaceSelectedBuilder()..update(updates)).build();

  _$ReplaceSelected._({this.oldRecord, this.newRecord}) : super._() {
    if (oldRecord == null) {
      throw new BuiltValueNullFieldError('ReplaceSelected', 'oldRecord');
    }
    if (newRecord == null) {
      throw new BuiltValueNullFieldError('ReplaceSelected', 'newRecord');
    }
  }

  @override
  ReplaceSelected rebuild(void Function(ReplaceSelectedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReplaceSelectedBuilder toBuilder() =>
      new ReplaceSelectedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReplaceSelected &&
        oldRecord == other.oldRecord &&
        newRecord == other.newRecord;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, oldRecord.hashCode), newRecord.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReplaceSelected')
          ..add('oldRecord', oldRecord)
          ..add('newRecord', newRecord))
        .toString();
  }
}

class ReplaceSelectedBuilder
    implements Builder<ReplaceSelected, ReplaceSelectedBuilder> {
  _$ReplaceSelected _$v;

  FoodRecordBuilder _oldRecord;
  FoodRecordBuilder get oldRecord =>
      _$this._oldRecord ??= new FoodRecordBuilder();
  set oldRecord(FoodRecordBuilder oldRecord) => _$this._oldRecord = oldRecord;

  FoodRecordBuilder _newRecord;
  FoodRecordBuilder get newRecord =>
      _$this._newRecord ??= new FoodRecordBuilder();
  set newRecord(FoodRecordBuilder newRecord) => _$this._newRecord = newRecord;

  ReplaceSelectedBuilder();

  ReplaceSelectedBuilder get _$this {
    if (_$v != null) {
      _oldRecord = _$v.oldRecord?.toBuilder();
      _newRecord = _$v.newRecord?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReplaceSelected other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ReplaceSelected;
  }

  @override
  void update(void Function(ReplaceSelectedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReplaceSelected build() {
    _$ReplaceSelected _$result;
    try {
      _$result = _$v ??
          new _$ReplaceSelected._(
              oldRecord: oldRecord.build(), newRecord: newRecord.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'oldRecord';
        oldRecord.build();
        _$failedField = 'newRecord';
        newRecord.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ReplaceSelected', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$StartMultiSelect extends StartMultiSelect {
  factory _$StartMultiSelect(
          [void Function(StartMultiSelectBuilder) updates]) =>
      (new StartMultiSelectBuilder()..update(updates)).build();

  _$StartMultiSelect._() : super._();

  @override
  StartMultiSelect rebuild(void Function(StartMultiSelectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StartMultiSelectBuilder toBuilder() =>
      new StartMultiSelectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StartMultiSelect;
  }

  @override
  int get hashCode {
    return 894813869;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('StartMultiSelect').toString();
  }
}

class StartMultiSelectBuilder
    implements Builder<StartMultiSelect, StartMultiSelectBuilder> {
  _$StartMultiSelect _$v;

  StartMultiSelectBuilder();

  @override
  void replace(StartMultiSelect other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StartMultiSelect;
  }

  @override
  void update(void Function(StartMultiSelectBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StartMultiSelect build() {
    final _$result = _$v ?? new _$StartMultiSelect._();
    replace(_$result);
    return _$result;
  }
}

class _$CancelMultiSelect extends CancelMultiSelect {
  factory _$CancelMultiSelect(
          [void Function(CancelMultiSelectBuilder) updates]) =>
      (new CancelMultiSelectBuilder()..update(updates)).build();

  _$CancelMultiSelect._() : super._();

  @override
  CancelMultiSelect rebuild(void Function(CancelMultiSelectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CancelMultiSelectBuilder toBuilder() =>
      new CancelMultiSelectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CancelMultiSelect;
  }

  @override
  int get hashCode {
    return 293815956;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('CancelMultiSelect').toString();
  }
}

class CancelMultiSelectBuilder
    implements Builder<CancelMultiSelect, CancelMultiSelectBuilder> {
  _$CancelMultiSelect _$v;

  CancelMultiSelectBuilder();

  @override
  void replace(CancelMultiSelect other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CancelMultiSelect;
  }

  @override
  void update(void Function(CancelMultiSelectBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CancelMultiSelect build() {
    final _$result = _$v ?? new _$CancelMultiSelect._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
