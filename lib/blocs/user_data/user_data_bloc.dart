import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/models/models.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final Logger _log = new Logger("user data bloc");
  final SettingsRepository settingsRepository;
  final AuthenticationBloc authenticationBloc;

  Observable<UserData> _userDataStream;
  StreamSubscription<UserData> _userDataSubscription;

  UserDataBloc({this.settingsRepository, this.authenticationBloc}) {
    assert(settingsRepository != null);
    assert(authenticationBloc != null);

    _userDataStream = Observable<AuthenticationState>(authenticationBloc.state)
      .where((authState) => authState is AuthAuthenticated)
      .map<String>((authState) => (authState as AuthAuthenticated).user.uid)
      .distinct()
      // Ensure user doesn't see data from previous user => shows loading screen
      .doOnData((userId) { // TOTEST user switching wipes data
        if (currentState is SettingsLoaded) {
          dispatch(WipeUserData());
        }
      })
      .switchMap<UserData>((userId) =>
        settingsRepository.userDataDocument(userId)
        // Adding authentication data into user data
        .map((userData) => userData.rebuild((b) => b
          ..userId = userId
          // TODO: other fields through authBloc.currentState.field
        ))
      )
      .distinct();

    _userDataSubscription = _userDataStream.listen((userData) =>
      dispatch(RemoteUserDataArrived((b) => b..userData = userData.toBuilder())),
      onError: (error, trace) => dispatch(UserDataError((b) => b..error = error.toString())), // TOTEST
      onDone: () => dispatch(WipeUserData()) // TOTEST
    );
  }

  @override
  UserDataState get initialState => UserDataUninitialized();

  @override
  void dispose() {
    _userDataSubscription?.cancel();
    super.dispose();
  }

  @override
  Stream<UserDataState> mapEventToState(UserDataEvent event) async* {
    if (event is WipeUserData) { // TODO: create similar mapping for settings!
      assert (currentState is UserDataLoaded);
      if (currentState is UserDataLoaded) {
        yield UserDataUninitialized();
      }
    }
    if (event is UserDataError) {
      yield UserDataFailed((b) => b..error = event.error);

      _log.info("user data failed");
    }
    if (event is RemoteUserDataArrived) {
      yield UserDataLoaded((b) => b
        ..userData = event.userData.toBuilder()
      );

      _log.info("loaded user data");
      _log.fine("data: ${event.userData}");
    }
  }
}
