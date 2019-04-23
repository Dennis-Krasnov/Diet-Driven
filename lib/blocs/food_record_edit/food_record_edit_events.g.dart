// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_record_edit_events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateQuantity extends UpdateQuantity {
  @override
  final num quantity;

  factory _$UpdateQuantity([void updates(UpdateQuantityBuilder b)]) =>
      (new UpdateQuantityBuilder()..update(updates)).build();

  _$UpdateQuantity._({this.quantity}) : super._() {
    if (quantity == null) {
      throw new BuiltValueNullFieldError('UpdateQuantity', 'quantity');
    }
  }

  @override
  UpdateQuantity rebuild(void updates(UpdateQuantityBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateQuantityBuilder toBuilder() =>
      new UpdateQuantityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateQuantity && quantity == other.quantity;
  }

  @override
  int get hashCode {
    return $jf($jc(0, quantity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UpdateQuantity')
          ..add('quantity', quantity))
        .toString();
  }
}

class UpdateQuantityBuilder
    implements Builder<UpdateQuantity, UpdateQuantityBuilder> {
  _$UpdateQuantity _$v;

  num _quantity;
  num get quantity => _$this._quantity;
  set quantity(num quantity) => _$this._quantity = quantity;

  UpdateQuantityBuilder();

  UpdateQuantityBuilder get _$this {
    if (_$v != null) {
      _quantity = _$v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateQuantity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UpdateQuantity;
  }

  @override
  void update(void updates(UpdateQuantityBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdateQuantity build() {
    final _$result = _$v ?? new _$UpdateQuantity._(quantity: quantity);
    replace(_$result);
    return _$result;
  }
}

class _$SaveFoodRecord extends SaveFoodRecord {
  factory _$SaveFoodRecord([void updates(SaveFoodRecordBuilder b)]) =>
      (new SaveFoodRecordBuilder()..update(updates)).build();

  _$SaveFoodRecord._() : super._();

  @override
  SaveFoodRecord rebuild(void updates(SaveFoodRecordBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SaveFoodRecordBuilder toBuilder() =>
      new SaveFoodRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SaveFoodRecord;
  }

  @override
  int get hashCode {
    return 921753263;
  }
}

class SaveFoodRecordBuilder
    implements Builder<SaveFoodRecord, SaveFoodRecordBuilder> {
  _$SaveFoodRecord _$v;

  SaveFoodRecordBuilder();

  @override
  void replace(SaveFoodRecord other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SaveFoodRecord;
  }

  @override
  void update(void updates(SaveFoodRecordBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SaveFoodRecord build() {
    final _$result = _$v ?? new _$SaveFoodRecord._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
