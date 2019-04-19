// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RemoteDiaryDayArrived extends RemoteDiaryDayArrived {
  @override
  final ValueObservable<FoodDiaryDay> diaryDayStream;

  factory _$RemoteDiaryDayArrived(
          [void updates(RemoteDiaryDayArrivedBuilder b)]) =>
      (new RemoteDiaryDayArrivedBuilder()..update(updates)).build();

  _$RemoteDiaryDayArrived._({this.diaryDayStream}) : super._() {
    if (diaryDayStream == null) {
      throw new BuiltValueNullFieldError(
          'RemoteDiaryDayArrived', 'diaryDayStream');
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
    return other is RemoteDiaryDayArrived &&
        diaryDayStream == other.diaryDayStream;
  }

  @override
  int get hashCode {
    return $jf($jc(0, diaryDayStream.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteDiaryDayArrived')
          ..add('diaryDayStream', diaryDayStream))
        .toString();
  }
}

class RemoteDiaryDayArrivedBuilder
    implements Builder<RemoteDiaryDayArrived, RemoteDiaryDayArrivedBuilder> {
  _$RemoteDiaryDayArrived _$v;

  ValueObservable<FoodDiaryDay> _diaryDayStream;
  ValueObservable<FoodDiaryDay> get diaryDayStream => _$this._diaryDayStream;
  set diaryDayStream(ValueObservable<FoodDiaryDay> diaryDayStream) =>
      _$this._diaryDayStream = diaryDayStream;

  RemoteDiaryDayArrivedBuilder();

  RemoteDiaryDayArrivedBuilder get _$this {
    if (_$v != null) {
      _diaryDayStream = _$v.diaryDayStream;
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
    final _$result =
        _$v ?? new _$RemoteDiaryDayArrived._(diaryDayStream: diaryDayStream);
    replace(_$result);
    return _$result;
  }
}

class _$SaveFoodDiaryDay extends SaveFoodDiaryDay {
  @override
  final FoodDiaryDay diaryDay;

  factory _$SaveFoodDiaryDay([void updates(SaveFoodDiaryDayBuilder b)]) =>
      (new SaveFoodDiaryDayBuilder()..update(updates)).build();

  _$SaveFoodDiaryDay._({this.diaryDay}) : super._() {
    if (diaryDay == null) {
      throw new BuiltValueNullFieldError('SaveFoodDiaryDay', 'diaryDay');
    }
  }

  @override
  SaveFoodDiaryDay rebuild(void updates(SaveFoodDiaryDayBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SaveFoodDiaryDayBuilder toBuilder() =>
      new SaveFoodDiaryDayBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SaveFoodDiaryDay && diaryDay == other.diaryDay;
  }

  @override
  int get hashCode {
    return $jf($jc(0, diaryDay.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SaveFoodDiaryDay')
          ..add('diaryDay', diaryDay))
        .toString();
  }
}

class SaveFoodDiaryDayBuilder
    implements Builder<SaveFoodDiaryDay, SaveFoodDiaryDayBuilder> {
  _$SaveFoodDiaryDay _$v;

  FoodDiaryDayBuilder _diaryDay;
  FoodDiaryDayBuilder get diaryDay =>
      _$this._diaryDay ??= new FoodDiaryDayBuilder();
  set diaryDay(FoodDiaryDayBuilder diaryDay) => _$this._diaryDay = diaryDay;

  SaveFoodDiaryDayBuilder();

  SaveFoodDiaryDayBuilder get _$this {
    if (_$v != null) {
      _diaryDay = _$v.diaryDay?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SaveFoodDiaryDay other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SaveFoodDiaryDay;
  }

  @override
  void update(void updates(SaveFoodDiaryDayBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SaveFoodDiaryDay build() {
    _$SaveFoodDiaryDay _$result;
    try {
      _$result = _$v ?? new _$SaveFoodDiaryDay._(diaryDay: diaryDay.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'diaryDay';
        diaryDay.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SaveFoodDiaryDay', _$failedField, e.toString());
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
