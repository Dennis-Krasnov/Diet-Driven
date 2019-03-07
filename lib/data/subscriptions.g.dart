// GENERATED CODE - DO NOT MODIFY BY HAND

part of subscriptions;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SubscriptionType _$none = const SubscriptionType._('none');
const SubscriptionType _$casual = const SubscriptionType._('casual');
const SubscriptionType _$professional =
    const SubscriptionType._('professional');

SubscriptionType _$subscriptionTypeValueOf(String name) {
  switch (name) {
    case 'none':
      return _$none;
    case 'casual':
      return _$casual;
    case 'professional':
      return _$professional;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SubscriptionType> _$subscriptionTypeValues =
    new BuiltSet<SubscriptionType>(const <SubscriptionType>[
  _$none,
  _$casual,
  _$professional,
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
