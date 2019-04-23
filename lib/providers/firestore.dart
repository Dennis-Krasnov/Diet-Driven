import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/models/food_diary_day.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/models/serializers.dart';

/// Firebase Firestore provider.
/// https://cloud.google.com/firestore/
class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  String userPath(String userId) => "users/$userId";

  ///   ########  #######   #######  ########     ########  ####    ###    ########  ##    ##
  ///   ##       ##     ## ##     ## ##     ##    ##     ##  ##    ## ##   ##     ##  ##  ##
  ///   ##       ##     ## ##     ## ##     ##    ##     ##  ##   ##   ##  ##     ##   ####
  ///   ######   ##     ## ##     ## ##     ##    ##     ##  ##  ##     ## ########     ##
  ///   ##       ##     ## ##     ## ##     ##    ##     ##  ##  ######### ##   ##      ##
  ///   ##       ##     ## ##     ## ##     ##    ##     ##  ##  ##     ## ##    ##     ##
  ///   ##        #######   #######  ########     ########  #### ##     ## ##     ##    ##

  String foodDiaryPath(userId, daysSinceEpoch) => "${userPath(userId)}/food_diary/$daysSinceEpoch";
  final fsDiaryDay = FS<FoodDiaryDay>();
  final fsFoodRecord = FS<FoodRecord>();

  /// Deletes entire [FoodDiaryDay] in Firestore.
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

    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
    return ref.delete();
  }

  /// Fetches [Observable] of [userId]'s [FoodDiaryDay] at [daysSinceEpoch].
  /// 'streamDiaryDay(userId, daysSinceEpoch)` is called for every diary day from [DiaryBloc].
  ///
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  /// Returns [null] if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Observable<FoodDiaryDay> streamFoodDiaryDay(String userId, int daysSinceEpoch) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);

    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
    return fsDiaryDay.deserializeDocument(ref.snapshots());
  }

  /// Fetches [Observable] of [userId]'s all-time [FoodDiaryDay].
  /// 'streamAllDiaryDays(userId)` is called for every user from [ReportBloc]. // TODO
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns [null] if no Firestore documents exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Observable<BuiltList<FoodDiaryDay>> streamAllFoodDiary(String userId) {
    assert(userId != null && userId.isNotEmpty);

    CollectionReference ref = _firestore.collection("${userPath(userId)}/food_diary");
    return fsDiaryDay.deserializeCollection(ref.snapshots());
  }

  /// Adds [FoodRecord] to [FoodDiaryDay] in Firestore.
  /// Adding a duplicate [FoodRecord] has no effect.
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
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  Future<void> addFoodRecord(String userId, int daysSinceEpoch, FoodRecord foodRecord) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);
    assert(foodRecord != null);

    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));

    // Must merge, otherwise deletes all other fields in document
    return ref.setData({
      "foodRecords": FieldValue.arrayUnion([removeDollarSign(fsFoodRecord.serializeDocument(foodRecord))]),
    }, merge: true);
  }

  /// Deletes [FoodRecord] from [FoodDiaryDay] in Firestore.
  /// Deleting a non-existent [FoodRecord] has no effect.
  ///
  /// Cloud functions triggers on edit:
  /// - If [dayCompleted], calculates score for the day, saves in document, saves in aggregate score.
  /// - If [foodRecords] is empty, deletes document.
  /// - Calculates aggregate global statistics.
  ///
  /// Cloud functions triggers on delete:
  /// - If [dayCompleted], calculates score for the day, saves in aggregate score.
  /// - Calculates aggregate global statistics.
  ///
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  /// Throws [Exception] if food diary day document doesn't exist.
  Future<void> deleteFoodRecord(String userId, int daysSinceEpoch, FoodRecord foodRecord) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);
    assert(foodRecord != null);

    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));

    return ref.updateData({
      "foodRecords": FieldValue.arrayRemove([removeDollarSign(fsFoodRecord.serializeDocument(foodRecord))]),
    });
  }

  /// Edits [FoodRecord] in [FoodDiaryDay] in Firestore.
  /// Deleting a non-existent [FoodRecord] has no effect, adding a duplicate [FoodRecord] has no effect.
  ///
  /// Cloud functions triggers on edit:
  /// - If [dayCompleted], calculates score for the day, saves in document, saves in aggregate score.
  /// - If [foodRecords] is empty, deletes document. (won't happen when editing)
  /// - Calculates aggregate global statistics.
  ///
  /// Throws [PlatformException] if [userId] or [daysSinceEpoch] is empty.
  /// Throws [Exception] if food diary day document doesn't exist.
  void editFoodRecord(String userId, int daysSinceEpoch, FoodRecord oldRecord, FoodRecord newRecord) {
    assert(userId != null && userId.isNotEmpty);
    assert(daysSinceEpoch >= 0);
    assert(oldRecord != newRecord);

    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));

    // Edit implemented as delete old + add new, no need to recreate entire day and
    // Batch operation only slows this down, created intentional race condition since old != new
    // Only flaw is if one of the requests fails, but the other succeeds, but this is very unlikely

    // The worst case is if two instances edit same food record, which will result in both records saved (nothing lost)
    // In this case, it's possible to detect 'duplicates' grouping by UID => show notification, highlight records red
    // TODO: create conflict resolution page

    ref.updateData(<String, dynamic>{
      "foodRecords": FieldValue.arrayRemove([removeDollarSign(fsFoodRecord.serializeDocument(oldRecord))])
    });

    ref.updateData(<String, dynamic>{
      "foodRecords": FieldValue.arrayUnion([removeDollarSign(fsFoodRecord.serializeDocument(newRecord))]),
    });
  }

  ///    ######  ######## ######## ######## #### ##    ##  ######    ######
  ///   ##    ## ##          ##       ##     ##  ###   ## ##    ##  ##    ##
  ///   ##       ##          ##       ##     ##  ####  ## ##        ##
  ///    ######  ######      ##       ##     ##  ## ## ## ##   ####  ######
  ///         ## ##          ##       ##     ##  ##  #### ##    ##        ##
  ///   ##    ## ##          ##       ##     ##  ##   ### ##    ##  ##    ##
  ///    ######  ########    ##       ##    #### ##    ##  ######    ######

  /// Fetches [Observable] of default [Settings] from Firestore.
  /// [Settings] stored at /config/default_settings, read-only document.
  ///
  /// Returns [null] if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Observable<Settings> defaultSettings() {
    DocumentReference ref = _firestore.document("config/default_settings");
    return FS<Settings>().deserializeDocument(ref.snapshots());
  }

  /// Fetches [Observable] of [userId]'s [Settings] from Firestore.
  /// [Settings] stored at /users/{userId}/metadata/settings.
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns [null] if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Observable<Settings> settingsStream(String userId) {
    assert(userId != null && userId.isNotEmpty);

    DocumentReference ref = _firestore.document("${userPath(userId)}/metadata/settings");
    return FS<Settings>().deserializeDocument(ref.snapshots());
  }

  /// Fetches [Observable] of [userId]'s [UserDocument] from Firestore.
  /// [UserDocument] stored at /users/{userId}, read-only document.
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns [null] if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Observable<UserDocument> userDocument(String userId) {
    assert(userId != null && userId.isNotEmpty);

    DocumentReference ref = _firestore.document("${userPath(userId)}");
    return FS<UserDocument>().deserializeDocument(ref.snapshots());
  }
}

