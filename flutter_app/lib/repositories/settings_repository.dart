/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/firestore_references.dart';
import 'package:diet_driven/providers/firestore_serializer.dart';

/// Data access object for user settings using `cloud_firestore` library.
class SettingsRepository {
  final Firestore _firestore;

  // Dependency injection
  SettingsRepository({Firestore firestore}) : _firestore = firestore ?? Firestore.instance;

  /// Streams global default [Settings].
  ///
  /// Returns empty stream if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<Settings> defaultSettings$() {
    return _firestore.defaultSettings
      .deserialize<Settings>();
  }

  /// Streams [userId]'s custom [Settings].
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns empty stream if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<Settings> userSettings$(String userId) {
    assert(userId != null && userId.isNotEmpty);

    return _firestore.userSettings(userId)
      .deserialize<Settings>();
  }

  /// Replaces [userId]'s [Settings].
  /// `Future.sync()` runs future immediately to enable proper exception handling.
  ///
  /// Cloud functions triggers on edit:
  /// -
  ///
  /// Throws [PlatformException] if [userId] is empty.
   Future<void> saveSettings(String userId, Settings settings) async {
    assert(userId != null && userId.isNotEmpty);
    assert(settings != null);

    return _firestore.userSettings(userId)
      .setSerialized(settings, merge: false);
  }
}
