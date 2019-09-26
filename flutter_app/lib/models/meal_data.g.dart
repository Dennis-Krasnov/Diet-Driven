// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MealData> _$mealDataSerializer = new _$MealDataSerializer();

class _$MealDataSerializer implements StructuredSerializer<MealData> {
  @override
  final Iterable<Type> types = const [MealData, _$MealData];
  @override
  final String wireName = 'MealData';

  @override
  Iterable<Object> serialize(Serializers serializers, MealData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'foodRecords',
      serializers.serialize(object.foodRecords,
          specifiedType:
              const FullType(BuiltList, const [const FullType(FoodRecord)])),
    ];

    return result;
  }

  @override
  MealData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MealDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'foodRecords':
          result.foodRecords.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(FoodRecord)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$MealData extends MealData {
  @override
  final BuiltList<FoodRecord> foodRecords;

  factory _$MealData([void Function(MealDataBuilder) updates]) =>
      (new MealDataBuilder()..update(updates)).build();

  _$MealData._({this.foodRecords}) : super._() {
    if (foodRecords == null) {
      throw new BuiltValueNullFieldError('MealData', 'foodRecords');
    }
  }

  @override
  MealData rebuild(void Function(MealDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MealDataBuilder toBuilder() => new MealDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MealData && foodRecords == other.foodRecords;
  }

  @override
  int get hashCode {
    return $jf($jc(0, foodRecords.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MealData')
          ..add('foodRecords', foodRecords))
        .toString();
  }
}

class MealDataBuilder implements Builder<MealData, MealDataBuilder> {
  _$MealData _$v;

  ListBuilder<FoodRecord> _foodRecords;
  ListBuilder<FoodRecord> get foodRecords =>
      _$this._foodRecords ??= new ListBuilder<FoodRecord>();
  set foodRecords(ListBuilder<FoodRecord> foodRecords) =>
      _$this._foodRecords = foodRecords;

  MealDataBuilder();

  MealDataBuilder get _$this {
    if (_$v != null) {
      _foodRecords = _$v.foodRecords?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MealData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MealData;
  }

  @override
  void update(void Function(MealDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MealData build() {
    _$MealData _$result;
    try {
      _$result = _$v ?? new _$MealData._(foodRecords: foodRecords.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'foodRecords';
        foodRecords.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MealData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
