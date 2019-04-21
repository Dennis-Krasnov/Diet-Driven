import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/models/models.dart';

/// Aggregates and manages authentication and settings.
/// [UserDataBloc] causes app to show loading or onboarding until loaded.
class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final Logger _log = new Logger("user data bloc");
  final SettingsRepository settingsRepository;
  final UserRepository userRepository;

  Observable<UserData> _userDataStream;
  StreamSubscription<UserData> _userDataSubscription;

  UserDataBloc({@required this.settingsRepository, @required this.userRepository}) {
    assert(settingsRepository != null);
    assert(userRepository != null);

    _userDataStream = userRepository.onAuthStateChangedStream
      // Ensures user is authenticated and new user doesn't see userData from previous user
      .doOnData((user) => dispatch(user == null ? OnboardUser() : LoadUserData()))
      // Load user data only if user exists
      .where((user) => user != null)
      .switchMap<UserData>((user) =>
        CombineLatestStream.combine2(
          // Admin information
          settingsRepository.userDocument(user.uid),
          // User's settings
          settingsRepository.settingsStream(user.uid),
          (UserDocument userDocument, Settings settings) => UserData((b) => b
            ..userId = user.uid
            ..email = user.email
            ..name = user.displayName

            ..currentSubscription = userDocument.currentSubscription

            ..settings = settings
          ),
        )
      )
      .distinct();

    _userDataSubscription = _userDataStream.listen((userData) =>
      dispatch(RemoteUserDataArrived((b) => b..userData = userData.toBuilder())),
      onError: (error, trace) => dispatch(UserDataError((b) => b..error = error.toString())), // TOTEST
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
    if (event is RemoteUserDataArrived) {
      yield UserDataLoaded((b) => b
        ..userData = event.userData.toBuilder()
      );

      _log.info("loaded user data");
      _log.fine("data: ${event.userData}");
    }
    if (event is LoadUserData) {
      yield UserDataLoading();
      // TODO: add throttle-based timeout => error
      
      _log.info("loading user data");
    }
    if (event is OnboardUser) {
      yield UserDataOnboarding();

      _log.info("onboarding user");
    }
    if (event is UserDataError) {
      yield UserDataFailed((b) => b..error = event.error);

      _log.info("user data failed");
    }
  }
}
