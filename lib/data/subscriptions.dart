library subscriptions;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subscriptions.g.dart';

// TODO: builtval subscription_history class for historical records...

///
class SubscriptionType extends EnumClass {
  static Serializer<SubscriptionType> get serializer => _$subscriptionTypeSerializer;

  // Default ...
  static const SubscriptionType none = _$none;

  //
  static const SubscriptionType casual = _$casual;

  //
  static const SubscriptionType professional = _$professional;

  // TODO: enterprise type

  const SubscriptionType._(String name) : super(name);

  static BuiltSet<SubscriptionType> get values => _$subscriptionTypeValues;

  static SubscriptionType valueOf(String name) => _$subscriptionTypeValueOf(name);
}