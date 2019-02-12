library built_firestore;

import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/built_realtime/serializers.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

part 'built_firestore.g.dart';

final Logger log = new Logger("FIRESTORE");

//@BuiltValue(instantiable: false)
//abstract class FS<T> {
//  @BuiltValueField(serialize: false, compare: false)
//  @nullable
//  StreamSubscription get streamSubscription;
//
//  @BuiltValueField(serialize: false, compare: false)
//  Observable<T> get snapshotObservable;
//
//  @BuiltValueField(serialize: false, compare: false)
//  BuiltList<int> get listeners;
//}

//@BuiltValue(instantiable: false)
//abstract class FSDocument<T> implements FS<T>{
//
//  @BuiltValueField(serialize: false, compare: false)
//  DocumentReference get docRef;
//
//  void update(T updated) => docRef.updateData(standardSerializers.serialize(updated)).catchError(print);
//
////  @override
//  Observable<T> get snapshotObservable => Observable<T>(Firestore.instance.document(docRef.path).snapshots().asyncMap((ds) => standardSerializers.deserialize(ds.data))).distinct();
//}

//@BuiltValue(instantiable: false)
//abstract class FSMonoCollection<T> {
//  @BuiltValueField(serialize: false, compare: false)
//  CollectionReference get collectionRef;
////  void update(T updated) => collectionRef.updateData(standardSerializers.serialize(updated)).catchError(print); // FIXME
////  Observable<T> get snapshotObservable => Observable(Firestore.instance.document(docRef.path).snapshots().asyncMap((ds) => standardSerializers.deserialize(ds.data)));
//}
//
//@BuiltValue(instantiable: false)
//abstract class FSMultiCollection<T> {
//  @BuiltValueField(serialize: false, compare: false)
//  CollectionReference get collectionRef;
////  void update(T updated) => collectionRef.updateData(standardSerializers.serialize(updated)).catchError(print); // FIXME
////  Observable<T> get snapshotObservable => Observable(Firestore.instance.document(docRef.path).snapshots().asyncMap((ds) => standardSerializers.deserialize(ds.data)));
//}
//
//@BuiltValue(instantiable: false)
//abstract class FSCollection<T> {
//  @BuiltValueField(serialize: false, compare: false)
//  CollectionReference get collectionRef;
////  void update(T updated) => collectionRef.updateData(standardSerializers.serialize(updated)).catchError(print); // FIXME
////  Observable<T> get snapshotObservable => Observable(Firestore.instance.document(docRef.path).snapshots().asyncMap((ds) => standardSerializers.deserialize(ds.data)));
//}

//abstract class GenericFSDocument with FSDocument<dynamic> implements Built<GenericFSDocument, GenericFSDocumentBuilder> {
//  GenericFSDocument._();
//  factory GenericFSDocument([updates(GenericFSDocumentBuilder b)]) = _$GenericFSDocument;
//}

//@BuiltValue(instantiable/*: false)
//abstract class FSDocument<T> {
//  @BuiltValueField(serialize: false, compare: false)
//  DocumentReference get docRef;

//  @BuiltValueField(serialize: false, compare: false)
//  Observable<T> get snapshotObservable => Observable<T>(Firestore.instance.document(docRef.path).snapshots().asyncMap((ds) => standardSerializers.deserialize(ds.data))).distinct();

//  void update(T updated) => docRef.updateData(standardSerializers.serialize(updated)).catchError(print);
//}*/

abstract class Path {
  String generate();
}

abstract class DiaryRecordPath implements Path, Built<DiaryRecordPath, DiaryRecordPathBuilder> {
  String get userId;
  String get diaryRecordId;

//  @BuiltValueField(serialize: false, compare: false)
//  Path subCollection1;
//  @nullable
//  FSCollection<int> get subCollection2; // TODO: initialize using same arguments as document

  @override
  String generate() {
    return "/users/$userId";
  }
  
  DiaryRecordPath._();
  factory DiaryRecordPath([updates(DiaryRecordPathBuilder b)]) = _$DiaryRecordPath;
}

// operator overloading
//operator ==(MyClass o) => id == o.id;
// TODO: Proposed syntax for updating:
// FoodRecord -> FSDocument<FoodRecord> // with generics

//
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
}

abstract class FSDocument<T> implements FS<T>, Built<FSDocument<T>, FSDocumentBuilder<T>> {
  // Firestore document reference
  @BuiltValueField(serialize: false, compare: false)
  DocumentReference get docRef => Firestore.instance.document(path.generate());

  @override
  Observable<T> get snapshotObservable => Observable<T>(Firestore.instance.document(docRef.path).snapshots().asyncMap((ds) => standardSerializers.deserialize(ds.data))).distinct();

  @override
  void update(T updated) => docRef.updateData(standardSerializers.serialize(updated)).catchError(print);


  FSDocument._();
  factory FSDocument([updates(FSDocumentBuilder<T> b)]) = _$FSDocument<T>;
}

abstract class FSCollection<T> implements FS<BuiltList<T>>, Built<FSCollection<T>, FSCollectionBuilder<T>> {
  // Firestore document reference
  @BuiltValueField(serialize: false, compare: false)
  CollectionReference get collectionRef => Firestore.instance.collection(path.generate());

  @override
//  Observable<T> get snapshotObservable => Observable<T>(Firestore.instance.document(collectionRef.path).snapshots().asyncMap((ds) => standardSerializers.deserialize(ds.data))).distinct();
  Observable<BuiltList<T>> get snapshotObservable => Observable<BuiltList<T>>(Firestore.instance.collection(collectionRef.path).snapshots().asyncMap((ds) =>
      BuiltList.from(ds.documents.map((doc) => standardSerializers.deserialize(doc)))
  )).distinct();

  @override
//  void update(BuiltList<T> updated) => collectionRef.updateData(standardSerializers.serialize(updated)).catchError(print);
  void update(BuiltList<T> updated) {
    print("UPDATE:");
    print(updated);
//    updated.forEach((doc) => doc);
//    collectionRef.updateData(standardSerializers.serialize(updated)).catchError(print);
  }


  FSCollection._();
  factory FSCollection([updates(FSCollectionBuilder<T> b)]) = _$FSCollection<T>;
}


//@BuiltValue() // don't know what this does... // https://github.com/google/built_value.dart/issues/386
//abstract class FSDiary with FSDocument<FoodRecord> implements Built<FSDiary, FSDiaryBuilder> {
//  String get userId;
//  String get diaryRecordId;
//
//  @override
//  DocumentReference get docRef => Firestore.instance.document('users/$userId');
//
//  FSDiary._();
//  factory FSDiary([updates(FSDiaryBuilder b)]) = _$FSDiary;
//}

//  factory FSDiary([updates(FSDiaryBuilder b)]) => _$FSDiary((b) => b
//      ..sub = snapshotObservable.listen((fr) => print(fr))
//  );

//typedef F = List<T> Function<T>(T);
//typedef F =  Function(int);