import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/models/food_diary_day.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/models/serializers.dart';
import 'package:rxdart/rxdart.dart';

///
class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  ///
  String userPath(String userId) => "users/$userId";

  ///   ########  #######   #######  ########     ########  ####    ###    ########  ##    ##
  ///   ##       ##     ## ##     ## ##     ##    ##     ##  ##    ## ##   ##     ##  ##  ##
  ///   ##       ##     ## ##     ## ##     ##    ##     ##  ##   ##   ##  ##     ##   ####
  ///   ######   ##     ## ##     ## ##     ##    ##     ##  ##  ##     ## ########     ##
  ///   ##       ##     ## ##     ## ##     ##    ##     ##  ##  ######### ##   ##      ##
  ///   ##       ##     ## ##     ## ##     ##    ##     ##  ##  ##     ## ##    ##     ##
  ///   ##        #######   #######  ########     ########  #### ##     ## ##     ##    ##

  ///
  String foodDiaryPath(userId, daysSinceEpoch) => "${userPath(userId)}/food_diary/$daysSinceEpoch";
  final fsDiaryDay = FS<FoodDiaryDay>();
  final fsFoodRecord = FS<FoodRecord>();

  ///
  Future<void> setFoodDiaryDay(String userId, FoodDiaryDay foodDiaryDay) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, foodDiaryDay.date));
    return ref.setData(fsDiaryDay.serializeDocument(foodDiaryDay));
  }

  /// Throws if day doesn't exist
  Future<void> deleteFoodDiaryDay(String userId, int daysSinceEpoch) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
    return ref.delete();
  }

  ///
  Observable<FoodDiaryDay> streamFoodDiaryDay(String userId, int daysSinceEpoch) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
    return fsDiaryDay.deserializeDocument(ref.snapshots());
  }

  /// TODO: provide start date
  Observable<BuiltList<FoodDiaryDay>> streamFullFoodDiary(String userId) {
    CollectionReference ref = _firestore.collection("${userPath(userId)}/food_diary");
    return fsDiaryDay.deserializeCollection(ref.snapshots());
  }

  ///
  Future<BuiltList<FoodDiaryDay>> getFullFoodDiary(String userId) {
    CollectionReference ref = _firestore.collection("${userPath(userId)}/food_diary");
    return fsDiaryDay.deserializeSingleCollection(ref.getDocuments());
  }

  ///   ########  #######   #######  ########     ########  ########  ######   #######  ########  ########
  ///   ##       ##     ## ##     ## ##     ##    ##     ## ##       ##    ## ##     ## ##     ## ##     ##
  ///   ##       ##     ## ##     ## ##     ##    ##     ## ##       ##       ##     ## ##     ## ##     ##
  ///   ######   ##     ## ##     ## ##     ##    ########  ######   ##       ##     ## ########  ##     ##
  ///   ##       ##     ## ##     ## ##     ##    ##   ##   ##       ##       ##     ## ##   ##   ##     ##
  ///   ##       ##     ## ##     ## ##     ##    ##    ##  ##       ##    ## ##     ## ##    ##  ##     ##
  ///   ##        #######   #######  ########     ##     ## ########  ######   #######  ##     ## ########

  ///
  Future<void> addFoodRecord(String userId, int daysSinceEpoch, FoodRecord foodRecord) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));

    var fr = fsFoodRecord.serializeDocument(foodRecord);
    print("FR IS $fr");

    return ref.updateData({
      "foodRecords": FieldValue.arrayUnion([fr.toString()]),
//      "lastUpdated": FieldValueType.serverTimestamp
    });
  }

  /// Throws if day doesn't exist
  Future<void> deleteFoodRecord(String userId, int daysSinceEpoch, FoodRecord foodRecord) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));

    // FIXME: temporary solution can be to re-upload entire food diary day with edited food record
    // Pros: Faster, don't need to deal with array serialization problems
    // Cons: Error prone, limited to few people editing at once, redoing FS logic locally,

    // Individual Food Record:
    // {$: FoodRecord, foodName: yaaay}

    // Built list of Food Records:
    // {$: list, : [{$: FoodRecord, foodName: yaaay}]}

    // What's stored in Firestore:
    // foodName: yaaay

    var foodRecordSerialized = fsFoodRecord.serializeDocument(foodRecord);
    print("FR IS: $foodRecordSerialized");
    print("FR AS Map<String, dynamic> ${foodRecordSerialized as Map<String, dynamic>}");
    // TODO: can remove element from map!

    // use reflection to set `$` field to null, hope it doesn't show up in firestore

    return ref.updateData({
      "foodRecords": FieldValue.arrayRemove([foodRecordSerialized])
    });
  }

  /// Throws if day doesn't exist
  Future<void> editFoodRecord(String userId, int daysSinceEpoch, FoodRecord oldRecord, FoodRecord newRecord) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
    final WriteBatch batch = _firestore.batch();

    // TODO:
//    var fr = fsFoodRecord.serializeDocument(foodRecord);
//    print("FR IS $fr");

    batch.updateData(ref, <String, dynamic>{
      "foodRecords": FieldValue.arrayRemove([oldRecord])
    });

    batch.updateData(ref, <String, dynamic>{
      "foodRecords": FieldValue.arrayUnion([newRecord])
    });

    return batch.commit();
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
