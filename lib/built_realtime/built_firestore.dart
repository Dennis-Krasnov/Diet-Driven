library built_firestore;

import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/built_realtime/serializers.dart';
import 'package:diet_driven/models/food_record.dart';
import 'package:diet_driven/models/uncertainty.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

part 'built_firestore.g.dart';

final Logger log = new Logger("FIRESTORE");

///
abstract class Path {
  String generate();
}

///
abstract class DiaryRecordCollectionPath implements Path, Built<DiaryRecordCollectionPath, DiaryRecordCollectionPathBuilder> {
  String get userId;

  @override
  String generate() {
    return "/users/$userId/food_diary/";
  }

  DiaryRecordCollectionPath._();
  factory DiaryRecordCollectionPath([updates(DiaryRecordCollectionPathBuilder b)]) = _$DiaryRecordCollectionPath;
}

///
abstract class DiaryRecordPath implements Path, Built<DiaryRecordPath, DiaryRecordPathBuilder> {
  String get userId;
  String get diaryRecordId;

  // can always call docRef.collection(...)
//  @BuiltValueField(serialize: false, compare: false)
//  Path subCollection1;
//  @nullable
//  FSCollection<int> get subCollection2; // TODO: initialize using same arguments as document

  @override
  String generate() {
    return "/users/$userId/food_diary/$diaryRecordId";
  }
  
  DiaryRecordPath._();
  factory DiaryRecordPath([updates(DiaryRecordPathBuilder b)]) = _$DiaryRecordPath;
}

// operator overloading
//operator ==(MyClass o) => id == o.id;
// TODO: Proposed syntax for updating:
// FoodRecord -> FSDocument<FoodRecord> // with generics

///
@BuiltValue(instantiable: false)
abstract class FS<T> {
  // Document class is instantiated and compared with path
  Path get path;

  // Current widgets subscribed for updates
  @BuiltValueField(serialize: false, compare: false)
  BuiltList<int> get listeners;

  //
  @BuiltValueField(serialize: false, compare: false)
  @nullable
  StreamSubscription get streamSubscription;

  //
  @BuiltValueField(serialize: false, compare: false)
  Observable<T> get snapshotObservable;

  //
  void update(T updated);

  //
  void save(T obj);

  //
  void delete();
}

///
abstract class FSDocument<T> implements FS<T>, Built<FSDocument<T>, FSDocumentBuilder<T>> {
  // Firestore document reference
  @BuiltValueField(serialize: false, compare: false)
  DocumentReference get docRef => Firestore.instance.document(path.generate());

  @override
  Observable<T> get snapshotObservable => Observable<T>(Firestore.instance.document(docRef.path).snapshots().asyncMap((ds) => standardSerializers.deserialize(ds.data))).distinct();

  @override
  void update(T updated) => docRef.updateData(standardSerializers.serialize(updated)).catchError(print);

  @override
  void save(T obj) => docRef.setData(standardSerializers.serialize(obj)).catchError(print);

  @override
  void delete() => docRef.delete();

  FSDocument._();
  factory FSDocument([updates(FSDocumentBuilder<T> b)]) = _$FSDocument<T>;
}

///
abstract class FSCollection<T> implements FS<BuiltList<T>>, Built<FSCollection<T>, FSCollectionBuilder<T>> {
  // Firestore collection reference
  @BuiltValueField(serialize: false, compare: false)
  CollectionReference get collectionRef => Firestore.instance.collection(path.generate());

  @override
  Observable<BuiltList<T>> get snapshotObservable => Observable<BuiltList<T>>(Firestore.instance.collection(collectionRef.path).snapshots().asyncMap((ds) =>
    BuiltList<T>.from(ds.documents.map((doc) => standardSerializers.deserialize(doc.data)))
    // TODO: add doc.documentID somehow to every object? (T extends ??, set ??'s property?)
  )).distinct();

  @override
//  void update(BuiltList<T> updated) => collectionRef.updateData(standardSerializers.serialize(updated)).catchError(print);
  void update(BuiltList<T> updated) {
    // delete all!

    // foreach
//    collectionRef.add();

    // or try to update only changed?


    log.info("UPDATE: $updated");
//    updated.forEach((doc) => doc);
//    collectionRef.updateData(standardSerializers.serialize(updated)).catchError(print);
  }

  @override
  void save(BuiltList<T> obj) => null;

  @override
  void delete() => null;

  FSCollection._();
  factory FSCollection([updates(FSCollectionBuilder<T> b)]) = _$FSCollection<T>;
}
