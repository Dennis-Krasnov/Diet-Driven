import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/providers/providers.dart';
import 'package:diet_driven/models/models.dart';

/// Data access object for authentication, settings, and configuration.
class UserRepository {
  final Logger log = new Logger("user repository");
  final RemoteConfigProvider _remoteConfigProvider = RemoteConfigProvider();
  final FirestoreProvider _firestoreProvider = FirestoreProvider();
  // TODO: Connectivity().onConnectivityChanged

  /// Fetches [Observable] of live [FirebaseUser] authentication status.
  /// 'authStateChangedStream` is called from [UserDataBloc].
  ///
  /// Returns [null] if unauthenticated.authentication, settings, and configuration
  /// Always returns an initial value upon subscribing.
  Observable<FirebaseUser> get authStateChangedStream => Observable(FirebaseAuth.instance.onAuthStateChanged);

  /// Signs in anonymously with Firebase Authentication.
  /// TODO: where called from
  ///
  /// Returns authenticated [FirebaseUser].
  /// Throws [AuthException] or [PlatformException] if unsuccessful.
  Future<FirebaseUser> signInAnonymously() => FirebaseAuth.instance.signInAnonymously();

  /// Signs in with email and password with Firebase Authentication.
  /// TODO: where called from
  ///
  /// Returns authenticated [FirebaseUser].
  /// Throws [AuthException] or [PlatformException] if unsuccessful.
  Future<FirebaseUser> signInWithEmail(String email, String password) =>
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

  /// Creates account with email and password with Firebase Authentication.
  /// TODO: where called from
  ///
  /// Returns authenticated [FirebaseUser].
  /// Throws [AuthException] or [PlatformException] if unsuccessful.
  Future<void> createAccountWithEmail(String email, String password) =>
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

  /// Signs out of Firebase Authentication session.
  /// TODO: where called from
  Future<void> signOut() => FirebaseAuth.instance.signOut();

  /// Fetches [RemoteConfiguration].
  /// `fetchRemoteConfig()` is called whenever [FetchConfiguration] is dispatched from [ConfigurationBloc].
  ///
  /// Throws [FetchThrottledException] or [Exception] if failed to fetch live Firebase Remote Config data.
  /// Throws [BuiltValueNullFieldError] if remote config is missing parameters.
  Future<RemoteConfiguration> fetchRemoteConfig() async {
    RemoteConfig config = await _remoteConfigProvider.fetchRemoteConfig();

    // Intentionally throws if Firebase Remote Config is invalid
    var configSettings = RemoteConfiguration((b) => b
      ..liveConfiguration = true
      ..bonus = config.getInt("bonus")
    );

    log.info("successfully loaded config: $configSettings");
    return configSettings;
  }

  /// Fetches [Observable] of [userId]'s [UserDocument].
  /// 'userDocumentStream(userId)` is called for every user from [UserDataBloc].
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns [null] if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Observable<UserDocument> userDocumentStream(String userId) {
    assert(userId != null && userId.isNotEmpty);

    return _firestoreProvider.userDocument(userId);
  }

  /// Fetches [Observable] of [userId]'s [Settings].
  /// 'settingsStream(userId)` is called for every user from [UserDataBloc].
  ///
  /// Default user settings are used unless explicitly overwritten the user's settings document.
  /// The latest from both are combined into a single [Settings] stream.
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns [null] if both Firestore documents doesn't exist.
  Observable<Settings> settingsStream(String userId) {
    Observable<Settings> defaultSettingsStream = _firestoreProvider.defaultSettings();

    return Observable<Settings>(
      CombineLatestStream.combine2(
        // Combine user settings with latest default settings
        _firestoreProvider.settingsStream(userId),
        defaultSettingsStream,
        (Settings settings, Settings defaultSettings) => Settings((b) => b
          ..navigationSettings = NavigationSettings((b) => b
            ..defaultPage = settings.navigationSettings?.defaultPage ?? defaultSettings.navigationSettings.defaultPage
            ..bottomNavigationPages = settings.navigationSettings.bottomNavigationPages?.toBuilder() ?? defaultSettings.navigationSettings.bottomNavigationPages.toBuilder()
          ).toBuilder()
        )
      )
    );

    // TODO: fork built value and a create a generated 'mergeInto'/'T replaceNullFieldsWith(T)' method
    // that copies values from src to dest (where null), can also define it as a custom operator.
    // This would remove the need for manual 'merging' repetition.
  }
}
