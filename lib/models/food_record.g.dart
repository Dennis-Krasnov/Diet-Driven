// GENERATED CODE - DO NOT MODIFY BY HAND

part of food_record;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FoodRecord extends FoodRecord {
  @override
  final String foodName;

  factory _$FoodRecord([void updates(FoodRecordBuilder b)]) =>
      (new FoodRecordBuilder()..update(updates)).build();

  _$FoodRecord._({this.foodName}) : super._() {
    if (foodName == null) {
      throw new BuiltValueNullFieldError('FoodRecord', 'foodName');
    }
  }

  @override
  FoodRecord rebuild(void updates(FoodRecordBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodRecordBuilder toBuilder() => new FoodRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodRecord && foodName == other.foodName;
  }

  @override
  int get hashCode {
    return $jf($jc(0, foodName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodRecord')
          ..add('foodName', foodName))
        .toString();
  }
}

class FoodRecordBuilder implements Builder<FoodRecord, FoodRecordBuilder> {
  _$FoodRecord _$v;

  String _foodName;
  String get foodName => _$this._foodName;
  set foodName(String foodName) => _$this._foodName = foodName;

  FoodRecordBuilder();

  FoodRecordBuilder get _$this {
    if (_$v != null) {
      _foodName = _$v.foodName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodRecord other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodRecord;
  }

  @override
  void update(void updates(FoodRecordBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodRecord build() {
    final _$result = _$v ?? new _$FoodRecord._(foodName: foodName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
