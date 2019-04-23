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

  Observable<UserData> _userDataStream;
  StreamSubscription<UserData> _userDataSubscription;

  UserDataBloc({@required this.userRepository}) {
    assert(userRepository != null);

    // OPTIMIZE: alternative for food diary and user data combine:
    // combine into a stream of RemoteDiaryDayArrived, listen and dispatch it directly
    // this way don't need to manually combine data, can store UserDocument, Auth, settings separately under Loaded state
    // TODO: change user data bloc as well!!!!!!
    // it becomes clear what's being stored in state!
    // no huge combination data classes, (especially good here where I would need diet - illogical combination)
    // would look like: stream.listen(dispatch) // stream is of type event!!!!

    // user data: separate fields for userDocument, auth (store full auth object), and settings
    // event and loaded state will copy all these over!

    _userDataStream = userRepository.authStateChangedStream
      .doOnData(_log.fine)
      // Side effect ensures user is authenticated and new user doesn't see userData from previous user
      .doOnData((user) => dispatch(user == null ? OnboardUser() : StartLoadingUserData()))
      // Load user data only if user exists
      .where((user) => user != null)
      .switchMap<UserData>((user) =>
        CombineLatestStream.combine2(
          userRepository.userDocumentStream(user.uid),
          userRepository.settingsStream(user.uid),
          (UserDocument userDocument, Settings settings) => UserData((b) => b
            // Authentication information
            ..userId = user.uid
            ..email = user.email
            ..name = user.displayName

            // Admin information
            ..currentSubscription = userDocument.currentSubscription

            // User's settings
            ..settings = settings
          ),
        )
      )
      .distinct();

    _userDataSubscription = _userDataStream.listen((userData) =>
      dispatch(RemoteUserDataArrived((b) => b..userData = userData.toBuilder())),
      onError: (error, trace) => dispatch(UserDataError((b) => b..error = error.toString())),
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
      yield UserDataFailed((b) => b..error = event.error);

      _log.info("user data failed");
    }
  }
}
