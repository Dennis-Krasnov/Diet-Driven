library built_firestore;

import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/built_realtime/serializers.dart';
import 'package:diet_driven/models/food_record.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

part 'built_firestore.g.dart';

final Logger log = new Logger("FIRESTORE");

///
class FSTuple<T> {
  final FS<T> fs;
  final T data;
  FSTuple(this.fs, this.data);
}

///
@BuiltValue(instantiable: false)
abstract class FS<T> {
  //
  @nullable
  @BuiltValueField(serialize: false, compare: false)
  StreamSubscription get streamSubscription;

  //
  @BuiltValueField(serialize: false, compare: false)
  Observable<T> get snapshotObservable;

}

///
@BuiltValue(instantiable: false)
abstract class FSDocument<T> implements FS<T> {
  //
  DocumentReference get docRef;

  @override
  Observable<T> get snapshotObservable => Observable<T>(Firestore.instance.document(docRef.path).snapshots().asyncMap((ds) =>
      standardSerializers.deserialize(ds.data..putIfAbsent("_id", () => ds.documentID))
  )).distinct();

  // TODO: test this thoroughly (test invalid inputs, etc)
  @override
  CollectionReference get parentCollection {
    // strips documentID from path creating the collection
    RegExp regex = new RegExp(r"((?:[^/]*/)*)(.*)");
    return Firestore.instance.collection(regex.firstMatch(docRef.path).group(1));
  }

  //
  void update(T obj, {bool merge: false}) {
    // TODO: pass onError event!?
    docRef.setData(standardSerializers.serialize(obj), merge: merge).catchError(print);
  }

  //
  void delete() {
    // TODO: pass onError event!?
    docRef.delete().catchError(print);
  }
}

///
@BuiltValue(instantiable: false)
abstract class FSCollection<T> implements FS<BuiltList<T>> { // extends Built<T, dynamic>
  CollectionReference get colRef;

  // FIXME: ovveride this method in each implementation, each parses collection reference path and generates proper object
//  FSCollection.fromCollectionReference(CollectionReference cr);
//  static FSCollection fromCollectionReference(CollectionReference cr) {
//    return FSCollection((b) => b..);
//  }

  @override
  Observable<BuiltList<T>> get snapshotObservable => Observable<BuiltList<T>>(Firestore.instance.collection(colRef.path).snapshots().asyncMap((ds) =>
      BuiltList<T>.from(ds.documents.map((doc) => standardSerializers.deserialize(doc.data..putIfAbsent("_id", () => doc.documentID))))
  )).distinct();


  @override
  CollectionReference get parentCollection {
    // For root collections, null is returned
    return colRef.parent();
  }

  //
  Future<DocumentReference> add(T obj) {
    return colRef.add(standardSerializers.serialize(obj)).catchError(print);
  }

  // FIXME
  void clear() async {
//    colRef.parent()
    log.shout("DELETE ALL DOCUMENTS");
    var docs = await colRef.getDocuments();
    docs.documents.forEach((d) =>
      d.reference.delete()
    );
  }

  // FIXME
  void delete(T obj) async {
    log.shout("DELETE $obj");
    var docs = await colRef.getDocuments();
//    docs.documents.where((ds) => ds.documentID == "-LYgPw3PvhJ8YrN5p0_N").toList()[0].reference.delete(); // TODO: obj.id !!! // take string id instead!!!!!! - object don't have ID (maybe just id to make it easier?)
  }
}

///
abstract class FoodRecordDocument with FSDocument<FoodRecord> implements Built<FoodRecordDocument, FoodRecordDocumentBuilder> {
  String get userId;
  String get foodRecordId;

  @override
  DocumentReference get docRef => Firestore.instance.document("users/$userId/food_diary/$foodRecordId");

//  @override
//  void addToCollection(FoodRecord obj) {
//    CollectionReference parentCollection = Firestore.instance.collection("users/$userId/food_diary");
//    parentCollection.add(standardSerializers.serialize(obj));
//  }

//  FoodRecordDocument.addToCollection(FoodRecord obj) {
//    CollectionReference parentCollection = Firestore.instance.collection("users/$userId/food_diary");
//    docRef = parentCollection.add(standardSerializers.serialize(obj));
//
////    this._color = another.getColor();
////    this._name = another.getName();
//  }

  // TODO: SUBCOLLECTION LOGIC HERE
  // TODO: subscribe method, also calls for all its subcollections... (also custom serialization)

  FoodRecordDocument._();
  factory FoodRecordDocument([updates(FoodRecordDocumentBuilder b)]) = _$FoodRecordDocument;

}

///
abstract class FoodDiaryCollection with FSCollection<FoodRecord> implements Built<FoodDiaryCollection, FoodDiaryCollectionBuilder> {
  String get userId;

  @override
  CollectionReference get colRef => Firestore.instance.collection("users/$userId/food_diary");

  FoodDiaryCollection._();
  factory FoodDiaryCollection([updates(FoodDiaryCollectionBuilder b)]) = _$FoodDiaryCollection;
}

///
abstract class MealSnapshotCollection with FSCollection<FoodRecord> implements Built<MealSnapshotCollection, MealSnapshotCollectionBuilder> {
  String get userId;

  @override
  CollectionReference get colRef => Firestore.instance.collection("users/$userId/meal_snapshots");

  MealSnapshotCollection._();
  factory MealSnapshotCollection([updates(MealSnapshotCollectionBuilder b)]) = _$MealSnapshotCollection;
}