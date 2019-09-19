/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/firestore_paths.dart';
import 'package:diet_driven/providers/firestore_serializer.dart';

/// Data access object for user settings.
class SettingsRepository {
  final Firestore _firestore;

  // Dependency injection
  SettingsRepository({Firestore firestore}) : _firestore = firestore ?? Firestore.instance;

  /// Streams global default [Settings] using `cloud_firestore` library.
  ///
  /// Returns empty stream if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<Settings> defaultSettings$() {
    final docRef = _firestore.document(FirestorePaths.defaultSettings());
    return docRef.snapshots().transform(deserializeDocumentTransform<Settings>());
  }

  /// Streams [userId]'s custom [Settings] using `cloud_firestore` library.
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns empty stream if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<Settings> userSettings$(String userId) {
    assert(userId != null && userId.isNotEmpty);

    final docRef = _firestore.document(FirestorePaths.userSettings(userId));
    return docRef.snapshots().transform(deserializeDocumentTransform<Settings>());
  }

  /// Replaces [userId]'s [Settings] using `cloud_firestore` library.
  /// `Future.sync()` runs future immediately to enable proper exception handling.
  ///
  /// Cloud functions triggers on edit:
  /// -
  ///
  /// Throws [PlatformException] if [userId] is empty.
   Future<void> saveSettings(String userId, Settings settings) async {
    assert(userId != null && userId.isNotEmpty);
    assert(settings != null);

    final docRef = _firestore.document(FirestorePaths.userSettings(userId));
    return docRef.setData(serializeDocument<Settings>(settings), merge: false);
  }
}

