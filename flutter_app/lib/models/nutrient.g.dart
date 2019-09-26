// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const Nutrient _$protein = const Nutrient._('protein');
const Nutrient _$fat = const Nutrient._('fat');
const Nutrient _$carbs = const Nutrient._('carbs');
const Nutrient _$calcium = const Nutrient._('calcium');

Nutrient _$valueOf(String name) {
  switch (name) {
    case 'protein':
      return _$protein;
    case 'fat':
      return _$fat;
    case 'carbs':
      return _$carbs;
    case 'calcium':
      return _$calcium;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<Nutrient> _$values = new BuiltSet<Nutrient>(const <Nutrient>[
  _$protein,
  _$fat,
  _$carbs,
  _$calcium,
]);

Serializer<Nutrient> _$nutrientSerializer = new _$NutrientSerializer();

class _$NutrientSerializer implements PrimitiveSerializer<Nutrient> {
  @override
  final Iterable<Type> types = const <Type>[Nutrient];
  @override
  final String wireName = 'Nutrient';

  @override
  Object serialize(Serializers serializers, Nutrient object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  Nutrient deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Nutrient.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
