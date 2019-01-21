library built_firestore;

import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_redux/built_redux.dart';
import 'package:built_value/built_value.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/models/food_record.dart';
import 'package:diet_driven/models/serializers.dart';
import 'package:rxdart/rxdart.dart';

part 'built_firestore.g.dart';

@BuiltValue(instantiable: false)
abstract class FS<T> {
  @BuiltValueField(serialize: false, compare: false)
  @nullable
  StreamSubscription get streamSubscription;

  @BuiltValueField(serialize: false, compare: false)
  Observable<T> get snapshotObservable;

  @BuiltValueField(serialize: false, compare: false)
  BuiltList<int> get listeners;

}

@BuiltValue(instantiable: false)
abstract class FSDocument<T> implements FS<T>{

  @BuiltValueField(serialize: false, compare: false)
  DocumentReference get docRef;

  void update(T updated) => docRef.updateData(standardSerializers.serialize(updated)).catchError(print);

//  @override
  Observable<T> get snapshotObservable => Observable(Firestore.instance.document(docRef.path).snapshots().asyncMap((ds) => standardSerializers.deserialize(ds.data)));
}

@BuiltValue(instantiable: false)
abstract class FSMonoCollection<T> {
  @BuiltValueField(serialize: false, compare: false)
  CollectionReference get collectionRef;
//  void update(T updated) => collectionRef.updateData(standardSerializers.serialize(updated)).catchError(print); // FIXME
//  Observable<T> get snapshotObservable => Observable(Firestore.instance.document(docRef.path).snapshots().asyncMap((ds) => standardSerializers.deserialize(ds.data)));
}

@BuiltValue(instantiable: false)
abstract class FSMultiCollection<T> {
  @BuiltValueField(serialize: false, compare: false)
  CollectionReference get collectionRef;
//  void update(T updated) => collectionRef.updateData(standardSerializers.serialize(updated)).catchError(print); // FIXME
//  Observable<T> get snapshotObservable => Observable(Firestore.instance.document(docRef.path).snapshots().asyncMap((ds) => standardSerializers.deserialize(ds.data)));
}

@BuiltValue(instantiable: false)
abstract class FSCollection<T> {
  @BuiltValueField(serialize: false, compare: false)
  CollectionReference get collectionRef;
//  void update(T updated) => collectionRef.updateData(standardSerializers.serialize(updated)).catchError(print); // FIXME
//  Observable<T> get snapshotObservable => Observable(Firestore.instance.document(docRef.path).snapshots().asyncMap((ds) => standardSerializers.deserialize(ds.data)));
}

//abstract class GenericFSDocument with FSDocument<dynamic> implements Built<GenericFSDocument, GenericFSDocumentBuilder> {
//  GenericFSDocument._();
//  factory GenericFSDocument([updates(GenericFSDocumentBuilder b)]) = _$GenericFSDocument;
//}


@BuiltValue() // don't know what this does... // https://github.com/google/built_value.dart/issues/386
abstract class FSDiary with FSDocument<FoodRecord> implements Built<FSDiary, FSDiaryBuilder> {
  String get userId;
  String get diaryRecordId;

  @override
  DocumentReference get docRef => Firestore.instance.document('users/$userId');

  FSDiary._();
  factory FSDiary([updates(FSDiaryBuilder b)]) = _$FSDiary;
}

//  factory FSDiary([updates(FSDiaryBuilder b)]) => _$FSDiary((b) => b
//      ..sub = snapshotObservable.listen((fr) => print(fr))
//  );

//typedef F = List<T> Function<T>(T);
//typedef F =  Function(int);