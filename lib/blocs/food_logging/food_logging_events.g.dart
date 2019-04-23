// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_logging_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddToSelection extends AddToSelection {
  @override
  final FoodRecord foodRecord;

  factory _$AddToSelection([void updates(AddToSelectionBuilder b)]) =>
      (new AddToSelectionBuilder()..update(updates)).build();

  _$AddToSelection._({this.foodRecord}) : super._() {
    if (foodRecord == null) {
      throw new BuiltValueNullFieldError('AddToSelection', 'foodRecord');
    }
  }

  @override
  AddToSelection rebuild(void updates(AddToSelectionBuilder b)) =>
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
  void update(void updates(AddToSelectionBuilder b)) {
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

  factory _$RemoveFromSelection([void updates(RemoveFromSelectionBuilder b)]) =>
      (new RemoveFromSelectionBuilder()..update(updates)).build();

  _$RemoveFromSelection._({this.foodRecord}) : super._() {
    if (foodRecord == null) {
      throw new BuiltValueNullFieldError('RemoveFromSelection', 'foodRecord');
    }
  }

  @override
  RemoveFromSelection rebuild(void updates(RemoveFromSelectionBuilder b)) =>
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
  void update(void updates(RemoveFromSelectionBuilder b)) {
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

class _$SaveSelection extends SaveSelection {
  factory _$SaveSelection([void updates(SaveSelectionBuilder b)]) =>
      (new SaveSelectionBuilder()..update(updates)).build();

  _$SaveSelection._() : super._();

  @override
  SaveSelection rebuild(void updates(SaveSelectionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SaveSelectionBuilder toBuilder() => new SaveSelectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SaveSelection;
  }

  @override
  int get hashCode {
    return 293200859;
  }
}

class SaveSelectionBuilder
    implements Builder<SaveSelection, SaveSelectionBuilder> {
  _$SaveSelection _$v;

  SaveSelectionBuilder();

  @override
  void replace(SaveSelection other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SaveSelection;
  }

  @override
  void update(void updates(SaveSelectionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SaveSelection build() {
    final _$result = _$v ?? new _$SaveSelection._();
    replace(_$result);
    return _$result;
  }
}

class _$StartMultiSelect extends StartMultiSelect {
  factory _$StartMultiSelect([void updates(StartMultiSelectBuilder b)]) =>
      (new StartMultiSelectBuilder()..update(updates)).build();

  _$StartMultiSelect._() : super._();

  @override
  StartMultiSelect rebuild(void updates(StartMultiSelectBuilder b)) =>
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
  void update(void updates(StartMultiSelectBuilder b)) {
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
  factory _$CancelMultiSelect([void updates(CancelMultiSelectBuilder b)]) =>
      (new CancelMultiSelectBuilder()..update(updates)).build();

  _$CancelMultiSelect._() : super._();

  @override
  CancelMultiSelect rebuild(void updates(CancelMultiSelectBuilder b)) =>
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
  void update(void updates(CancelMultiSelectBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CancelMultiSelect build() {
    final _$result = _$v ?? new _$CancelMultiSelect._();
    replace(_$result);
    return _$result;
  }
}

class _$ChangeMeal extends ChangeMeal {
  @override
  final int meal;

  factory _$ChangeMeal([void updates(ChangeMealBuilder b)]) =>
      (new ChangeMealBuilder()..update(updates)).build();

  _$ChangeMeal._({this.meal}) : super._() {
    if (meal == null) {
      throw new BuiltValueNullFieldError('ChangeMeal', 'meal');
    }
  }

  @override
  ChangeMeal rebuild(void updates(ChangeMealBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeMealBuilder toBuilder() => new ChangeMealBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeMeal && meal == other.meal;
  }

  @override
  int get hashCode {
    return $jf($jc(0, meal.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChangeMeal')..add('meal', meal))
        .toString();
  }
}

class ChangeMealBuilder implements Builder<ChangeMeal, ChangeMealBuilder> {
  _$ChangeMeal _$v;

  int _meal;
  int get meal => _$this._meal;
  set meal(int meal) => _$this._meal = meal;

  ChangeMealBuilder();

  ChangeMealBuilder get _$this {
    if (_$v != null) {
      _meal = _$v.meal;
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
  void update(void updates(ChangeMealBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ChangeMeal build() {
    final _$result = _$v ?? new _$ChangeMeal._(meal: meal);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new