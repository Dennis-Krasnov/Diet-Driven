// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_record_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FoodRecordResult extends FoodRecordResult {
  @override
  final FoodRecord foodRecord;
  @override
  final LoggingTab resultType;
  @override
  final bool existsInDiary;
  @override
  final bool existsInSelection;

  factory _$FoodRecordResult(
          [void Function(FoodRecordResultBuilder) updates]) =>
      (new FoodRecordResultBuilder()..update(updates)).build();

  _$FoodRecordResult._(
      {this.foodRecord,
      this.resultType,
      this.existsInDiary,
      this.existsInSelection})
      : super._() {
    if (foodRecord == null) {
      throw new BuiltValueNullFieldError('FoodRecordResult', 'foodRecord');
    }
    if (resultType == null) {
      throw new BuiltValueNullFieldError('FoodRecordResult', 'resultType');
    }
    if (existsInDiary == null) {
      throw new BuiltValueNullFieldError('FoodRecordResult', 'existsInDiary');
    }
    if (existsInSelection == null) {
      throw new BuiltValueNullFieldError(
          'FoodRecordResult', 'existsInSelection');
    }
  }

  @override
  FoodRecordResult rebuild(void Function(FoodRecordResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodRecordResultBuilder toBuilder() =>
      new FoodRecordResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodRecordResult &&
        foodRecord == other.foodRecord &&
        resultType == other.resultType &&
        existsInDiary == other.existsInDiary &&
        existsInSelection == other.existsInSelection;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, foodRecord.hashCode), resultType.hashCode),
            existsInDiary.hashCode),
        existsInSelection.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodRecordResult')
          ..add('foodRecord', foodRecord)
          ..add('resultType', resultType)
          ..add('existsInDiary', existsInDiary)
          ..add('existsInSelection', existsInSelection))
        .toString();
  }
}

class FoodRecordResultBuilder
    implements Builder<FoodRecordResult, FoodRecordResultBuilder> {
  _$FoodRecordResult _$v;

  FoodRecordBuilder _foodRecord;
  FoodRecordBuilder get foodRecord =>
      _$this._foodRecord ??= new FoodRecordBuilder();
  set foodRecord(FoodRecordBuilder foodRecord) =>
      _$this._foodRecord = foodRecord;

  LoggingTab _resultType;
  LoggingTab get resultType => _$this._resultType;
  set resultType(LoggingTab resultType) => _$this._resultType = resultType;

  bool _existsInDiary;
  bool get existsInDiary => _$this._existsInDiary;
  set existsInDiary(bool existsInDiary) =>
      _$this._existsInDiary = existsInDiary;

  bool _existsInSelection;
  bool get existsInSelection => _$this._existsInSelection;
  set existsInSelection(bool existsInSelection) =>
      _$this._existsInSelection = existsInSelection;

  FoodRecordResultBuilder();

  FoodRecordResultBuilder get _$this {
    if (_$v != null) {
      _foodRecord = _$v.foodRecord?.toBuilder();
      _resultType = _$v.resultType;
      _existsInDiary = _$v.existsInDiary;
      _existsInSelection = _$v.existsInSelection;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodRecordResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodRecordResult;
  }

  @override
  void update(void Function(FoodRecordResultBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodRecordResult build() {
    _$FoodRecordResult _$result;
    try {
      _$result = _$v ??
          new _$FoodRecordResult._(
              foodRecord: foodRecord.build(),
              resultType: resultType,
              existsInDiary: existsInDiary,
              existsInSelection: existsInSelection);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodRecord';
        foodRecord.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FoodRecordResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
