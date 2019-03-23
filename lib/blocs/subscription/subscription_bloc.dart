import 'package:bloc/bloc.dart';
import 'dart:async';

import 'package:diet_driven/blocs/subscription/subscription.dart';
import 'package:diet_driven/models/models.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  @override
  SubscriptionState get initialState => SubscriptionUninitialized();

  @override
  Stream<SubscriptionState> mapEventToState(SubscriptionState currentState, SubscriptionEvent event) async* {
    if (event is LoadExistingSubscription) {
//      final FirebaseUser user = await authRepository.currentUser; // TODO: await repository.currentSubscription...
      final SubscriptionType subscriptionType = SubscriptionType.all_access;

      if (subscriptionType != null) {
        yield HasSubscription((b) => b..subscriptionType = subscriptionType);
      }
      else {
        yield NoSubscription();
      }
    }
    if (event is Subscribe) {
      // TODO: subscription bloc actually subscribes, similar to  LoggedOut() action
      // subscription page bloc validates using subscription api, whether already has subscription, etc
      yield HasSubscription((b) => b..subscriptionType = event.subscriptionType);
    }
    if (event is Unsubscribe) {
      yield NoSubscription();
    }
  }
}
