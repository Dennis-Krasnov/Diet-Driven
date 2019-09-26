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
  Iterable<Object> serialize(Serializers serializers, FoodRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'foodName',
      serializers.serialize(object.foodName,
          specifiedType: const FullType(String)),
      'grams',
      serializers.serialize(object.grams, specifiedType: const FullType(num)),
      'totalNutrients',
      serializers.serialize(object.totalNutrients,
          specifiedType: const FullType(NutrientMap)),
    ];

    return result;
  }

  @override
  FoodRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoodRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'foodName':
          result.foodName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'grams':
          result.grams = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'totalNutrients':
          result.totalNutrients = serializers.deserialize(value,
              specifiedType: const FullType(NutrientMap)) as NutrientMap;
          break;
      }
    }

    return result.build();
  }
}

class _$FoodRecord extends FoodRecord {
  @override
  final String uid;
  @override
  final String foodName;
  @override
  final num grams;
  @override
  final NutrientMap totalNutrients;

  factory _$FoodRecord([void Function(FoodRecordBuilder) updates]) =>
      (new FoodRecordBuilder()..update(updates)).build() as _$FoodRecord;

  _$FoodRecord._({this.uid, this.foodName, this.grams, this.totalNutrients})
      : super._() {
    if (uid == null) {
      throw new BuiltValueNullFieldError('FoodRecord', 'uid');
    }
    if (foodName == null) {
      throw new BuiltValueNullFieldError('FoodRecord', 'foodName');
    }
    if (grams == null) {
      throw new BuiltValueNullFieldError('FoodRecord', 'grams');
    }
    if (totalNutrients == null) {
      throw new BuiltValueNullFieldError('FoodRecord', 'totalNutrients');
    }
  }

  @override
  FoodRecord rebuild(void Function(FoodRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$FoodRecordBuilder toBuilder() => new _$FoodRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodRecord &&
        foodName == other.foodName &&
        grams == other.grams &&
        totalNutrients == other.totalNutrients;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, foodName.hashCode), grams.hashCode),
        totalNutrients.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodRecord')
          ..add('uid', uid)
          ..add('foodName', foodName)
          ..add('grams', grams)
          ..add('totalNutrients', totalNutrients))
        .toString();
  }
}

class _$FoodRecordBuilder extends FoodRecordBuilder {
  _$FoodRecord _$v;

  @override
  String get uid {
    _$this;
    return super.uid;
  }

  @override
  set uid(String uid) {
    _$this;
    super.uid = uid;
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
  num get grams {
    _$this;
    return super.grams;
  }

  @override
  set grams(num grams) {
    _$this;
    super.grams = grams;
  }

  @override
  NutrientMap get totalNutrients {
    _$this;
    return super.totalNutrients;
  }

  @override
  set totalNutrients(NutrientMap totalNutrients) {
    _$this;
    super.totalNutrients = totalNutrients;
  }

  _$FoodRecordBuilder() : super._();

  FoodRecordBuilder get _$this {
    if (_$v != null) {
      super.uid = _$v.uid;
      super.foodName = _$v.foodName;
      super.grams = _$v.grams;
      super.totalNutrients = _$v.totalNutrients;
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
  void update(void Function(FoodRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodRecord build() {
    final _$result = _$v ??
        new _$FoodRecord._(
            uid: uid,
            foodName: foodName,
            grams: grams,
            totalNutrients: totalNutrients);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
