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

/*
new Path(fs, [widget.hash])
 */

///
class FSPath {
  final FS firestore;
  final List<int> subscriptions;

  FSPath(this.firestore, this.subscriptions);
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

  //
//  void addToCollection(T obj);

  //
  void update(T obj, {bool merge: false}) {
    docRef.setData(standardSerializers.serialize(obj), merge: merge).catchError(print);
  }

  //
  void delete() {
    docRef.delete().catchError(print);
  }
}

///
@BuiltValue(instantiable: false)
abstract class FSCollection<T> implements FS<BuiltList<T>> { // extends Built<T, dynamic>
  CollectionReference get colRef;

  @override
  Observable<BuiltList<T>> get snapshotObservable => Observable<BuiltList<T>>(Firestore.instance.collection(colRef.path).snapshots().asyncMap((ds) =>
      BuiltList<T>.from(ds.documents.map((doc) => standardSerializers.deserialize(doc.data..putIfAbsent("_id", () => doc.documentID))))
  )).distinct();

//  @override
//  Observable<BuiltList<T>> get snapshotObservable => Observable<BuiltList<T>>(Firestore.instance.collection(collectionRef.path).snapshots().asyncMap((ds) =>
//    BuiltList<T>.from(ds.documents.map((doc) => standardSerializers.deserialize(doc.data)))
//    // TODO: add doc.documentID somehow to every object? (T extends ??, set ??'s property?)
//  )).distinct();

  //
  void add(T obj) {
    colRef.add(standardSerializers.serialize(obj)).catchError(print);
    // TODO: return DocumentReference
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