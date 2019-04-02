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

  Future<void> setFoodDiaryDay(String userId, FoodDiaryDay foodDiaryDay) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, foodDiaryDay.date));
    return ref.setData(fsDiary.serializeDocument(foodDiaryDay));
  }

  Future<void> deleteFoodDiaryDay(String userId, int daysSinceEpoch) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
    return ref.delete();
  }

  Future<void> addFoodRecord(String userId, int daysSinceEpoch, FoodRecord foodRecord) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
//    ref.updateData(data) // TODO: array operations
  }

  Future<void> deleteFoodRecord(String userId, int daysSinceEpoch, FoodRecord foodRecord) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
//    ref.updateData(data) // TODO: array operations
  }

  Future<void> editFoodRecord(String userId, int daysSinceEpoch, FoodRecord oldRecord, FoodRecord newRecord) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
    // TODO: wire batch!
    // TODO: array operations
    // TODO: remove old then add new
  }

  Observable<BuiltList<FoodDiaryDay>> streamFoodDiary(String userId) {
    CollectionReference ref = _firestore.collection("${userPath(userId)}/food_diary");
    return fsDiary.deserializeCollection(ref.snapshots());
  }

  Future<BuiltList<FoodDiaryDay>> getFoodDiary(String userId) {
    CollectionReference ref = _firestore.collection("${userPath(userId)}/food_diary");
    return fsDiary.deserializeSingleCollection(ref.getDocuments());
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
