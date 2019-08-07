import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/firestore_paths.dart';
import 'package:diet_driven/providers/firestore_serializer.dart';

/// Data access object for food and exercise diaries.
class DiaryRepository {
  /// Streams [userId]'s [FoodDiaryDay] on [daysSinceEpoch] using `cloud_firestore` library.
  ///
  /// Returns empty stream if Firestore document doesn't exist.
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<FoodDiaryDay> foodDiaryDay$(String userId, int daysSinceEpoch) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);

    final docRef = Firestore.instance.document(FirestorePaths.foodDiaryDay(userId, daysSinceEpoch));
    return docRef.snapshots().transform(FirestoreSerializer<FoodDiaryDay>().deserializeDocumentTransform());
  }

  /// Streams [userId]'s all-time [FoodDiaryDay]s using `cloud_firestore` library.
  ///
  /// Returns empty stream if Firestore documents don't exist.
  /// Throws [PlatformException] if [userId] is empty.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<BuiltList<FoodDiaryDay>> allTimeFoodDiary$(String userId) {
    assert(userId != null && userId.isNotEmpty);

    final colRef = Firestore.instance.collection(FirestorePaths.foodDiary(userId));
    return colRef.snapshots().transform(FirestoreSerializer<FoodDiaryDay>().deserializeCollectionTransform());
  }

  /// Replaces [userId]'s [FoodDiaryDay] on its respective day using `cloud_firestore` library.
  ///
  /// Cloud functions triggers on edit:
  /// -
  ///
  /// Throws [PlatformException] if [userId] is empty.
  Future<void> replaceFoodDiaryDay(String userId, FoodDiaryDay foodDiaryDay) {
    assert(userId != null && userId.isNotEmpty);
    assert(foodDiaryDay != null);
    assert(foodDiaryDay.date >= 0);

    final docRef = Firestore.instance.document(FirestorePaths.foodDiaryDay(userId, foodDiaryDay.date));
    return docRef.setData(FirestoreSerializer<FoodDiaryDay>().serializeDocument(foodDiaryDay), merge: false);
  }

  /// Deletes [userId]'s [FoodDiaryDay] on [daysSinceEpoch] using `cloud_firestore` library.
  ///
  /// Cloud functions triggers on delete:
  /// - If [dayCompleted], calculates score for the day, saves in aggregate score.
  /// - Calculates aggregate global statistics.
  ///
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  /// Throws [Exception] if food diary day document doesn't exist.
  Future<void> deleteFoodDiaryDay(String userId, int daysSinceEpoch) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);

    final docRef = Firestore.instance.document(FirestorePaths.foodDiaryDay(userId, daysSinceEpoch));
    return docRef.delete();
  }

  /// Streams [userId]'s all-time [Diet]s using `cloud_firestore` library.
  ///
  /// Returns empty stream if Firestore documents don't exist.
  /// Throws [PlatformException] if [userId] is empty.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<BuiltList<Diet>> allTimeDiet$(String userId) {
    assert(userId != null && userId.isNotEmpty);

    return Stream.fromFuture(Future.value(BuiltList(<Diet>[ // FIXME
      Diet((b) => b..calories = 2520),
      Diet((b) => b..calories = 2125),
    ])));
//    return _firestoreProvider.allTimeFoodDiary$(userId); // TODO
  }
}
