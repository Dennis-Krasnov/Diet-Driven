import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/models/models.dart';

/// Aggregates and manages authentication and settings.
/// [UserDataBloc] shows loading or onboarding until loaded.
class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final Logger _log = new Logger("user data bloc");
  final UserRepository userRepository;

  Observable<UserDataEvent> _userDataEventStream;
  StreamSubscription<UserDataEvent> _userDataEventSubscription;

  UserDataBloc({@required this.userRepository}) {
    assert(userRepository != null);

    _userDataEventStream = userRepository.authStateChangedStream
      .doOnData(_log.fine)
      // Side effect ensures user is authenticated and new user doesn't see userData from previous user
      .doOnData((user) => dispatch(user == null ? OnboardUser() : StartLoadingUserData()))
      // Load user data only if user exists
      .where((user) => user != null)
      .switchMap<UserDataEvent>((user) =>
        CombineLatestStream.combine2(
          userRepository.userDocumentStream(user.uid),
          userRepository.settingsStream(user.uid),
          (UserDocument userDocument, Settings settings) => RemoteUserDataArrived((b) => b
            ..authentication = user
            ..userDocument = userDocument.toBuilder()
            ..settings = settings.toBuilder()
            // TODO: theme
          ),
        )
      )
      .distinct();

    _userDataEventSubscription = _userDataEventStream.listen((userDataEvent) => dispatch(userDataEvent),
      onError: (error, trace) => dispatch(UserDataError((b) => b
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
      // OPTIMIZE: pass builders into events, they're directly inserted into state?
      yield UserDataLoaded((b) => b
        ..authentication = event.authentication
        ..userDocument = event.userDocument.toBuilder()
        ..settings = event.settings.toBuilder()
      );

      _log.info("loaded user data");
      _log.fine("uid: ${event.authentication.uid}");
    }
    if (event is StartLoadingUserData) {
      yield UserDataLoading();
      // TODO: add throttle-based timeout => retry / error
      
      _log.info("loading user data");
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
