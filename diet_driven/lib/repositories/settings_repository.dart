import 'package:diet_driven/models/models.dart';
import 'package:merge_map/merge_map.dart';

import 'package:diet_driven/providers/providers.dart';
import 'package:rxdart/rxdart.dart';

/// Data access object for user settings.
class SettingsRepository {
  final _firestoreProvider = FirestoreProvider();

  /// Fetches [Observable] of [userId]'s [Settings].
  /// 'settingsStream(userId)` is called for every user from [UserDataBloc].
  ///
  /// Default user settings are used unless explicitly overwritten the user's settings document.
  /// The latest from both are combined into a single [Settings] stream.
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns [null] if both Firestore documents doesn't exist.
  Observable<Settings> settingsStream(String userId) {
    assert(userId != null && userId.isNotEmpty);

    return Observable<Settings>(CombineLatestStream.combine2(
      // Combine latest user settings and default settings
      _firestoreProvider.settingsStream(userId),
      _firestoreProvider.defaultSettings(),
      (Settings settings, Settings defaultSettings) {
        // Serialize settings into JSON
        final jsonSettings = jsonSerializers.serialize(settings);
        final jsonDefaultSettings = jsonSerializers.serialize(defaultSettings);

        // Deep merge JSON using `merge_map` library
        final mergedJsonSettings = mergeMap<String, dynamic>([jsonDefaultSettings, jsonSettings]);

        // Deserialize user's settings
        return jsonSerializers.deserialize(mergedJsonSettings);
      }
    ));

    // TOTEST: one stream returns Observable<Settings>.empty() - should time out
    // TOTEST: Observable<Settings>.just(null), for my settings should return default settings!
  }

  /// Replaces [userId]'s [Settings].
  ///
  /// Throws [PlatformException] if [userId] is empty.
  Future<void> replaceSettings(String userId, Settings settings) {
    assert(userId != null && userId.isNotEmpty);
    assert(settings != null);

    return _firestoreProvider.replaceSettings(userId, settings);
  }

  /// Updates [userId]'s [darkMode] setting.
  ///
  /// Throws [PlatformException] if [userId] is empty.
  Future<void> updateDarkMode(String userId, bool darkMode) async {
    assert(userId != null && userId.isNotEmpty);
    assert(darkMode != null);

    // Build user's settings (not merged with global defaults)
    final settings = await _firestoreProvider.settingsStream(userId).first;
    final settingsBuilder = settings.toBuilder();

    settingsBuilder.themeSettings.update((b) => b // TODO: use this nested update pattern everywhere!
      ..darkMode = darkMode
    );

    return _firestoreProvider.replaceSettings(userId, settingsBuilder.build());
  }
}
