import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'subscription_events.g.dart';

abstract class SubscriptionEvent {}

/// check if the user has a subscription or not.
abstract class LoadExistingSubscription with SubscriptionEvent implements Built<LoadExistingSubscription, LoadExistingSubscriptionBuilder> {
  LoadExistingSubscription._();
  factory LoadExistingSubscription([updates(LoadExistingSubscriptionBuilder b)]) = _$LoadExistingSubscription;
}

// TODO: rename auth appstarted event as well (can't have duplicates)
//abstract class AppStarted with SubscriptionEvent implements Built<AppStarted, AppStartedBuilder> {
//  AppStarted._();
//  factory AppStarted([updates(AppStartedBuilder b)]) = _$AppStarted;
//}

///
abstract class Subscribed with SubscriptionEvent implements Built<Subscribed, SubscribedBuilder> {
  SubscriptionType get subscriptionType;

  Subscribed._();
  factory Subscribed([updates(SubscribedBuilder b)]) = _$Subscribed;
}

///
abstract class Unsubscribed with SubscriptionEvent implements Built<Unsubscribed, UnsubscribedBuilder> {
  Unsubscribed._();
  factory Unsubscribed([updates(UnsubscribedBuilder b)]) = _$Unsubscribed;
}
