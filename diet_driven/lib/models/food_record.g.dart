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
      'uuid',
      serializers.serialize(object.uuid, specifiedType: const FullType(String)),
      'foodName',
      serializers.serialize(object.foodName,
          specifiedType: const FullType(String)),
    ];
    if (object.mealIndex != null) {
      result
        ..add('mealIndex')
        ..add(serializers.serialize(object.mealIndex,
            specifiedType: const FullType(int)));
    }
    if (object.grams != null) {
      result
        ..add('grams')
        ..add(serializers.serialize(object.grams,
            specifiedType: const FullType(num)));
    }
    if (object.calories != null) {
      result
        ..add('calories')
        ..add(serializers.serialize(object.calories,
            specifiedType: const FullType(num)));
    }
    if (object.protein != null) {
      result
        ..add('protein')
        ..add(serializers.serialize(object.protein,
            specifiedType: const FullType(num)));
    }
    if (object.fat != null) {
      result
        ..add('fat')
        ..add(serializers.serialize(object.fat,
            specifiedType: const FullType(num)));
    }
    if (object.carbs != null) {
      result
        ..add('carbs')
        ..add(serializers.serialize(object.carbs,
            specifiedType: const FullType(num)));
    }
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
        case 'uuid':
          result.uuid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'foodName':
          result.foodName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mealIndex':
          result.mealIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'grams':
          result.grams = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'calories':
          result.calories = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'protein':
          result.protein = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'fat':
          result.fat = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'carbs':
          result.carbs = serializers.deserialize(value,
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
  final int mealIndex;
  @override
  final num grams;
  @override
  final num calories;
  @override
  final num protein;
  @override
  final num fat;
  @override
  final num carbs;

  factory _$FoodRecord([void Function(FoodRecordBuilder) updates]) =>
      (new FoodRecordBuilder()..update(updates)).build() as _$FoodRecord;

  _$FoodRecord._(
      {this.uuid,
      this.foodName,
      this.mealIndex,
      this.grams,
      this.calories,
      this.protein,
      this.fat,
      this.carbs})
      : super._() {
    if (uuid == null) {
      throw new BuiltValueNullFieldError('FoodRecord', 'uuid');
    }
    if (foodName == null) {
      throw new BuiltValueNullFieldError('FoodRecord', 'foodName');
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
        mealIndex == other.mealIndex &&
        grams == other.grams &&
        calories == other.calories &&
        protein == other.protein &&
        fat == other.fat &&
        carbs == other.carbs;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, foodName.hashCode), mealIndex.hashCode),
                        grams.hashCode),
                    calories.hashCode),
                protein.hashCode),
            fat.hashCode),
        carbs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodRecord')
          ..add('uuid', uuid)
          ..add('foodName', foodName)
          ..add('mealIndex', mealIndex)
          ..add('grams', grams)
          ..add('calories', calories)
          ..add('protein', protein)
          ..add('fat', fat)
          ..add('carbs', carbs))
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
  int get mealIndex {
    _$this;
    return super.mealIndex;
  }

  @override
  set mealIndex(int mealIndex) {
    _$this;
    super.mealIndex = mealIndex;
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
  num get calories {
    _$this;
    return super.calories;
  }

  @override
  set calories(num calories) {
    _$this;
    super.calories = calories;
  }

  @override
  num get protein {
    _$this;
    return super.protein;
  }

  @override
  set protein(num protein) {
    _$this;
    super.protein = protein;
  }

  @override
  num get fat {
    _$this;
    return super.fat;
  }

  @override
  set fat(num fat) {
    _$this;
    super.fat = fat;
  }

  @override
  num get carbs {
    _$this;
    return super.carbs;
  }

  @override
  set carbs(num carbs) {
    _$this;
    super.carbs = carbs;
  }

  _$FoodRecordBuilder() : super._();

  FoodRecordBuilder get _$this {
    if (_$v != null) {
      super.uuid = _$v.uuid;
      super.foodName = _$v.foodName;
      super.mealIndex = _$v.mealIndex;
      super.grams = _$v.grams;
      super.calories = _$v.calories;
      super.protein = _$v.protein;
      super.fat = _$v.fat;
      super.carbs = _$v.carbs;
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
            uuid: uuid,
            foodName: foodName,
            mealIndex: mealIndex,
            grams: grams,
            calories: calories,
            protein: protein,
            fat: fat,
            carbs: carbs);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
