import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/models/models.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final Logger log = new Logger("user data bloc");

  final SettingsRepository settingsRepository;
  final AuthenticationBloc authenticationBloc;

  StreamSubscription<AuthenticationState> authenticationSubscription;

  ValueObservable<UserData> userDataStream;
  StreamSubscription<UserData> userDataSubscription;

  UserDataBloc({this.settingsRepository, this.authenticationBloc}) {
    assert(settingsRepository != null);
    assert(authenticationBloc != null);

    // TODO: if already authenticated, set settings as uninitialized so that they don't use old user's settings!
    // TODO: do this by checking if currentState is loaded, if so make a wipeSettings event (sets to uninitialized)

    // Subscribing to authentication changes
    authenticationSubscription = authenticationBloc.state.listen((state) {
      // Cancel old user settings subscriptions
      userDataSubscription?.cancel();
      log.fine("cancelled old user data subscription");

      // Start new settings subscriptions
      if (state is AuthAuthenticated) {
        String id = state.user.uid;

        // User data
        userDataStream = settingsRepository.userDataDocument(id);
        userDataSubscription = userDataStream.listen((userData) =>
          dispatch(UserDataArrived((b) => b
            ..userData = userData.toBuilder()
          ))
        );

        log.info("subscribed to $id's user data");
      }
    });
  }

  @override
  UserDataState get initialState => UserDataUninitialized();

  @override
  void dispose() {
    authenticationSubscription?.cancel();
    userDataSubscription?.cancel();
  }

  @override
  Stream<UserDataState> mapEventToState(UserDataState currentState, UserDataEvent event) async* {
    if (event is UserDataArrived) {
      yield UserDataLoaded((b) => b
        ..userData = event.userData.toBuilder()
      );

      log.info("loaded user data");
      log.fine("data: ${event.userData}");
    }
  }
}
