// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_map.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NutrientMap> _$nutrientMapSerializer = new _$NutrientMapSerializer();

class _$NutrientMapSerializer implements StructuredSerializer<NutrientMap> {
  @override
  final Iterable<Type> types = const [NutrientMap, _$NutrientMap];
  @override
  final String wireName = 'NutrientMap';

  @override
  Iterable<Object> serialize(Serializers serializers, NutrientMap object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'calories',
      serializers.serialize(object.calories,
          specifiedType: const FullType(num)),
      'quantities',
      serializers.serialize(object.quantities,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(Nutrient), const FullType(num)])),
    ];

    return result;
  }

  @override
  NutrientMap deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NutrientMapBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'calories':
          result.calories = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'quantities':
          result.quantities = serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(Nutrient),
                const FullType(num)
              ])) as BuiltMap<dynamic, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$NutrientMap extends NutrientMap {
  @override
  final num calories;
  @override
  final BuiltMap<Nutrient, num> quantities;

  factory _$NutrientMap([void Function(NutrientMapBuilder) updates]) =>
      (new NutrientMapBuilder()..update(updates)).build() as _$NutrientMap;

  _$NutrientMap._({this.calories, this.quantities}) : super._() {
    if (calories == null) {
      throw new BuiltValueNullFieldError('NutrientMap', 'calories');
    }
    if (quantities == null) {
      throw new BuiltValueNullFieldError('NutrientMap', 'quantities');
    }
  }

  @override
  NutrientMap rebuild(void Function(NutrientMapBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  _$NutrientMapBuilder toBuilder() => new _$NutrientMapBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NutrientMap &&
        calories == other.calories &&
        quantities == other.quantities;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, calories.hashCode), quantities.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NutrientMap')
          ..add('calories', calories)
          ..add('quantities', quantities))
        .toString();
  }
}

class _$NutrientMapBuilder extends NutrientMapBuilder {
  _$NutrientMap _$v;

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
  BuiltMap<Nutrient, num> get quantities {
    _$this;
    return super.quantities;
  }

  @override
  set quantities(BuiltMap<Nutrient, num> quantities) {
    _$this;
    super.quantities = quantities;
  }

  _$NutrientMapBuilder() : super._();

  NutrientMapBuilder get _$this {
    if (_$v != null) {
      super.calories = _$v.calories;
      super.quantities = _$v.quantities;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NutrientMap other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NutrientMap;
  }

  @override
  void update(void Function(NutrientMapBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NutrientMap build() {
    final _$result =
        _$v ?? new _$NutrientMap._(calories: calories, quantities: quantities);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
