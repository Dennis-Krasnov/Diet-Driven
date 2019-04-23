// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FoodRecord> _$foodRecordSerializer = new _$FoodRecordSerializer();

class _$FoodRecordSerializer implements StructuredSerializer<FoodRecord> {
  @override
  final Iterable<Type> types = const [FoodRecord, _$FoodRecord];
  @override
  final String wireName = 'FoodRecord';

  @override
  Iterable serialize(Serializers serializers, FoodRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'uuid',
      serializers.serialize(object.uuid, specifiedType: const FullType(String)),
      'foodName',
      serializers.serialize(object.foodName,
          specifiedType: const FullType(String)),
    ];
    if (object.quantity != null) {
      result
        ..add('quantity')
        ..add(serializers.serialize(object.quantity,
            specifiedType: const FullType(num)));
    }

    return result;
  }

  @override
  FoodRecord deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoodRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uuid':
          result.uuid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'foodName':
          result.foodName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
      }
    }

    return result.build();
  }
}

class _$FoodRecord extends FoodRecord {
  @override
  final String uuid;
  @override
  final String foodName;
  @override
  final num quantity;

  factory _$FoodRecord([void updates(FoodRecordBuilder b)]) =>
      (new FoodRecordBuilder()..update(updates)).build() as _$FoodRecord;

  _$FoodRecord._({this.uuid, this.foodName, this.quantity}) : super._() {
    if (uuid == null) {
      throw new BuiltValueNullFieldError('FoodRecord', 'uuid');
    }
    if (foodName == null) {
      throw new BuiltValueNullFieldError('FoodRecord', 'foodName');
    }
  }

  @override
  FoodRecord rebuild(void updates(FoodRecordBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$FoodRecordBuilder toBuilder() => new _$FoodRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodRecord &&
        foodName == other.foodName &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, foodName.hashCode), quantity.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodRecord')
          ..add('uuid', uuid)
          ..add('foodName', foodName)
          ..add('quantity', quantity))
        .toString();
  }
}

class _$FoodRecordBuilder extends FoodRecordBuilder {
  _$FoodRecord _$v;

  @override
  String get uuid {
    _$this;
    return super.uuid;
  }

  @override
  set uuid(String uuid) {
    _$this;
    super.uuid = uuid;
  }

  @override
  String get foodName {
    _$this;
    return super.foodName;
  }

  @override
  set foodName(String foodName) {
    _$this;
    super.foodName = foodName;
  }

  @override
  num get quantity {
    _$this;
    return super.quantity;
  }

  @override
  set quantity(num quantity) {
    _$this;
    super.quantity = quantity;
  }

  _$FoodRecordBuilder() : super._();

  FoodRecordBuilder get _$this {
    if (_$v != null) {
      super.uuid = _$v.uuid;
      super.foodName = _$v.foodName;
      super.quantity = _$v.quantity;
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
    final _$result = _$v ??
        new _$FoodRecord._(uuid: uuid, foodName: foodName, quantity: quantity);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
