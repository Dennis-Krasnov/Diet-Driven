import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'subscription_events.g.dart';

abstract class SubscriptionEvent {}

/// check if the user has a subscription or not.
abstract class LoadExistingSubscription with SubscriptionEvent implements Built<LoadExistingSubscription, LoadExistingSubscriptionBuilder> {
  LoadExistingSubscription._();
  factory LoadExistingSubscription([void Function(LoadExistingSubscriptionBuilder b)]) = _$LoadExistingSubscription;

  @override String toString() => runtimeType.toString();
}

// TODO: rename auth appstarted event as well (can't have duplicates)
//abstract class AppStarted with SubscriptionEvent implements Built<AppStarted, AppStartedBuilder> {
//  AppStarted._();
//  factory AppStarted([void Function(AppStartedBuilder b)]) = _$AppStarted;
//}

// TODO: change all to present tense!

///
abstract class Subscribe with SubscriptionEvent implements Built<Subscribe, SubscribeBuilder> {
  SubscriptionType get subscriptionType;

  Subscribe._();
  factory Subscribe([void Function(SubscribeBuilder b)]) = _$Subscribe;
}

///
abstract class Unsubscribe with SubscriptionEvent implements Built<Unsubscribe, UnsubscribeBuilder> {
  Unsubscribe._();
  factory Unsubscribe([void Function(UnsubscribeBuilder b)]) = _$Unsubscribe;

  @override String toString() => runtimeType.toString();
}
