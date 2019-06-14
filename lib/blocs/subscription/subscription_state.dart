import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'subscription_state.g.dart';

abstract class SubscriptionState {}

///
abstract class SubscriptionUninitialized with SubscriptionState implements Built<SubscriptionUninitialized, SubscriptionUninitializedBuilder> {
  SubscriptionUninitialized._();
  factory SubscriptionUninitialized([void Function(SubscriptionUninitializedBuilder b)]) = _$SubscriptionUninitialized;

  @override String toString() => runtimeType.toString();
}

///
abstract class NoSubscription with SubscriptionState implements Built<NoSubscription, NoSubscriptionBuilder> {
  NoSubscription._();
  factory NoSubscription([void Function(NoSubscriptionBuilder b)]) = _$NoSubscription;

  @override String toString() => runtimeType.toString();
}

///
abstract class HasSubscription with SubscriptionState implements Built<HasSubscription, HasSubscriptionBuilder> {
  SubscriptionType get subscriptionType;

  HasSubscription._();
  factory HasSubscription([void Function(HasSubscriptionBuilder b)]) = _$HasSubscription;
}
