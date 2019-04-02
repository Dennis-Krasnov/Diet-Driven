import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/models/models.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final Logger _log = new Logger("user data bloc");

  // TODO: make these private, or allow to access parent's repos and blocs? (to avoid passing down everything)
  final SettingsRepository settingsRepository;
  final AuthenticationBloc authenticationBloc;

//  StreamSubscription<AuthenticationState> authenticationSubscription;

  Observable<UserData> _userDataStream;
  StreamSubscription<UserData> _userDataSubscription;

  UserDataBloc({this.settingsRepository, this.authenticationBloc}) {
    assert(settingsRepository != null);
    assert(authenticationBloc != null);

    _userDataStream = Observable<AuthenticationState>(authenticationBloc.state)
      .where((authState) => authState is AuthAuthenticated)
      .map<String>((authState) => (authState as AuthAuthenticated).user.uid) // TODO: save important bits of user, not just uid???
      .distinct()
      .switchMap<UserData>((userId) => settingsRepository.userDataDocument(userId)
        .map((userData) => userData.rebuild((b) => b..userId = userId)) // FIXME: had to make userId nullable
      )
      .distinct();

    _userDataSubscription = _userDataStream.listen((userData) =>
      dispatch(RemoteUserDataArrived((b) => b..userData = userData.toBuilder())),
      onError: (error, trace) => dispatch(UserDataError((b) => b..error = error.toString())),
      onDone: () => dispatch(WipeUserData())
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
    if (event is UserDataError) {
      yield UserDataFailed((b) => b..error = event.error);

      _log.info("user data failed");
    }
    if (event is RemoteUserDataArrived) {
      assert(event.userData != null);

      yield UserDataLoaded((b) => b
        ..userData = event.userData.toBuilder()
      );

      _log.info("loaded user data");
      _log.fine("data: ${event.userData}");
    }
  }
}
