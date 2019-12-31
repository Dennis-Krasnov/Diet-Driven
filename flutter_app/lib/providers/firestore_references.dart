/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:cloud_firestore/cloud_firestore.dart';

/// Firestore document and collection references.
extension FirestoreReferenceExtensions on Firestore {
  /// Global configuration collection
  CollectionReference get configuration => collection("config");

  /// Global default settings
  DocumentReference get defaultSettings => configuration.document("default_settings");

  /// [userId]'s base path and read-only user document.
  DocumentReference user(String userId) => document("users/$userId");

  /// [userId]'s configuration collection.
  CollectionReference userConfiguration(String userId) => user(userId).collection("config");

  /// [userId]'s settings document.
  DocumentReference userSettings(String userId) => userConfiguration(userId).document("settings");

  /// [userId]'s food diary collection.
  CollectionReference foodDiary(String userId) => user(userId).collection("food_diary");

  /// [userId]'s food diary on [daysSinceEpoch].
  DocumentReference foodDiaryDay(String userId, int daysSinceEpoch) => foodDiary(userId).document("$daysSinceEpoch");
}
