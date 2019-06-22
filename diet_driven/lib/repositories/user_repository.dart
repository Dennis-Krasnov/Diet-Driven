import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:merge_map/merge_map.dart';

import 'package:diet_driven/providers/providers.dart';
import 'package:diet_driven/models/models.dart';

/// Data access object for authentication, settings, and configuration.
class UserRepository {
  final Logger log = Logger("user repository");
  final RemoteConfigProvider _remoteConfigProvider = RemoteConfigProvider();
  final FirestoreProvider _firestoreProvider = FirestoreProvider();

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
    final RemoteConfig config = await _remoteConfigProvider.fetchRemoteConfig();

    // Intentionally throws on invalid Firebase Remote Config
    final RemoteConfiguration configSettings = RemoteConfiguration((b) => b
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
    return Observable<Settings>(
      CombineLatestStream.combine2(
        // Combine latest user settings and default settings
        _firestoreProvider.settingsStream(userId),
        _firestoreProvider.defaultSettings(),
        (Settings settings, Settings defaultSettings) {
          // Serialize settings into JSON
          final Map<String, dynamic> jsonSettings = jsonSerializers.serialize(settings);
          final Map<String, dynamic> jsonDefaultSettings = jsonSerializers.serialize(defaultSettings);

          // Deep merge JSON using merge_map library
          final Map mergedJsonSettings = mergeMap<String, dynamic>([jsonDefaultSettings, jsonSettings]);

          // Deserialize user's settings
          return jsonSerializers.deserialize(mergedJsonSettings);
        }
      )
    );

    // TOTEST: one stream returns Observable<Settings>.empty() - should time out
    // TOTEST: Observable<Settings>.just(null), for my settings should return default settings!
  }


  /// Replaces user's [Settings].
  ///
  /// Throws [PlatformException] if [userId] is empty.
  Future<void> replaceSettings(String userId, Settings settings) {
    assert(userId != null && userId.isNotEmpty);
    assert(settings != null);

    return _firestoreProvider.replaceSettings(userId, settings);
  }

  /// Updates user's dark mode setting.
  ///
  /// Throws [PlatformException] if [userId] is empty.
  Future<void> updateDarkMode(String userId, bool darkMode) async {
    assert(userId != null && userId.isNotEmpty);
    assert(darkMode != null);

    // Build user's settings (not merged with default settings)
    final Settings settings = await _firestoreProvider.settingsStream(userId).first;
    final SettingsBuilder settingsBuilder = settings.toBuilder();

    settingsBuilder.themeSettings = settingsBuilder.themeSettings.rebuild((b) => b
      ..darkMode = darkMode
    );

    _firestoreProvider.replaceSettings(userId, settingsBuilder.build());
  }
}
