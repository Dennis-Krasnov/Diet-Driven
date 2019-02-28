library built_firestore;

import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/util/serializers.dart';
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
class FSDynamicTuple<T> {
  final FS<dynamic> fs;
  final T data;
  FSDynamicTuple(this.fs, this.data);
}

/////
@BuiltValue(instantiable: false)
abstract class FS<T> {
  //
  @nullable
  @BuiltValueField(serialize: false, compare: false)
  StreamSubscription get streamSubscription;

  //
  @BuiltValueField(serialize: false, compare: false)
  Observable<T> get snapshotObservable;

  //
  @BuiltValueField(serialize: false, compare: false)
  CollectionReference get parentCollection;
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