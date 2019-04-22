import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/providers.dart';
import 'package:rxdart/rxdart.dart';

/// Data access object for food and exercise diaries.
class DiaryRepository {
  final FirestoreProvider _firestoreProvider = FirestoreProvider();

  /// Saves entire [FoodDiaryDay].
  /// Overwrites/merges data with previous document.
  ///
  /// Cloud function triggers on create:
  /// - Adds date based on document id, metadata, default values to day.
  /// - Calculates aggregate nutritional information for day.
  /// - Calculates aggregate global statistics.
  ///
  /// Cloud functions triggers on edit:
  /// - If [dayCompleted], calculates score for the day, saves in document, saves in aggregate score.
  /// - If [foodRecords] is empty, deletes document.
  /// - Calculates aggregate global statistics.
  ///
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] (field of day) is empty.
  Future<void> saveDiaryDay(String userId, FoodDiaryDay foodDiaryDay) {
    assert(userId != null && userId.isNotEmpty);
    assert(foodDiaryDay != null);

    return _firestoreProvider.setFoodDiaryDay(userId, foodDiaryDay);
  }

  /// Deletes entire [FoodDiaryDay].
  ///
  /// Cloud functions triggers on delete:
  /// - If [dayCompleted], calculates score for the day, saves in aggregate score.
  /// - Calculates aggregate global statistics.
  ///
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  /// Throws [Exception] if food diary day document doesn't exist.
  Future<void> deleteDiaryDay(String userId, int daysSinceEpoch) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);

    return _firestoreProvider.deleteFoodDiaryDay(userId, daysSinceEpoch);
  }

  /// Fetches [Observable] of [userId]'s [FoodDiaryDay] at [daysSinceEpoch].
  /// 'streamDiaryDay(userId, daysSinceEpoch)` is called for every diary day from [DiaryBloc].
  ///
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  /// Returns [null] if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Observable<FoodDiaryDay> streamDiaryDay(String userId, int daysSinceEpoch) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);

    return _firestoreProvider.streamFoodDiaryDay(userId, daysSinceEpoch);
  }

  /// Fetches [Observable] of [userId]'s all-time [FoodDiaryDay].
  /// 'streamAllDiaryDays(userId)` is called for every user from [ReportBloc]. // TODO
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns [null] if no Firestore documents exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Observable<BuiltList<FoodDiaryDay>> streamAllDiaryDays(String userId) {
    assert(userId != null && userId.isNotEmpty);

    return _firestoreProvider.streamAllFoodDiary(userId);
  }

  /// Adds [FoodRecord] to [FoodDiaryDay].
  /// Adding a duplicate [FoodRecord] has no effect.
  ///
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  Future<void> addFoodRecord(String userId, int daysSinceEpoch, FoodRecord foodRecord) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);
    assert(foodRecord != null);

    return _firestoreProvider.addFoodRecord(userId, daysSinceEpoch, foodRecord);
  }

  /// Deletes [FoodRecord] from [FoodDiaryDay].
  /// Deleting a non-existent [FoodRecord] has no effect.
  ///
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  /// Throws [Exception] if food diary day document doesn't exist.
  Future<void> deleteFoodRecord(String userId, int daysSinceEpoch, FoodRecord foodRecord) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);
    assert(foodRecord != null);

    return _firestoreProvider.deleteFoodRecord(userId, daysSinceEpoch, foodRecord);
  }

  /// Edits [FoodRecord] in [FoodDiaryDay].
  /// Deleting a non-existent [FoodRecord] has no effect, adding a duplicate [FoodRecord] has no effect.
  ///
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  /// Throws [Exception] if food diary day document doesn't exist.
  Future<void> editFoodRecord(String userId, int daysSinceEpoch, FoodRecord oldRecord, FoodRecord newRecord) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);
    assert(oldRecord != newRecord);

    return _firestoreProvider.editFoodRecord(userId, daysSinceEpoch, oldRecord, newRecord);
  }
}
