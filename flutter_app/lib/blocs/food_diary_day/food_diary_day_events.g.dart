// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_day_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitFoodDiaryDay extends InitFoodDiaryDay {
  factory _$InitFoodDiaryDay(
          [void Function(InitFoodDiaryDayBuilder) updates]) =>
      (new InitFoodDiaryDayBuilder()..update(updates)).build();

  _$InitFoodDiaryDay._() : super._();

  @override
  InitFoodDiaryDay rebuild(void Function(InitFoodDiaryDayBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitFoodDiaryDayBuilder toBuilder() =>
      new InitFoodDiaryDayBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitFoodDiaryDay;
  }

  @override
  int get hashCode {
    return 412630403;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('InitFoodDiaryDay').toString();
  }
}

class InitFoodDiaryDayBuilder
    implements Builder<InitFoodDiaryDay, InitFoodDiaryDayBuilder> {
  _$InitFoodDiaryDay _$v;

  InitFoodDiaryDayBuilder();

  @override
  void replace(InitFoodDiaryDay other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitFoodDiaryDay;
  }

  @override
  void update(void Function(InitFoodDiaryDayBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitFoodDiaryDay build() {
    final _$result = _$v ?? new _$InitFoodDiaryDay._();
    replace(_$result);
    return _$result;
  }
}

class _$RemoteFoodDiaryDayArrived extends RemoteFoodDiaryDayArrived {
  @override
  final FoodDiaryDay foodDiaryDay;
  @override
  final Diet diet;

  factory _$RemoteFoodDiaryDayArrived(
          [void Function(RemoteFoodDiaryDayArrivedBuilder) updates]) =>
      (new RemoteFoodDiaryDayArrivedBuilder()..update(updates)).build();

  _$RemoteFoodDiaryDayArrived._({this.foodDiaryDay, this.diet}) : super._() {
    if (diet == null) {
      throw new BuiltValueNullFieldError('RemoteFoodDiaryDayArrived', 'diet');
    }
  }

  @override
  RemoteFoodDiaryDayArrived rebuild(
          void Function(RemoteFoodDiaryDayArrivedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoteFoodDiaryDayArrivedBuilder toBuilder() =>
      new RemoteFoodDiaryDayArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteFoodDiaryDayArrived &&
        foodDiaryDay == other.foodDiaryDay &&
        diet == other.diet;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, foodDiaryDay.hashCode), diet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteFoodDiaryDayArrived')
          ..add('foodDiaryDay', foodDiaryDay)
          ..add('diet', diet))
        .toString();
  }
}

class RemoteFoodDiaryDayArrivedBuilder
    implements
        Builder<RemoteFoodDiaryDayArrived, RemoteFoodDiaryDayArrivedBuilder> {
  _$RemoteFoodDiaryDayArrived _$v;

  FoodDiaryDayBuilder _foodDiaryDay;
  FoodDiaryDayBuilder get foodDiaryDay =>
      _$this._foodDiaryDay ??= new FoodDiaryDayBuilder();
  set foodDiaryDay(FoodDiaryDayBuilder foodDiaryDay) =>
      _$this._foodDiaryDay = foodDiaryDay;

  DietBuilder _diet;
  DietBuilder get diet => _$this._diet ??= new DietBuilder();
  set diet(DietBuilder diet) => _$this._diet = diet;

  RemoteFoodDiaryDayArrivedBuilder();

  RemoteFoodDiaryDayArrivedBuilder get _$this {
    if (_$v != null) {
      _foodDiaryDay = _$v.foodDiaryDay?.toBuilder();
      _diet = _$v.diet?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoteFoodDiaryDayArrived other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoteFoodDiaryDayArrived;
  }

  @override
  void update(void Function(RemoteFoodDiaryDayArrivedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoteFoodDiaryDayArrived build() {
    _$RemoteFoodDiaryDayArrived _$result;
    try {
      _$result = _$v ??
          new _$RemoteFoodDiaryDayArrived._(
              foodDiaryDay: _foodDiaryDay?.build(), diet: diet.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodDiaryDay';
        _foodDiaryDay?.build();
        _$failedField = 'diet';
        diet.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RemoteFoodDiaryDayArrived', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$AddFoodRecords extends AddFoodRecords {
  @override
  final int mealIndex;
  @override
  final BuiltList<FoodRecord> foodRecords;
  @override
  final Completer<void> completer;

  factory _$AddFoodRecords([void Function(AddFoodRecordsBuilder) updates]) =>
      (new AddFoodRecordsBuilder()..update(updates)).build();

  _$AddFoodRecords._({this.mealIndex, this.foodRecords, this.completer})
      : super._() {
    if (mealIndex == null) {
      throw new BuiltValueNullFieldError('AddFoodRecords', 'mealIndex');
    }
    if (foodRecords == null) {
      throw new BuiltValueNullFieldError('AddFoodRecords', 'foodRecords');
    }
  }

  @override
  AddFoodRecords rebuild(void Function(AddFoodRecordsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddFoodRecordsBuilder toBuilder() =>
      new AddFoodRecordsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddFoodRecords &&
        mealIndex == other.mealIndex &&
        foodRecords == other.foodRecords &&
        completer == other.completer;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, mealIndex.hashCode), foodRecords.hashCode),
        completer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddFoodRecords')
          ..add('mealIndex', mealIndex)
          ..add('foodRecords', foodRecords)
          ..add('completer', completer))
        .toString();
  }
}

class AddFoodRecordsBuilder
    implements Builder<AddFoodRecords, AddFoodRecordsBuilder> {
  _$AddFoodRecords _$v;

  int _mealIndex;
  int get mealIndex => _$this._mealIndex;
  set mealIndex(int mealIndex) => _$this._mealIndex = mealIndex;

  ListBuilder<FoodRecord> _foodRecords;
  ListBuilder<FoodRecord> get foodRecords =>
      _$this._foodRecords ??= new ListBuilder<FoodRecord>();
  set foodRecords(ListBuilder<FoodRecord> foodRecords) =>
      _$this._foodRecords = foodRecords;

  Completer<void> _completer;
  Completer<void> get completer => _$this._completer;
  set completer(Completer<void> completer) => _$this._completer = completer;

  AddFoodRecordsBuilder();

  AddFoodRecordsBuilder get _$this {
    if (_$v != null) {
      _mealIndex = _$v.mealIndex;
      _foodRecords = _$v.foodRecords?.toBuilder();
      _completer = _$v.completer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddFoodRecords other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AddFoodRecords;
  }

  @override
  void update(void Function(AddFoodRecordsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AddFoodRecords build() {
    _$AddFoodRecords _$result;
    try {
      _$result = _$v ??
          new _$AddFoodRecords._(
              mealIndex: mealIndex,
              foodRecords: foodRecords.build(),
              completer: completer);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodRecords';
        foodRecords.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AddFoodRecords', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ReplaceFoodRecord extends ReplaceFoodRecord {
  @override
  final FoodRecord oldRecord;
  @override
  final FoodRecord newRecord;
  @override
  final Completer<void> completer;

  factory _$ReplaceFoodRecord(
          [void Function(ReplaceFoodRecordBuilder) updates]) =>
      (new ReplaceFoodRecordBuilder()..update(updates)).build();

  _$ReplaceFoodRecord._({this.oldRecord, this.newRecord, this.completer})
      : super._() {
    if (oldRecord == null) {
      throw new BuiltValueNullFieldError('ReplaceFoodRecord', 'oldRecord');
    }
    if (newRecord == null) {
      throw new BuiltValueNullFieldError('ReplaceFoodRecord', 'newRecord');
    }
  }

  @override
  ReplaceFoodRecord rebuild(void Function(ReplaceFoodRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReplaceFoodRecordBuilder toBuilder() =>
      new ReplaceFoodRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReplaceFoodRecord &&
        oldRecord == other.oldRecord &&
        newRecord == other.newRecord &&
        completer == other.completer;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, oldRecord.hashCode), newRecord.hashCode),
        completer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReplaceFoodRecord')
          ..add('oldRecord', oldRecord)
          ..add('newRecord', newRecord)
          ..add('completer', completer))
        .toString();
  }
}

class ReplaceFoodRecordBuilder
    implements Builder<ReplaceFoodRecord, ReplaceFoodRecordBuilder> {
  _$ReplaceFoodRecord _$v;

  FoodRecordBuilder _oldRecord;
  FoodRecordBuilder get oldRecord =>
      _$this._oldRecord ??= new FoodRecordBuilder();
  set oldRecord(FoodRecordBuilder oldRecord) => _$this._oldRecord = oldRecord;

  FoodRecordBuilder _newRecord;
  FoodRecordBuilder get newRecord =>
      _$this._newRecord ??= new FoodRecordBuilder();
  set newRecord(FoodRecordBuilder newRecord) => _$this._newRecord = newRecord;

  Completer<void> _completer;
  Completer<void> get completer => _$this._completer;
  set completer(Completer<void> completer) => _$this._completer = completer;

  ReplaceFoodRecordBuilder();

  ReplaceFoodRecordBuilder get _$this {
    if (_$v != null) {
      _oldRecord = _$v.oldRecord?.toBuilder();
      _newRecord = _$v.newRecord?.toBuilder();
      _completer = _$v.completer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReplaceFoodRecord other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ReplaceFoodRecord;
  }

  @override
  void update(void Function(ReplaceFoodRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReplaceFoodRecord build() {
    _$ReplaceFoodRecord _$result;
    try {
      _$result = _$v ??
          new _$ReplaceFoodRecord._(
              oldRecord: oldRecord.build(),
              newRecord: newRecord.build(),
              completer: completer);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'oldRecord';
        oldRecord.build();
        _$failedField = 'newRecord';
        newRecord.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ReplaceFoodRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DeleteFoodRecords extends DeleteFoodRecords {
  @override
  final BuiltList<FoodRecord> foodRecords;
  @override
  final Completer<void> completer;

  factory _$DeleteFoodRecords(
          [void Function(DeleteFoodRecordsBuilder) updates]) =>
      (new DeleteFoodRecordsBuilder()..update(updates)).build();

  _$DeleteFoodRecords._({this.foodRecords, this.completer}) : super._() {
    if (foodRecords == null) {
      throw new BuiltValueNullFieldError('DeleteFoodRecords', 'foodRecords');
    }
  }

  @override
  DeleteFoodRecords rebuild(void Function(DeleteFoodRecordsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteFoodRecordsBuilder toBuilder() =>
      new DeleteFoodRecordsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteFoodRecords &&
        foodRecords == other.foodRecords &&
        completer == other.completer;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, foodRecords.hashCode), completer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeleteFoodRecords')
          ..add('foodRecords', foodRecords)
          ..add('completer', completer))
        .toString();
  }
}

class DeleteFoodRecordsBuilder
    implements Builder<DeleteFoodRecords, DeleteFoodRecordsBuilder> {
  _$DeleteFoodRecords _$v;

  ListBuilder<FoodRecord> _foodRecords;
  ListBuilder<FoodRecord> get foodRecords =>
      _$this._foodRecords ??= new ListBuilder<FoodRecord>();
  set foodRecords(ListBuilder<FoodRecord> foodRecords) =>
      _$this._foodRecords = foodRecords;

  Completer<void> _completer;
  Completer<void> get completer => _$this._completer;
  set completer(Completer<void> completer) => _$this._completer = completer;

  DeleteFoodRecordsBuilder();

  DeleteFoodRecordsBuilder get _$this {
    if (_$v != null) {
      _foodRecords = _$v.foodRecords?.toBuilder();
      _completer = _$v.completer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteFoodRecords other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DeleteFoodRecords;
  }

  @override
  void update(void Function(DeleteFoodRecordsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeleteFoodRecords build() {
    _$DeleteFoodRecords _$result;
    try {
      _$result = _$v ??
          new _$DeleteFoodRecords._(
              foodRecords: foodRecords.build(), completer: completer);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodRecords';
        foodRecords.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DeleteFoodRecords', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
