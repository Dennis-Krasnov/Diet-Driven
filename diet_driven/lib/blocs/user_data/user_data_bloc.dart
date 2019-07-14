import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

/// Aggregates and manages authentication and settings.
/// App shows splash page until [UserDataBloc] is loaded.
class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final UserRepository userRepository;
  final SettingsRepository settingsRepository;

  StreamSubscription<UserDataEvent> _userDataEventSubscription;

  UserDataBloc({@required this.userRepository, @required this.settingsRepository})
    : assert(userRepository != null), assert(settingsRepository != null);

  @override
  UserDataState get initialState => UserDataUninitialized();

  @override
  void dispose() {
    _userDataEventSubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<UserDataState> mapEventToState(UserDataEvent event) async* {
    if (event is InitUserData) {
      assert(currentState is UserDataUninitialized);

      final auth$ = Observable<FirebaseUser>(userRepository.authStateChanged$);

      final onboard$ = auth$
        .where((user) => user == null)
        // Onboarding event
        .mapTo<UserDataEvent>(OnboardUser());

      final dataArrival$ = auth$
        .where((user) => user != null)
        .switchMap<UserDataEvent>((user) => CombineLatestStream.combine3(
          userRepository.userDocument$(user.uid),
          settingsRepository.settings$(user.uid),
          Observable<SubscriptionType>.just(SubscriptionType.all_access), // TODO: (List<PurchaseDetails> purchases) from https://github.com/flutter/plugins/tree/master/packages/in_app_purchase
          // Success event
          (UserDocument userDocument, Settings settings, SubscriptionType subscriptionType) => RemoteUserDataArrived((b) => b
            ..authentication = user
            ..userDocument = userDocument.toBuilder()
            ..settings = settings.toBuilder()
            ..subscription = subscriptionType
          ),
        ))
        .distinct()
        // Failure event
        .transform(StreamTransformer<UserDataEvent, UserDataEvent>.fromHandlers(
          handleError: (Object error, StackTrace stacktrace, EventSink<UserDataEvent> sink) =>
            sink.add(UserDataError((b) => b
              ..error = error
              ..stacktrace = stacktrace
            ))
        ));

      // Maintain single instance of stream subscription
      _userDataEventSubscription ??= MergeStream<UserDataEvent>([
        onboard$,
        dataArrival$
      ]).listen(dispatch);
    }

    if (event is RemoteUserDataArrived) {
      yield UserDataLoaded((b) => b
        ..authentication = event.authentication
        ..userDocument = event.userDocument.toBuilder()
        ..settings = event.settings.toBuilder()
        ..subscription = event.subscription
      );

      LoggingBloc().info("User data loaded");
    }

    if (event is OnboardUser) {
      yield UserDataUnauthenticated();

      LoggingBloc().info("Onboarded user");
    }

    if (event is UserDataError) {
      yield UserDataFailed((b) => b
        ..error = event.error
        ..stacktrace = event.stacktrace
      );

      LoggingBloc().unexpectedError("User data failed", event.error, event.stacktrace);
    }
  }
}
