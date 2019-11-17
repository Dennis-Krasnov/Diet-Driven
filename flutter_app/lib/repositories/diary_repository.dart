/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/firestore_paths.dart';
import 'package:diet_driven/providers/firestore_serializer.dart';

/// Data access object for food and exercise diaries using `cloud_firestore` library.
class DiaryRepository {
  final Firestore _firestore;

  // Dependency injection
  DiaryRepository({Firestore firestore}) : _firestore = firestore ?? Firestore.instance;

  ///
  Future<bool> foodDiaryDayExists(String userId, int daysSinceEpoch) async {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch != null && daysSinceEpoch >= 0);

    final docRef = _firestore.document(FirestorePaths.foodDiaryDay(userId, daysSinceEpoch));
    final documentSnapshot = await docRef.get().asStream().first;
    return documentSnapshot.data != null;
  }

  /// Streams [userId]'s [FoodDiaryDay] on [daysSinceEpoch].
  ///
  /// Doesn't emit values when document is deleted.
  /// Returns empty stream if Firestore document doesn't exist.
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<FoodDiaryDay> foodDiaryDay$(String userId, int daysSinceEpoch) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch != null && daysSinceEpoch >= 0);

    final docRef = _firestore.document(FirestorePaths.foodDiaryDay(userId, daysSinceEpoch));
    return docRef.snapshots().transform(deserializeDocumentTransform<FoodDiaryDay>());
  }

  /// Whether [userId] has [FoodDiaryDay]s.
  /// Optional [startAt] date specifies when to start including days, defaults to 0.
  ///
  /// Throws [PlatformException] if [userId] is empty.
  Future<bool> allTimeFoodDiaryExists(String userId, {int startAt = 0}) async {
    assert(userId != null && userId.isNotEmpty);

    final colRef = _firestore.collection(FirestorePaths.foodDiary(userId))
      .where("date", isGreaterThanOrEqualTo: startAt)
      // Only require a single document to find out whether documents exist
      .limit(1);
    final querySnapshot = await colRef.getDocuments();
    return querySnapshot.documents.isNotEmpty;
  }

  /// Streams [userId]'s all-time [FoodDiaryDay]s.
  /// Optional [startAt] date specifies when to start including days, defaults to 0.
  ///
  /// Returns empty stream if Firestore documents don't exist.
  /// Throws [PlatformException] if [userId] is empty.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<BuiltList<FoodDiaryDay>> allTimeFoodDiary$(String userId, {int startAt = 0}) {
    assert(userId != null && userId.isNotEmpty);

    final colRef = _firestore.collection(FirestorePaths.foodDiary(userId))
      .where("date", isGreaterThanOrEqualTo: startAt);
    return colRef.snapshots().transform(deserializeCollectionTransform<FoodDiaryDay>());
  }

  /// Replaces [userId]'s [FoodDiaryDay] on its respective day.
  ///
  /// Cloud functions triggers on edit:
  /// -
  ///
  /// Throws [PlatformException] if [userId] is empty.
  Future<void> saveFoodDiaryDay(String userId, FoodDiaryDay foodDiaryDay) async {
    assert(userId != null && userId.isNotEmpty);
    assert(foodDiaryDay != null);

    final docRef = _firestore.document(FirestorePaths.foodDiaryDay(userId, foodDiaryDay.date));
    return docRef.setData(serializeDocument(foodDiaryDay), merge: false);
  }

  /// Deletes [userId]'s [FoodDiaryDay] on [daysSinceEpoch].
  /// `Future.sync()` runs future immediately to enable proper exception handling.
  ///
  /// Cloud functions triggers on delete:
  /// - If [dayCompleted], calculates score for the day, saves in aggregate score.
  /// - Calculates aggregate global statistics.
  ///
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  /// Throws [Exception] if food diary day document doesn't exist.
  Future<void> deleteFoodDiaryDay(String userId, int daysSinceEpoch) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch != null && daysSinceEpoch >= 0);

    final docRef = _firestore.document(FirestorePaths.foodDiaryDay(userId, daysSinceEpoch));
    return docRef.delete();
  }

  /// Streams [userId]'s all-time [Diet]s.
  ///
  /// Returns empty stream if Firestore documents don't exist.
  /// Throws [PlatformException] if [userId] is empty.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<BuiltList<Diet>> allTimeDiet$(String userId) {
    assert(userId != null && userId.isNotEmpty);

    return Stream.fromFuture(Future.value(BuiltList(<Diet>[ // FIXME
      Diet((b) => b
        ..idealNutrients = NutrientMap.fromMacros(64, 23, 235)
        ..startDate = 0
      ),
      Diet((b) => b
        ..idealNutrients = NutrientMap.fromMacros(123, 42, 397)
        ..startDate = 18128
      ),
    ])));
  }
}