///   ######## #### ########  ########  ######  ########  #######  ########  ########
///   ##        ##  ##     ## ##       ##    ##    ##    ##     ## ##     ## ##
///   ##        ##  ##     ## ##       ##          ##    ##     ## ##     ## ##
///   ######    ##  ########  ######    ######     ##    ##     ## ########  ######
///   ##        ##  ##   ##   ##             ##    ##    ##     ## ##   ##   ##
///   ##        ##  ##    ##  ##       ##    ##    ##    ##     ## ##    ##  ##
///   ##       #### ##     ## ########  ######     ##     #######  ##     ## ########

/// Use a [FS] to serialize and deserialize generic [T] objects.
///
/// Repeated [FS]s are initialized before use to improve readability.
class FS<T> {
  /// Inserts Firestore document id into [doc] as `_id` field.
  Map<String, dynamic> _dataWithId(DocumentSnapshot doc) => doc.data..putIfAbsent("_id", () => doc.documentID);

  /// Serializes a single [T] into Firestore-readable JSON.
  ///
  /// TODO: check possible errors with null, etc
  Object serializeDocument(T object) {
    assert(object != null);

    return jsonSerializers.serialize(object);
  }

  /// Deserializes [stream] of [DocumentSnapshot] into stream of [T].
  ///
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Observable<T> deserializeDocument(Stream<DocumentSnapshot> stream) {
    return Observable(stream).map<T>((doc) =>
      jsonSerializers.deserialize(_dataWithId(doc))
    );
  }

  /// Deserializes [stream] of [QuerySnapshot] into stream of [BuiltList] of [T].
  ///
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Observable<BuiltList<T>> deserializeCollection(Stream<QuerySnapshot> stream) {
    return Observable(stream).map<BuiltList<T>>((qs) =>
      BuiltList<T>.from(qs.documents.map((doc) => jsonSerializers.deserialize(_dataWithId(doc))))
    );
  }

  /// Deserializes a single [snapshot] into [T].
  ///
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Future<BuiltList<T>> deserializeSingleCollection(Future<QuerySnapshot> snapshot) async {
    var snapshotResult = await snapshot;
    return BuiltList<T>.from(snapshotResult.documents.map((doc) => jsonSerializers.deserialize(_dataWithId(doc))));
  }
}

/// Remove `$` field specifying type from serialized data to ensure consistency.
/// Serializing single built value adds `$` field specifying type - {$: FoodRecord, foodName: Apple}
/// Built value also serializes sub fields without `$` - foodName: Apple}
/// [serializedValue] stored internally as [_InternalLinkedHashMap].
Map<String, dynamic> removeDollarSign(Object serializedValue) {
    // https://github.com/flutter/flutter/issues/16589#issuecomment-390343331
    return Map<String, dynamic>.from(serializedValue)..remove("\$");
}
