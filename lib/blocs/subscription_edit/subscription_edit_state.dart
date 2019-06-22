import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'subscription_edit_state.g.dart';

//abstract class SubscriptionState {}


abstract class SubscriptionEditState implements Built<SubscriptionEditState, SubscriptionEditStateBuilder> {
  // TODO: currently selected deal

  factory SubscriptionEditState([void Function(SubscriptionEditStateBuilder) updates]) = _$SubscriptionEditState;
  SubscriptionEditState._();
}

// TODO: loading state
