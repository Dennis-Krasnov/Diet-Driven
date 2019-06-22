// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RemoteDiaryDayArrived extends RemoteDiaryDayArrived {
  @override
  final FoodDiaryDay foodDiaryDay;
  @override
  final Diet diet;

  factory _$RemoteDiaryDayArrived(
          [void Function(RemoteDiaryDayArrivedBuilder) updates]) =>
      (new RemoteDiaryDayArrivedBuilder()..update(updates)).build();

  _$RemoteDiaryDayArrived._({this.foodDiaryDay, this.diet}) : super._() {
    if (foodDiaryDay == null) {
      throw new BuiltValueNullFieldError(
          'RemoteDiaryDayArrived', 'foodDiaryDay');
    }
    if (diet == null) {
      throw new BuiltValueNullFieldError('RemoteDiaryDayArrived', 'diet');
    }
  }

  @override
  RemoteDiaryDayArrived rebuild(
          void Function(RemoteDiaryDayArrivedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoteDiaryDayArrivedBuilder toBuilder() =>
      new RemoteDiaryDayArrivedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoteDiaryDayArrived &&
        foodDiaryDay == other.foodDiaryDay &&
        diet == other.diet;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, foodDiaryDay.hashCode), diet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RemoteDiaryDayArrived')
          ..add('foodDiaryDay', foodDiaryDay)
          ..add('diet', diet))
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

  DietBuilder _diet;
  DietBuilder get diet => _$this._diet ??= new DietBuilder();
  set diet(DietBuilder diet) => _$this._diet = diet;

  RemoteDiaryDayArrivedBuilder();

  RemoteDiaryDayArrivedBuilder get _$this {
    if (_$v != null) {
      _foodDiaryDay = _$v.foodDiaryDay?.toBuilder();
      _diet = _$v.diet?.toBuilder();
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
  void update(void Function(RemoteDiaryDayArrivedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoteDiaryDayArrived build() {
    _$RemoteDiaryDayArrived _$result;
    try {
      _$result = _$v ??
          new _$RemoteDiaryDayArrived._(
              foodDiaryDay: foodDiaryDay.build(), diet: diet.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodDiaryDay';
        foodDiaryDay.build();
        _$failedField = 'diet';
        diet.build();
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

class _$FoodDiaryError extends FoodDiaryError {
  @override
  final String error;
  @override
  final String trace;

  factory _$FoodDiaryError([void Function(FoodDiaryErrorBuilder) updates]) =>
      (new FoodDiaryErrorBuilder()..update(updates)).build();

  _$FoodDiaryError._({this.error, this.trace}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('FoodDiaryError', 'error');
    }
    if (trace == null) {
      throw new BuiltValueNullFieldError('FoodDiaryError', 'trace');
    }
  }

  @override
  FoodDiaryError rebuild(void Function(FoodDiaryErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodDiaryErrorBuilder toBuilder() =>
      new FoodDiaryErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryError &&
        error == other.error &&
        trace == other.trace;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), trace.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryError')
          ..add('error', error)
          ..add('trace', trace))
        .toString();
  }
}

class FoodDiaryErrorBuilder
    implements Builder<FoodDiaryError, FoodDiaryErrorBuilder> {
  _$FoodDiaryError _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  String _trace;
  String get trace => _$this._trace;
  set trace(String trace) => _$this._trace = trace;

  FoodDiaryErrorBuilder();

  FoodDiaryErrorBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _trace = _$v.trace;
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
  void update(void Function(FoodDiaryErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryError build() {
    final _$result = _$v ?? new _$FoodDiaryError._(error: error, trace: trace);
    replace(_$result);
    return _$result;
  }
}

class _$AddFoodRecords extends AddFoodRecords {
  @override
  final BuiltList<FoodRecord> foodRecords;
  @override
  final Completer<void> completer;

  factory _$AddFoodRecords([void Function(AddFoodRecordsBuilder) updates]) =>
      (new AddFoodRecordsBuilder()..update(updates)).build();

  _$AddFoodRecords._({this.foodRecords, this.completer}) : super._() {
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
        foodRecords == other.foodRecords &&
        completer == other.completer;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, foodRecords.hashCode), completer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddFoodRecords')
          ..add('foodRecords', foodRecords)
          ..add('completer', completer))
        .toString();
  }
}

class AddFoodRecordsBuilder
    implements Builder<AddFoodRecords, AddFoodRecordsBuilder> {
  _$AddFoodRecords _$v;

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
              foodRecords: foodRecords.build(), completer: completer);
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
