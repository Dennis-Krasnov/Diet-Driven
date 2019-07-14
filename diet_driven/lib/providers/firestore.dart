import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/providers/firestore_serializer.dart';

import 'package:diet_driven/models/food_diary_day.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/firestore_paths.dart';

/// Firebase Firestore provider using `cloud_firestore` library.
class FirestoreProvider {
  final _firestore = Firestore.instance;

  ///   ########  #######   #######  ########        ########  ####    ###    ########  ##    ##
  ///   ##       ##     ## ##     ## ##     ##       ##     ##  ##    ## ##   ##     ##  ##  ##
  ///   ##       ##     ## ##     ## ##     ##       ##     ##  ##   ##   ##  ##     ##   ####
  ///   ######   ##     ## ##     ## ##     ##       ##     ##  ##  ##     ## ########     ##
  ///   ##       ##     ## ##     ## ##     ##       ##     ##  ##  ######### ##   ##      ##
  ///   ##       ##     ## ##     ## ##     ##       ##     ##  ##  ##     ## ##    ##     ##
  ///   ##        #######   #######  ########        ########  #### ##     ## ##     ##    ##

  /// Streams [userId]'s [FoodDiaryDay] on [daysSinceEpoch].
  ///
  /// Returns empty stream if Firestore document doesn't exist.
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<FoodDiaryDay> foodDiaryDay$(String userId, int daysSinceEpoch) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);

    final docRef = _firestore.document(FirestorePaths.foodDiaryDay(userId, daysSinceEpoch));
    return docRef.snapshots().transform(FirestoreSerializer<FoodDiaryDay>().deserializeDocumentTransform());
  }

  /// Streams [userId]'s all-time [FoodDiaryDay]s.
  ///
  /// Returns empty stream if Firestore documents don't exist.
  /// Throws [PlatformException] if [userId] is empty.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<BuiltList<FoodDiaryDay>> allTimeFoodDiary$(String userId) {
    assert(userId != null && userId.isNotEmpty);

    final colRef = _firestore.collection(FirestorePaths.foodDiary(userId));
    return colRef.snapshots().transform(FirestoreSerializer<FoodDiaryDay>().deserializeCollectionTransform());
  }

  /// Replaces [userId]'s [FoodDiaryDay] on its respective day.
  ///
  /// Cloud functions triggers on edit:
  /// -
  ///
  /// Throws [PlatformException] if [userId] is empty.
  Future<void> replaceFoodDiaryDay(String userId, FoodDiaryDay foodDiaryDay) {
    assert(userId != null && userId.isNotEmpty);
    assert(foodDiaryDay != null);
    assert(foodDiaryDay.date >= 0);

    final docRef = _firestore.document(FirestorePaths.foodDiaryDay(userId, foodDiaryDay.date));
    return docRef.setData(FirestoreSerializer<FoodDiaryDay>().serializeDocument(foodDiaryDay), merge: false);
  }

  /// Deletes [userId]'s [FoodDiaryDay] on [daysSinceEpoch].
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

    final docRef = _firestore.document(FirestorePaths.foodDiaryDay(userId, daysSinceEpoch));
    return docRef.delete();
  }

  ///    ######  ######## ######## ######## #### ##    ##  ######    ######
  ///   ##    ## ##          ##       ##     ##  ###   ## ##    ##  ##    ##
  ///   ##       ##          ##       ##     ##  ####  ## ##        ##
  ///    ######  ######      ##       ##     ##  ## ## ## ##   ####  ######
  ///         ## ##          ##       ##     ##  ##  #### ##    ##        ##
  ///   ##    ## ##          ##       ##     ##  ##   ### ##    ##  ##    ##
  ///    ######  ########    ##       ##    #### ##    ##  ######    ######

  /// Streams global default [Settings].
  ///
  /// Returns empty stream if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<Settings> defaultSettings$() {
    final docRef = _firestore.document(FirestorePaths.defaultSettings());
    return docRef.snapshots().transform(FirestoreSerializer<Settings>().deserializeDocumentTransform());
  }

  /// Streams [userId]'s custom [Settings].
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns empty stream if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<Settings> settings$(String userId) {
    assert(userId != null && userId.isNotEmpty);

    final docRef = _firestore.document(FirestorePaths.userSettings(userId));
    return docRef.snapshots().transform(FirestoreSerializer<Settings>().deserializeDocumentTransform());
  }

  /// Replaces [userId]'s [Settings].
  ///
  /// Cloud functions triggers on edit:
  /// -
  ///
  /// Throws [PlatformException] if [userId] is empty.
  Future<void> replaceSettings(String userId, Settings settings) {
    assert(userId != null && userId.isNotEmpty);
    assert(settings != null);

    final docRef = _firestore.document(FirestorePaths.userSettings(userId));
    return docRef.setData(FirestoreSerializer<Settings>().serializeDocument(settings), merge: false);
  }

  ///   ##     ##  ######  ######## ########        ########   #######   ######  ##     ## ##     ## ######## ##    ## ########
  ///   ##     ## ##    ## ##       ##     ##       ##     ## ##     ## ##    ## ##     ## ###   ### ##       ###   ##    ##
  ///   ##     ## ##       ##       ##     ##       ##     ## ##     ## ##       ##     ## #### #### ##       ####  ##    ##
  ///   ##     ##  ######  ######   ########        ##     ## ##     ## ##       ##     ## ## ### ## ######   ## ## ##    ##
  ///   ##     ##       ## ##       ##   ##         ##     ## ##     ## ##       ##     ## ##     ## ##       ##  ####    ##
  ///   ##     ## ##    ## ##       ##    ##        ##     ## ##     ## ##    ## ##     ## ##     ## ##       ##   ###    ##
  ///    #######   ######  ######## ##     ##       ########   #######   ######   #######  ##     ## ######## ##    ##    ##

  /// Streams [userId]'s [UserDocument].
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns empty stream if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<UserDocument> userDocument$(String userId) {
    assert(userId != null && userId.isNotEmpty);

    final docRef = _firestore.document(FirestorePaths.user(userId));
    return docRef.snapshots().transform(FirestoreSerializer<UserDocument>().deserializeDocumentTransform());
  }

}
