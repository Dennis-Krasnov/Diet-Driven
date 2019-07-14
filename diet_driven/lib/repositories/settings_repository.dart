import 'package:diet_driven/models/models.dart';
import 'package:merge_map/merge_map.dart';

import 'package:diet_driven/providers/providers.dart';
import 'package:rxdart/rxdart.dart';

/// Data access object for user settings.
class SettingsRepository {
  final _firestoreProvider = FirestoreProvider();

  /// Streams [userId]'s custom [Settings] combined with default [Settings] field-by-field.
  /// Default settings are used unless explicitly overwritten by user's custom settings.
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns empty stream if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<Settings> settings$(String userId) {
    assert(userId != null && userId.isNotEmpty);

    return CombineLatestStream.combine2(
      // Combine latest user's custom settings and default settings
      _firestoreProvider.settings$(userId),
      _firestoreProvider.defaultSettings$(),
      (Settings settings, Settings defaultSettings) {
        // Serialize settings into JSON
        final jsonSettings = jsonSerializers.serialize(settings);
        final jsonDefaultSettings = jsonSerializers.serialize(defaultSettings);

        // Deep merge JSON using `merge_map` library
        final mergedJsonSettings = mergeMap<String, dynamic>([jsonDefaultSettings, jsonSettings]);

        // Deserialize settings
        return jsonSerializers.deserialize(mergedJsonSettings);
      }
    );
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

    // Build user's custom settings
    final settings = await _firestoreProvider.settings$(userId).first;
    final settingsBuilder = settings.toBuilder();

    settingsBuilder.themeSettings.update((b) => b
      ..darkMode = darkMode
    );

    return _firestoreProvider.replaceSettings(userId, settingsBuilder.build());
  }

}
