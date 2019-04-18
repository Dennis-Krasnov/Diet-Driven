import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/models/food_diary_day.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/models/serializers.dart';
import 'package:rxdart/rxdart.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  ///
  String userPath(String userId) => "users/$userId";

  // can specify set vs update, merge, etc. on case by case basis

  /// FOOD DIARY
  String foodDiaryPath(userId, daysSinceEpoch) => "${userPath(userId)}/food_diary/$daysSinceEpoch";
  final fsDiary = FS<FoodDiaryDay>();

  ///
  Future<void> setFoodDiaryDay(String userId, FoodDiaryDay foodDiaryDay) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, foodDiaryDay.date));
    return ref.setData(fsDiary.serializeDocument(foodDiaryDay));
  }

  /// Throws if day doesn't exist
  Future<void> deleteFoodDiaryDay(String userId, int daysSinceEpoch) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
    return ref.delete();
  }

  ///
  Observable<FoodDiaryDay> streamFoodDiaryDay(String userId, int daysSinceEpoch) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
    return fsDiary.deserializeDocument(ref.snapshots());
  }

  /// TODO: provide start date
  Observable<BuiltList<FoodDiaryDay>> streamFullFoodDiary(String userId) {
    CollectionReference ref = _firestore.collection("${userPath(userId)}/food_diary");
    return fsDiary.deserializeCollection(ref.snapshots());
  }

  ///
  Future<BuiltList<FoodDiaryDay>> getFullFoodDiary(String userId) {
    CollectionReference ref = _firestore.collection("${userPath(userId)}/food_diary");
    return fsDiary.deserializeSingleCollection(ref.getDocuments());
  }

  /// FOOD RECORD
  Future<void> addFoodRecord(String userId, int daysSinceEpoch, FoodRecord foodRecord) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
    return ref.updateData({
      "foodRecords": FieldValue.arrayUnion([foodRecord])
    });
  }

  /// Throws if day doesn't exist
  Future<void> deleteFoodRecord(String userId, int daysSinceEpoch, FoodRecord foodRecord) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
    return ref.updateData({
      "foodRecords": FieldValue.arrayRemove([foodRecord])
    });
  }

  /// Throws if day doesn't exist
  Future<void> editFoodRecord(String userId, int daysSinceEpoch, FoodRecord oldRecord, FoodRecord newRecord) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
    final WriteBatch batch = _firestore.batch();

    batch.updateData(ref, <String, dynamic>{
      "foodRecords": FieldValue.arrayRemove([oldRecord])
    });

    batch.updateData(ref, <String, dynamic>{
      "foodRecords": FieldValue.arrayUnion([newRecord])
    });

    return batch.commit();
  }

  /// SETTINGS
  String settingsDocumentPath(userId, setting) => "${userPath(userId)}/settings/$setting";

  Observable<BuiltList<SettingsDocument>> settingsDocumentList(String userId) {
    CollectionReference ref = _firestore.collection("${userPath(userId)}/settings");
    print("SETTINGS COLLECTION REFERENCE ${ref.path}");
    return FS<SettingsDocument>().deserializeCollection(ref.snapshots());
  }

  Observable<UserData> userDataDocument(String userId) {
    DocumentReference ref = _firestore.document("${userPath(userId)}");
    print("USER DATA DOCUMENT REFERENCE ${ref.path}");
    return FS<UserData>().deserializeDocument(ref.snapshots());
  }
}

///
class FS<T> {
  ///
  Map<String, dynamic> _dataWithId(DocumentSnapshot doc) => doc.data..putIfAbsent("_id", () => doc.documentID);

  ///
  Future<void> updateDocument(DocumentReference doc, T obj, {bool merge: false}) {
    return doc.setData(jsonSerializers.serialize(obj), merge: merge);
  }

  ///
  Object serializeDocument(T object) {
    return jsonSerializers.serialize(object);
  }

  ///
  Observable<T> deserializeDocument(Stream<DocumentSnapshot> stream) {
    return Observable(stream).map<T>((doc) =>
      jsonSerializers.deserialize(_dataWithId(doc))
    );
  }

  ///
  Observable<BuiltList<T>> deserializeCollection(Stream<QuerySnapshot> stream) {
    return Observable(stream).map<BuiltList<T>>((qs) =>
      BuiltList<T>.from(qs.documents.map((doc) => jsonSerializers.deserialize(_dataWithId(doc))))
    );
  }

  ///
  Future<BuiltList<T>> deserializeSingleCollection(Future<QuerySnapshot> snapshot) async {
    var diary = await snapshot;
    return BuiltList<T>.from(diary.documents.map((doc) => jsonSerializers.deserialize(_dataWithId(doc))));
  }
}
