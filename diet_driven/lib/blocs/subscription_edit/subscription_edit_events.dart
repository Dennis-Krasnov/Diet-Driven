//import 'dart:async';
//
//import 'package:built_value/built_value.dart';
//import 'package:diet_driven/blocs/bloc_utils.dart';
//
//import 'package:diet_driven/models/models.dart';
//
//part 'subscription_edit_events.g.dart';
//
//abstract class SubscriptionEditEvent {}
//
///// Starts paid subscription through IAP
//abstract class Subscribe with Completable implements SubscriptionEditEvent, Built<Subscribe, SubscribeBuilder> {
//  SubscriptionType get subscriptionType;
//
//  factory Subscribe([void Function(SubscribeBuilder b)]) = _$Subscribe;
//  Subscribe._();
//}
//
///// Ends paid subscription through IAP
//abstract class Unsubscribe with Completable implements SubscriptionEditEvent, Built<Unsubscribe, UnsubscribeBuilder> {
//  factory Unsubscribe([void Function(UnsubscribeBuilder b)]) = _$Unsubscribe;
//  Unsubscribe._();
//
//  @override String toString() => runtimeType.toString();
//}
