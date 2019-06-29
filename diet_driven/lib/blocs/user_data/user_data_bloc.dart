import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/models/models.dart';

/// Aggregates and manages authentication and settings.
/// [UserDataBloc] shows loading or onboarding until loaded.
class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final _log = Logger("user data bloc");
  final UserRepository userRepository;
  final SettingsRepository settingsRepository;

  StreamSubscription<UserDataEvent> _userDataEventSubscription;

  UserDataBloc({@required this.userRepository, @required this.settingsRepository}) {
    assert(userRepository != null);
    assert(settingsRepository != null);

    final Observable<UserDataEvent> userDataEvent$ = userRepository.authStateChangedStream
      .doOnData((user) => _log.fine("USER: $user"))
      // Side effect ensures user is authenticated and new user doesn't see userData from previous user
      .doOnData((user) {
        if (user == null) {
          dispatch(OnboardUser());
        }
      })
      // Load user data only if user exists
      .where((user) => user != null && user.uid != null)
      .switchMap<UserDataEvent>((user) =>
        CombineLatestStream.combine3(
          userRepository.userDocumentStream(user.uid),
          settingsRepository.settingsStream(user.uid),
          // TODO: (List<PurchaseDetails> purchases) from https://github.com/flutter/plugins/tree/master/packages/in_app_purchase
          Observable<SubscriptionType>.just(SubscriptionType.all_access),
          (UserDocument userDocument, Settings settings, SubscriptionType subscriptionType) => RemoteUserDataArrived((b) => b
            ..authentication = user
            ..userDocument = userDocument.toBuilder()
            ..settings = settings.toBuilder()
            ..subscription = subscriptionType
          ),
        )
      )
      .distinct();

    _userDataEventSubscription = userDataEvent$.listen(
      (userDataEvent) => dispatch(userDataEvent),
      onError: (Object error, Object trace) => dispatch(UserDataError((b) => b // FIXME
        ..error = error.toString()
        ..trace = trace.toString()
      )),
    );
  }

  @override
  UserDataState get initialState => UserDataUninitialized();

  @override
  void dispose() {
    _userDataEventSubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<UserDataState> mapEventToState(UserDataEvent event) async* {
    if (event is RemoteUserDataArrived) {
      yield UserDataLoaded((b) => b
        ..authentication = event.authentication
        ..userDocument = event.userDocument.toBuilder()
        ..settings = event.settings.toBuilder()
        ..subscription = event.subscription
      );

      _log.info("loaded user data ${event.authentication.uid}");
    }
    if (event is OnboardUser) {
      yield UserDataUnauthenticated();

      _log.info("onboarding user");
    }
    if (event is UserDataError) {
      yield UserDataFailed((b) => b
        ..error = event.error
        ..trace = event.trace
      );

      _log.info("user data failed");
    }
  }
}
