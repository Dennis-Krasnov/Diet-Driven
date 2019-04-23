// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RemoteDiaryDayArrived extends RemoteDiaryDayArrived {
  @override
  final FoodDiaryDay foodDiaryDay;

  factory _$RemoteDiaryDayArrived(
          [void updates(RemoteDiaryDayArrivedBuilder b)]) =>
      (new RemoteDiaryDayArrivedBuilder()..update(updates)).build();

  _$RemoteDiaryDayArrived._({this.foodDiaryDay}) : super._() {
    if (foodDiaryDay == null) {
      throw new BuiltValueNullFieldError(
          'RemoteDiaryDayArrived', 'foodDiaryDay');
    }
  }

  @override
  RemoteDiaryDayArrived rebuild(void updates(RemoteDiaryDayArrivedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoteDiaryDayArrivedBuilder toBuilder() =>
      new RemoteDiaryDayArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteDiaryDayArrived && foodDiaryDay == other.foodDiaryDay;
  }

  @override
  int get hashCode {
    return $jf($jc(0, foodDiaryDay.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteDiaryDayArrived')
          ..add('foodDiaryDay', foodDiaryDay))
        .toString();
  }
}

class RemoteDiaryDayArrivedBuilder
    implements Builder<RemoteDiaryDayArrived, RemoteDiaryDayArrivedBuilder> {
  _$RemoteDiaryDayArrived _$v;

  FoodDiaryDayBuilder _foodDiaryDay;
  FoodDiaryDayBuilder get foodDiaryDay =>
      _$this._foodDiaryDay ??= new FoodDiaryDayBuilder();
  set foodDiaryDay(FoodDiaryDayBuilder foodDiaryDay) =>
      _$this._foodDiaryDay = foodDiaryDay;

  RemoteDiaryDayArrivedBuilder();

  RemoteDiaryDayArrivedBuilder get _$this {
    if (_$v != null) {
      _foodDiaryDay = _$v.foodDiaryDay?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoteDiaryDayArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoteDiaryDayArrived;
  }

  @override
  void update(void updates(RemoteDiaryDayArrivedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoteDiaryDayArrived build() {
    _$RemoteDiaryDayArrived _$result;
    try {
      _$result = _$v ??
          new _$RemoteDiaryDayArrived._(foodDiaryDay: foodDiaryDay.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodDiaryDay';
        foodDiaryDay.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RemoteDiaryDayArrived', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$AddFoodRecord extends AddFoodRecord {
  @override
  final FoodRecord foodRecord;

  factory _$AddFoodRecord([void updates(AddFoodRecordBuilder b)]) =>
      (new AddFoodRecordBuilder()..update(updates)).build();

  _$AddFoodRecord._({this.foodRecord}) : super._() {
    if (foodRecord == null) {
      throw new BuiltValueNullFieldError('AddFoodRecord', 'foodRecord');
    }
  }

  @override
  AddFoodRecord rebuild(void updates(AddFoodRecordBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AddFoodRecordBuilder toBuilder() => new AddFoodRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddFoodRecord && foodRecord == other.foodRecord;
  }

  @override
  int get hashCode {
    return $jf($jc(0, foodRecord.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddFoodRecord')
          ..add('foodRecord', foodRecord))
        .toString();
  }
}

class AddFoodRecordBuilder
    implements Builder<AddFoodRecord, AddFoodRecordBuilder> {
  _$AddFoodRecord _$v;

  FoodRecordBuilder _foodRecord;
  FoodRecordBuilder get foodRecord =>
      _$this._foodRecord ??= new FoodRecordBuilder();
  set foodRecord(FoodRecordBuilder foodRecord) =>
      _$this._foodRecord = foodRecord;

  AddFoodRecordBuilder();

  AddFoodRecordBuilder get _$this {
    if (_$v != null) {
      _foodRecord = _$v.foodRecord?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddFoodRecord other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AddFoodRecord;
  }

  @override
  void update(void updates(AddFoodRecordBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AddFoodRecord build() {
    _$AddFoodRecord _$result;
    try {
      _$result = _$v ?? new _$AddFoodRecord._(foodRecord: foodRecord.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodRecord';
        foodRecord.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AddFoodRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DeleteFoodRecord extends DeleteFoodRecord {
  @override
  final FoodRecord foodRecord;

  factory _$DeleteFoodRecord([void updates(DeleteFoodRecordBuilder b)]) =>
      (new DeleteFoodRecordBuilder()..update(updates)).build();

  _$DeleteFoodRecord._({this.foodRecord}) : super._() {
    if (foodRecord == null) {
      throw new BuiltValueNullFieldError('DeleteFoodRecord', 'foodRecord');
    }
  }

  @override
  DeleteFoodRecord rebuild(void updates(DeleteFoodRecordBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteFoodRecordBuilder toBuilder() =>
      new DeleteFoodRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteFoodRecord && foodRecord == other.foodRecord;
  }

  @override
  int get hashCode {
    return $jf($jc(0, foodRecord.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeleteFoodRecord')
          ..add('foodRecord', foodRecord))
        .toString();
  }
}

class DeleteFoodRecordBuilder
    implements Builder<DeleteFoodRecord, DeleteFoodRecordBuilder> {
  _$DeleteFoodRecord _$v;

  FoodRecordBuilder _foodRecord;
  FoodRecordBuilder get foodRecord =>
      _$this._foodRecord ??= new FoodRecordBuilder();
  set foodRecord(FoodRecordBuilder foodRecord) =>
      _$this._foodRecord = foodRecord;

  DeleteFoodRecordBuilder();

  DeleteFoodRecordBuilder get _$this {
    if (_$v != null) {
      _foodRecord = _$v.foodRecord?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteFoodRecord other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DeleteFoodRecord;
  }

  @override
  void update(void updates(DeleteFoodRecordBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DeleteFoodRecord build() {
    _$DeleteFoodRecord _$result;
    try {
      _$result =
          _$v ?? new _$DeleteFoodRecord._(foodRecord: foodRecord.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodRecord';
        foodRecord.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DeleteFoodRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$EditFoodRecord extends EditFoodRecord {
  @override
  final FoodRecord oldRecord;
  @override
  final FoodRecord newRecord;

  factory _$EditFoodRecord([void updates(EditFoodRecordBuilder b)]) =>
      (new EditFoodRecordBuilder()..update(updates)).build();

  _$EditFoodRecord._({this.oldRecord, this.newRecord}) : super._() {
    if (oldRecord == null) {
      throw new BuiltValueNullFieldError('EditFoodRecord', 'oldRecord');
    }
    if (newRecord == null) {
      throw new BuiltValueNullFieldError('EditFoodRecord', 'newRecord');
    }
  }

  @override
  EditFoodRecord rebuild(void updates(EditFoodRecordBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EditFoodRecordBuilder toBuilder() =>
      new EditFoodRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EditFoodRecord &&
        oldRecord == other.oldRecord &&
        newRecord == other.newRecord;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, oldRecord.hashCode), newRecord.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EditFoodRecord')
          ..add('oldRecord', oldRecord)
          ..add('newRecord', newRecord))
        .toString();
  }
}

class EditFoodRecordBuilder
    implements Builder<EditFoodRecord, EditFoodRecordBuilder> {
  _$EditFoodRecord _$v;

  FoodRecordBuilder _oldRecord;
  FoodRecordBuilder get oldRecord =>
      _$this._oldRecord ??= new FoodRecordBuilder();
  set oldRecord(FoodRecordBuilder oldRecord) => _$this._oldRecord = oldRecord;

  FoodRecordBuilder _newRecord;
  FoodRecordBuilder get newRecord =>
      _$this._newRecord ??= new FoodRecordBuilder();
  set newRecord(FoodRecordBuilder newRecord) => _$this._newRecord = newRecord;

  EditFoodRecordBuilder();

  EditFoodRecordBuilder get _$this {
    if (_$v != null) {
      _oldRecord = _$v.oldRecord?.toBuilder();
      _newRecord = _$v.newRecord?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EditFoodRecord other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EditFoodRecord;
  }

  @override
  void update(void updates(EditFoodRecordBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EditFoodRecord build() {
    _$EditFoodRecord _$result;
    try {
      _$result = _$v ??
          new _$EditFoodRecord._(
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
            'EditFoodRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FoodDiaryError extends FoodDiaryError {
  @override
  final String error;

  factory _$FoodDiaryError([void updates(FoodDiaryErrorBuilder b)]) =>
      (new FoodDiaryErrorBuilder()..update(updates)).build();

  _$FoodDiaryError._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('FoodDiaryError', 'error');
    }
  }

  @override
  FoodDiaryError rebuild(void updates(FoodDiaryErrorBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDiaryErrorBuilder toBuilder() =>
      new FoodDiaryErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryError && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryError')..add('error', error))
        .toString();
  }
}

class FoodDiaryErrorBuilder
    implements Builder<FoodDiaryError, FoodDiaryErrorBuilder> {
  _$FoodDiaryError _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  FoodDiaryErrorBuilder();

  FoodDiaryErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodDiaryError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodDiaryError;
  }

  @override
  void update(void updates(FoodDiaryErrorBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryError build() {
    final _$result = _$v ?? new _$FoodDiaryError._(error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
