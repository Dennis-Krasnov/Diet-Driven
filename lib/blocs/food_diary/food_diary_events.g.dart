// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoadFoodRecords extends LoadFoodRecords {
  factory _$LoadFoodRecords([void updates(LoadFoodRecordsBuilder b)]) =>
      (new LoadFoodRecordsBuilder()..update(updates)).build();

  _$LoadFoodRecords._() : super._();

  @override
  LoadFoodRecords rebuild(void updates(LoadFoodRecordsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LoadFoodRecordsBuilder toBuilder() =>
      new LoadFoodRecordsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoadFoodRecords;
  }

  @override
  int get hashCode {
    return 743544230;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('LoadFoodRecords').toString();
  }
}

class LoadFoodRecordsBuilder
    implements Builder<LoadFoodRecords, LoadFoodRecordsBuilder> {
  _$LoadFoodRecords _$v;

  LoadFoodRecordsBuilder();

  @override
  void replace(LoadFoodRecords other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoadFoodRecords;
  }

  @override
  void update(void updates(LoadFoodRecordsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LoadFoodRecords build() {
    final _$result = _$v ?? new _$LoadFoodRecords._();
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
