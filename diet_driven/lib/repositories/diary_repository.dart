import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/providers.dart';

/// Data access object for food and exercise diaries.
class DiaryRepository {
  final FirestoreProvider _firestoreProvider = FirestoreProvider();

  /// Streams [userId]'s [FoodDiaryDay] on [daysSinceEpoch].
  ///
  /// Returns empty stream if Firestore document doesn't exist.
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<FoodDiaryDay> foodDiaryDay$(String userId, int daysSinceEpoch) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);

    return _firestoreProvider.foodDiaryDay$(userId, daysSinceEpoch);
  }

  /// Streams [userId]'s all-time [FoodDiaryDay]s.
  ///
  /// Returns empty stream if Firestore documents don't exist.
  /// Throws [PlatformException] if [userId] is empty.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<BuiltList<FoodDiaryDay>> allTimeFoodDiary$(String userId) {
    assert(userId != null && userId.isNotEmpty);

    return _firestoreProvider.allTimeFoodDiary$(userId);
  }

  /// Replaces [userId]'s [FoodDiaryDay] on its respective day.
  ///
  /// Throws [PlatformException] if [userId] is empty.
  Future<void> replaceFoodDiaryDay(String userId, FoodDiaryDay foodDiaryDay) {
    assert(userId != null && userId.isNotEmpty);
    assert(foodDiaryDay != null);
    assert(foodDiaryDay.date >= 0);

    return _firestoreProvider.replaceFoodDiaryDay(userId, foodDiaryDay);
  }

  /// Deletes [userId]'s [FoodDiaryDay] on [daysSinceEpoch].
  ///
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  /// Throws [Exception] if food diary day document doesn't exist.
  Future<void> deleteFoodDiaryDay(String userId, int daysSinceEpoch) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);

    return _firestoreProvider.deleteFoodDiaryDay(userId, daysSinceEpoch);
  }
}
