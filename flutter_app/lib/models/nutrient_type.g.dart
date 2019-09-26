// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const NutrientType _$macronutrient = const NutrientType._('macronutrient');
const NutrientType _$vitamin = const NutrientType._('vitamin');
const NutrientType _$mineral = const NutrientType._('mineral');

NutrientType _$valueOf(String name) {
  switch (name) {
    case 'macronutrient':
      return _$macronutrient;
    case 'vitamin':
      return _$vitamin;
    case 'mineral':
      return _$mineral;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<NutrientType> _$values =
    new BuiltSet<NutrientType>(const <NutrientType>[
  _$macronutrient,
  _$vitamin,
  _$mineral,
]);

Serializer<NutrientType> _$nutrientTypeSerializer =
    new _$NutrientTypeSerializer();

class _$NutrientTypeSerializer implements PrimitiveSerializer<NutrientType> {
  @override
  final Iterable<Type> types = const <Type>[NutrientType];
  @override
  final String wireName = 'NutrientType';

  @override
  Object serialize(Serializers serializers, NutrientType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  NutrientType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NutrientType.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
