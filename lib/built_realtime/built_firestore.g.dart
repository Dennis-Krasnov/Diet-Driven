// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_firestore;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class FSBuilder<T> {
  void replace(FS<T> other);
  void update(void updates(FSBuilder<T> b));
  StreamSubscription get streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription);

  Observable<T> get snapshotObservable;
  set snapshotObservable(Observable<T> snapshotObservable);

  CollectionReference get parentCollection;
  set parentCollection(CollectionReference parentCollection);
}

abstract class FSDocumentBuilder<T> {
  void replace(FSDocument<T> other);
  void update(void updates(FSDocumentBuilder<T> b));
  DocumentReference get docRef;
  set docRef(DocumentReference docRef);

  StreamSubscription get streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription);
}

abstract class FSCollectionBuilder<T> {
  void replace(FSCollection<T> other);
  void update(void updates(FSCollectionBuilder<T> b));
  CollectionReference get colRef;
  set colRef(CollectionReference colRef);

  StreamSubscription get streamSubscription;
  set streamSubscription(StreamSubscription streamSubscription);
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
