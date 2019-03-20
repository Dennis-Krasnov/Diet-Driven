import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'subscription_state.g.dart';

abstract class SubscriptionState {}

///
abstract class SubscriptionUninitialized with SubscriptionState implements Built<SubscriptionUninitialized, SubscriptionUninitializedBuilder> {
  SubscriptionUninitialized._();
  factory SubscriptionUninitialized([updates(SubscriptionUninitializedBuilder b)]) = _$SubscriptionUninitialized;
}

///
abstract class NoSubscription with SubscriptionState implements Built<NoSubscription, NoSubscriptionBuilder> {
  NoSubscription._();
  factory NoSubscription([updates(NoSubscriptionBuilder b)]) = _$NoSubscription;
}

///
abstract class HasSubscription with SubscriptionState implements Built<HasSubscription, HasSubscriptionBuilder> {
  SubscriptionType get subscriptionType;

  HasSubscription._();
  factory HasSubscription([updates(HasSubscriptionBuilder b)]) = _$HasSubscription;
}
