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
  /// Streams global default [Settings] using `cloud_firestore` library.
  ///
  /// Returns empty stream if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<Settings> defaultSettings$() {
    final docRef = Firestore.instance.document(FirestorePaths.defaultSettings());
    return docRef.snapshots().transform(FirestoreSerializer<Settings>().deserializeDocumentTransform());
  }

  /// Streams [userId]'s custom [Settings] using `cloud_firestore` library.
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns empty stream if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<Settings> userSettings$(String userId) {
    assert(userId != null && userId.isNotEmpty);

    final docRef = Firestore.instance.document(FirestorePaths.userSettings(userId));
    return docRef.snapshots().transform(FirestoreSerializer<Settings>().deserializeDocumentTransform());
  }

  /// Replaces [userId]'s [Settings] using `cloud_firestore` library.
  ///
  /// Cloud functions triggers on edit:
  /// -
  ///
  /// Throws [PlatformException] if [userId] is empty.
  // Future<void> replaceSettings(String userId, Settings settings) => Future.sync(() async {
  /// `Future.sync()` runs future immediately to enable proper exception handling.
  Future<void> replaceSettings(String userId, Settings settings) {
    assert(userId != null && userId.isNotEmpty);
    assert(settings != null);

    final docRef = Firestore.instance.document(FirestorePaths.userSettings(userId));
    return docRef.setData(FirestoreSerializer<Settings>().serializeDocument(settings), merge: false); // FIXME: should be merge: true maybe?
  }

}

