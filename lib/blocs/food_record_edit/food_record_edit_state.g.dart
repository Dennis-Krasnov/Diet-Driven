// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_record_edit_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FoodRecordEditState extends FoodRecordEditState {
  @override
  final FoodRecord foodRecord;

  factory _$FoodRecordEditState([void updates(FoodRecordEditStateBuilder b)]) =>
      (new FoodRecordEditStateBuilder()..update(updates)).build();

  _$FoodRecordEditState._({this.foodRecord}) : super._() {
    if (foodRecord == null) {
      throw new BuiltValueNullFieldError('FoodRecordEditState', 'foodRecord');
    }
  }

  @override
  FoodRecordEditState rebuild(void updates(FoodRecordEditStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodRecordEditStateBuilder toBuilder() =>
      new FoodRecordEditStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodRecordEditState && foodRecord == other.foodRecord;
  }

  @override
  int get hashCode {
    return $jf($jc(0, foodRecord.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodRecordEditState')
          ..add('foodRecord', foodRecord))
        .toString();
  }
}

class FoodRecordEditStateBuilder
    implements Builder<FoodRecordEditState, FoodRecordEditStateBuilder> {
  _$FoodRecordEditState _$v;

  FoodRecordBuilder _foodRecord;
  FoodRecordBuilder get foodRecord =>
      _$this._foodRecord ??= new FoodRecordBuilder();
  set foodRecord(FoodRecordBuilder foodRecord) =>
      _$this._foodRecord = foodRecord;

  FoodRecordEditStateBuilder();

  FoodRecordEditStateBuilder get _$this {
    if (_$v != null) {
      _foodRecord = _$v.foodRecord?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodRecordEditState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodRecordEditState;
  }

  @override
  void update(void updates(FoodRecordEditStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodRecordEditState build() {
    _$FoodRecordEditState _$result;
    try {
      _$result =
          _$v ?? new _$FoodRecordEditState._(foodRecord: foodRecord.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodRecord';
        foodRecord.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FoodRecordEditState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
