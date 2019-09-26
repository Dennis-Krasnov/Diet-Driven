// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SubscriptionType _$none = const SubscriptionType._('none');
const SubscriptionType _$all_access = const SubscriptionType._('all_access');
const SubscriptionType _$diet_driven_monthly =
    const SubscriptionType._('diet_driven_monthly');
const SubscriptionType _$diet_driven_yearly =
    const SubscriptionType._('diet_driven_yearly');

SubscriptionType _$subscriptionType(String name) {
  switch (name) {
    case 'none':
      return _$none;
    case 'all_access':
      return _$all_access;
    case 'diet_driven_monthly':
      return _$diet_driven_monthly;
    case 'diet_driven_yearly':
      return _$diet_driven_yearly;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SubscriptionType> _$subscriptionTypeValues =
    new BuiltSet<SubscriptionType>(const <SubscriptionType>[
  _$none,
  _$all_access,
  _$diet_driven_monthly,
  _$diet_driven_yearly,
]);

Serializer<SubscriptionType> _$subscriptionTypeSerializer =
    new _$SubscriptionTypeSerializer();

class _$SubscriptionTypeSerializer
    implements PrimitiveSerializer<SubscriptionType> {
  @override
  final Iterable<Type> types = const <Type>[SubscriptionType];
  @override
  final String wireName = 'SubscriptionType';

  @override
  Object serialize(Serializers serializers, SubscriptionType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  SubscriptionType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SubscriptionType.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
