// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_day.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FoodDiaryDay> _$foodDiaryDaySerializer =
    new _$FoodDiaryDaySerializer();

class _$FoodDiaryDaySerializer implements StructuredSerializer<FoodDiaryDay> {
  @override
  final Iterable<Type> types = const [FoodDiaryDay, _$FoodDiaryDay];
  @override
  final String wireName = 'FoodDiaryDay';

  @override
  Iterable<Object> serialize(Serializers serializers, FoodDiaryDay object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(int)),
      'meals',
      serializers.serialize(object.meals,
          specifiedType:
              const FullType(BuiltList, const [const FullType(MealData)])),
    ];

    return result;
  }

  @override
  FoodDiaryDay deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoodDiaryDayBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'meals':
          result.meals = serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MealData)]))
              as BuiltList<dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$FoodDiaryDay extends FoodDiaryDay {
  @override
  final int date;
  @override
  final BuiltList<MealData> meals;

  factory _$FoodDiaryDay([void Function(FoodDiaryDayBuilder) updates]) =>
      (new FoodDiaryDayBuilder()..update(updates)).build() as _$FoodDiaryDay;

  _$FoodDiaryDay._({this.date, this.meals}) : super._() {
    if (date == null) {
      throw new BuiltValueNullFieldError('FoodDiaryDay', 'date');
    }
    if (meals == null) {
      throw new BuiltValueNullFieldError('FoodDiaryDay', 'meals');
    }
  }

  @override
  FoodDiaryDay rebuild(void Function(FoodDiaryDayBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$FoodDiaryDayBuilder toBuilder() =>
      new _$FoodDiaryDayBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodDiaryDay && date == other.date && meals == other.meals;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, date.hashCode), meals.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodDiaryDay')
          ..add('date', date)
          ..add('meals', meals))
        .toString();
  }
}

class _$FoodDiaryDayBuilder extends FoodDiaryDayBuilder {
  _$FoodDiaryDay _$v;

  @override
  int get date {
    _$this;
    return super.date;
  }

  @override
  set date(int date) {
    _$this;
    super.date = date;
  }

  @override
  BuiltList<MealData> get meals {
    _$this;
    return super.meals;
  }

  @override
  set meals(BuiltList<MealData> meals) {
    _$this;
    super.meals = meals;
  }

  _$FoodDiaryDayBuilder() : super._();

  FoodDiaryDayBuilder get _$this {
    if (_$v != null) {
      super.date = _$v.date;
      super.meals = _$v.meals;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodDiaryDay other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodDiaryDay;
  }

  @override
  void update(void Function(FoodDiaryDayBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodDiaryDay build() {
    final _$result = _$v ?? new _$FoodDiaryDay._(date: date, meals: meals);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
