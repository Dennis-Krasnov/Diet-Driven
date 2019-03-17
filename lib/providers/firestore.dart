import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/models/food_diary_day.dart';
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

  Future<void> foodDiaryUpdate(String userId, int daysSinceEpoch, FoodDiaryDay foodDiaryDay) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
    return ref.setData(fsDiary.serializeDocument(foodDiaryDay));
  }

  Future<void> foodDiaryDelete(String userId, int daysSinceEpoch) {
    DocumentReference ref = _firestore.document(foodDiaryPath(userId, daysSinceEpoch));
    return ref.delete();
  }

  Observable<BuiltList<FoodDiaryDay>> foodDiaryList(String userId) {
    CollectionReference ref = _firestore.collection("${userPath(userId)}/food_diary");
    print("COLLECTION REFERENCE ${ref.path}");
    return fsDiary.deserializeCollection(ref.snapshots());
  }

  Future<BuiltList<FoodDiaryDay>> foodDiaryListSingle(String userId) {
    CollectionReference ref = _firestore.collection("${userPath(userId)}/food_diary");
    print("COLLECTION REFERENCE ${ref.path}");

    return fsDiary.deserializeSingleCollection(ref.getDocuments());
  }
}

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