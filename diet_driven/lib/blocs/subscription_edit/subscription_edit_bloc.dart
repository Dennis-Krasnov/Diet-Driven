import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diet_driven/blocs/subscription_edit/subscription_edit.dart';

import 'package:diet_driven/repositories/repositories.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

class SubscriptionEditBloc extends Bloc<SubscriptionEditEvent, SubscriptionEditState> {
  final Logger _log = Logger("subscription edit bloc");
  final String userId;
  final UserRepository userRepository;

  SubscriptionEditBloc({@required this.userId, this.userRepository}) : assert(userId != null);

  @override
  SubscriptionEditState get initialState => SubscriptionEditState();

  @override
  Stream<SubscriptionEditState> mapEventToState(SubscriptionEditEvent event) async* {
    if (event is Subscribe) {
      // TODO:
      // subscription page bloc validates using subscription api, whether already has subscription, etc
      // event to fetch official and up to date subscription (which updates global state) - when needed

      try {
//        userRepository.updateDarkMode(userId, event.darkMode);
        event.completer?.complete();
        _log.info("subscribed to ${event.subscriptionType}");
      } on Exception catch(e) {
        event.completer?.completeError(e);
      }
    }
    // TODO: switch subscriptions!
    if (event is Unsubscribe) {
      _log.info("unsubscribed");
    }
  }
}
