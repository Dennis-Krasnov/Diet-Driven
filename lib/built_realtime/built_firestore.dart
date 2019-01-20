library built_firestore;

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:ui';

import 'package:built_value/built_value.dart';
//import 'package:built_value/serializer.dart';
//import 'package:built_value/standard_json_plugin.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_driven/models/food_record.dart';
import 'package:diet_driven/models/serializers.dart';
import 'package:diet_driven/models/uncertainty.dart';
import 'package:rxdart/rxdart.dart';

part 'built_firestore.g.dart';

mixin AutoSerializable<T> {

}

// TODO: store Document for key!!

//<T extends ???> // recursion with generic types if I try to specify in terms of T, D
//abstract class Document<T> with AutoSerializable<T> {
//
//}
//
//abstract class Collection<T> with AutoSerializable<T> {
//
//}


//mixin Firestore<T> {
////  Observable<DocumentSnapshot> get answer => null;
//  Observable<T> get snapshotObservable => null;
//
//  void connect(String path);
////  {
//////    Firestore.instance;
////  }
//
//  @override
//  String toString() => '[ $runtimeType ]';
//}

//mixin FirestoreDocument<T> on Firestore<T> {
//   @override
//   Observable<T> get snapshotObservable {
//     var value = super.snapshotObservable;
//     return value;
//   }



//  @override
//  void connect(String path) {
////    Firestore.instance.
//  }
//}

abstract class FS<T> {
  @nullable
  Observable<T> get snapshotObservable;

  void connect(String path);
}

abstract class FirestoreDocument<T> { /// or implements? with FS<T>  // mixin can't extend other classes....
  Observable<T> get snapshotObservable;

  void connect(String path) {
    Firestore.instance.document(path);
  }
}

// mixin LoggingAnswerMixin on AnswerMixin {
//   @override
//   int get answer {
//     var value = super.answer;
//     print('  LOG: `answer` property was accessed');
//     return value;
//   }
// }

/// TODO: EXTEND FIRESTORE MIXIN FOR FSDOCUMENT, FSMONOCOLLECTION, ETC!!!

//class FSDocument<T> extends Document<T> with Firestore {
//
//}
//
//class FSMonoCollection<T> extends Document<T> with Firestore {
//
//}
//
//class FSCollection<T> extends Collection<T> with Firestore {
//
//}

/////////////////////

/// Solution TODO: add an empty mixin - Firestore (Document?) - use it as the base class for storing it in store!!

@BuiltValue(instantiable: false)
abstract class FSBASE<T> {
//  void boopboop(T data){
  void boopboop(T data){
    print(data);
    print(":)");
  }

//  Observable<FoodRecord> get snapshotObservable =>
//      Observable(Firestore.instance.document('users/0WjbQ1XzVCe1zvwHgE4aluu4FiC3').snapshots()).map((qs) => FoodRecord((b) => b
////          ..foodName = qs.data.forEach(f)
//          ..foodName = qs.data["sex"]
//          ..grams = 2
//          ..uncertainty = Uncertainty.accurate
//      ));


  Observable<FoodRecord> get snapshotObservable =>
//      JSON.encode(serializers.serialize(login))
//      Observable(Firestore.instance.document('users/0WjbQ1XzVCe1zvwHgE4aluu4FiC3').snapshots()).map((qs) => serializers.deserialize(json.encode(qs.data))
        Observable.empty();

//          T((b) => b
////          ..foodName = qs.data.forEach(f)
//        ..foodName = qs.data["sex"]
//        ..grams = 2
//        ..uncertainty = Uncertainty.accurate
//      )
//  );

//  Observable<FoodRecord> get snapshotObservable =>
//      Observable.range(1, 5).map((i) =>
//      new FoodRecord((b) => b
//        ..foodName = 'John Smith'
//        ..grams = i.toDouble()
//        ..uncertainty = Uncertainty.accurate));
}

//// //
//abstract class DiaryFSDocument with FirestoreDocument<FoodRecord> implements Built<DiaryFSDocument, DiaryFSDocumentBuilder> {
@BuiltValue() // don't know what this does... // https://github.com/google/built_value.dart/issues/386

abstract class DiaryFSDocument implements FSBASE<FoodRecord>, Built<DiaryFSDocument, DiaryFSDocumentBuilder> { /// MUST implement the methods - don't know if this is good...
//abstract class DiaryFSDocument with FSBASE<FoodRecord> implements Built<DiaryFSDocument, DiaryFSDocumentBuilder> { // allows to call super....

//}
//abstract class DiaryFSDocument extends FSDocument<FoodRecord> implements Built<DiaryFSDocument, DiaryFSDocumentBuilder>{
//  FirestoreDocument<FoodRecord> get observer = new O;

//  CollectionReference

  String get userId; // used for hash function!!
  String get diaryRecordId;


  @override
  void boopboop(FoodRecord data) {
//    super.boopboop(data);
    print(data);
    print(";/");
  }

  // allows for comparison in subscriptions





  void test() { // pass DiaryFSDocument, DiaryFSDocumentBuilder?
    print("---");
//    snapshotObservable.listen(print);
    var sub = snapshotObservable.listen(boopboop);

//    sub.cancel();

    /// POPULATE SETMULIMAP WITH FSDOCS, start/cancel listens whenever needed !!!! (don't have to remove observers when done!!)

    var temp = FoodRecord((b) => b
      ..foodName = "Apple"
      ..grams = 3
      ..uncertainty = Uncertainty.accurate
      ..sodium = 24.2
    );
//
////    serializers.toBuilder()..addPlugin(new StandardJsonPlugin())..build();
////    serializers.
////    SerializersBuilder.addPlugin(new StandardJsonPlugin());
//
//
//
//    var ser = standardSerializers.serialize(temp);
//    var jsoned = json.encode(standardSerializers.serialize(temp));
//
    print(temp);
//    print(ser);
//    print(jsoned);
//    print(json.decode(jsoned));


    Firestore.instance.document('users/0WjbQ1XzVCe1zvwHgE4aluu4FiC3').get().then((ds) {
      var real = standardSerializers.deserialize(ds.data);
      print(real);
      print(temp == real);
      print(ds.data);
      print(json.encode(ds.data));
      print(json.decode(json.encode(ds.data)));
    });
    print("---");
//    snapshotObservable.doOnData(print);
//    snapshotObservable.doOnData(boopboop);
  }

//  DiaryFSDocument(this.userId, this.diaryRecordId);
//  DiaryFSDocument(String userId, String diaryRecordId) {
//   startConnection("users/$userId/records/$diaryRecordId");
//  }




  DiaryFSDocument._();
  factory DiaryFSDocument([updates(DiaryFSDocumentBuilder b)]) = _$DiaryFSDocument;

  @override
  Observable<FoodRecord> get snapshotObservable {
      return Observable.empty();
//    return Observable(Firestore.instance.document('users/0WjbQ1XzVCe1zvwHgE4aluu4FiC3').snapshots()).map((qs) => FoodRecord((b) => b
////          ..foodName = qs.data.forEach(f)
//      ..foodName = qs.data["sex"]
//      ..grams = 3
//      ..uncertainty = Uncertainty.accurate
//    ));
  }

}

//abstract class Test implements Built<Test, TestBuilder> {
//  Test._();
//  factory Test([updates(TestBuilder b)]) = _$Test;
//}


//@BuiltValue(instantiable: false)
//abstract class AutoSerializer<T> {
//  T get id;
//}
//
////abstract class Document implements Built<Document, DocumentBuilder> { // AutoSerializer<String>,
//@BuiltValue(instantiable: false)
//abstract class Document<T> { // AutoSerializer<String>, // extends Built<T, Builder<T, B>>, B extends Builder<V, B>
//  Observable<T> observable;
//
////  factory Document() => new _$Document._(
////    foodName: "",
////    uncertainty: Uncertainty.accurate,
////    grams: 0,
////  );
//
////  Document._();
//}
//
//class FSDoc extends Document<String> implements Built<FSDoc, FSDocBuilder>{
////class FSDoc implements Document<String> {
////  @override
////  Observable<String> observable;
//
//  factory FSDoc() => new FSDoc._();
//
//  FSDoc._();
//
//  @override
//  FSDoc rebuild(Function(builder) updates) {
//    // TODO: implement rebuild
//    return null;
//  }
//
//  @override
//  toBuilder() {
//    // TODO: implement toBuilder
//    return null;
//  }
//
//}

//class FirestoreDocument extends Document {
//  factory FirestoreDocument() => new _$FirestoreDocument._();
//
//  FirestoreDocument._();
//
//  @override
//  Document rebuild(Function(DocumentBuilder builder) updates) {
//    // TODO: implement rebuild
//    return null;
//  }
//
//  @override
//  DocumentBuilder toBuilder() {
//    // TODO: implement toBuilder
//    return null;
//  }
//
//}

//abstract class Collection implements Built<Collection, CollectionBuilder> {
//  factory Collection() => new _$Collection._(
////    foodName: "",
////    uncertainty: Uncertainty.accurate,
////    grams: 0,
//  );
//
//  Collection._();
//}

//abstract class CyclePageVM implements Built<CyclePageVM, CyclePageVMBuilder> {
//  BuiltMap<Connection, List<int>> get subscriptions;
//  BuiltList<int> get widgets;
//
//  CyclePageVM._();
//
//  factory CyclePageVM([updates(CyclePageVMBuilder b)]) = _$CyclePageVM;
//}
//
//CyclePageVM((b) => b
////      ..subscriptions = state.subscriptions.toMap()
//..subscriptions = state.subscriptions.toBuilder()
//..widgets = state.widgets.toBuilder()
//);

//abstract class Connection<T> { // implements Built<Connection, ConnectionBuilder> //TODO: this is basically an observable... use
//  String path;
//  bool get isConnected;
//// stream controller...
//
//  void connect();
//  void disconnect();
//
//  Function(T data) onData;
//  Function(dynamic error) onError;

///  Connection._();

///  factory Connection([updates(ConnectionBuilder b)]) = _$Connection;

//  @override
//  bool operator ==(other) {
//    if (other is Connection) {
//      return path == other.path;
//    }
//    return false;
//  }
//
//  @override
//  int get hashCode {
//    return path.hashCode;
//  }


//   Function() onConnectionSuccess;
//   Function(dynamic error) onConnectionError;


//}

// only difference between doc and collection is how reflection logic works (either a dynamic list or all of same type)
// LOGIC WITH REFLECTION
//class _DocConnection<T> extends Connection<T> {
////   String get path => "test document";
//  bool get isConnected => true;
//
////  _DocConnection(String path) : this.path = path; // can't do this either (equivalent to below)
////  _DocConnection(this.path); // can't do this
//
//  // must explicitly set parent's attributes
//  _DocConnection(String path, Function(T data) onData, Function(dynamic error) onError) {
//    this.path = path;
//    this.onData = onData;
//    this.onError = onError;
//    print("document path is $path");
//  }
//
//  @override
//  void connect() {
//    // TODO: implement connect
//  }
//
//  @override
//  void disconnect() {
//    // TODO: implement disconnect
//  }
//}
//
//class _CollectionConnection<T> extends Connection<T> {
////   String get path => "test collection";
//  bool get isConnected => true;
//
//  _CollectionConnection(String path) {
//    this.path = path;
//    this.onData = (data) => print("DATA RECEIVED");
//    this.onError = (error) => print("FAILED TO RECEIVE DATA");
//    print("collection path is $path");
//  }
//
//  @override
//  void connect() {
//    // TODO: implement connect
//  }
//
//  @override
//  void disconnect() {
//    // TODO: implement disconnect
//  }
//}
//
//// LOGIC WITH FIRESTORE
//
//class FSDocument<T> extends _DocConnection<T> {
//  // only advantage of mixin is to combine multiple, otherwise can hardcode!
//
//  FSDocument(String path) : super(path, (data) => print("DATA RECEIVED"), (error) => print("DATA ERROR"));
//
//
//
////   FSDocument(path) // make mixin have the constructor?
//}
//
//class FSCollection<T> extends _CollectionConnection<T> {
//  FSCollection(String path) : super(path);
//}
//
//// OUTSIDE OF LIBRARY - CREATE CUSTOM LISTENERS - extend fsDocument, etc...
//
//class UserInfoListener<int> extends FSDocument<int> {
//  UserInfoListener(String path) : super(path);
//
//  UserInfoListener.fromId(String id) : super("users/$id");
////   const UserInfoListener._() : super._();
//}


// class UserInfoListener<T> extends _DocConnection<T> with Firestore {
//   const UserInfoListener._() : super._();
// }

//void main() {
////   Connection conn = new FSDocument<String>("users/jerry");
//  Connection conn = UserInfoListener("users/jerry");
//  print(conn.path);
//  conn = UserInfoListener.fromId("1245235235wefsdar214");
//  print(conn.path);
//}

// // Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// // for details. All rights reserved. Use of this source code is governed by a
// // BSD-style license that can be found in the LICENSE file.

// mixin AnswerMixin {
//   int get answer => 42;

//   @override
//   String toString() => '[ $runtimeType ]';
// }

// class Answer with AnswerMixin {}

// void main() {
//   print('''
// *
// * Simple usage of `mixin`
// *
// ''');
//   printAnswer(Answer(), 'Use `with` to include a mixin');

//   print('''
// *
// * More advanced usage of `mixin`
// *
// ''');
//   printAnswer(
//       LogAnswer(),
//       'Include many mixins by separating with commas. '
//       '`$LoggingAnswerMixin` prints every time `answer` is accessed.');

//   print('''
// *
// * The order in which mixins are included matters.
// *
// ''');

//   printAnswer(LogVerifyAnswer(), 'In this case, log then verify.');
//   printAnswer(VerifyLogAnswer(), 'In this case, verify then log.');

//   print('''
// *
// * You can extend classes that include mixins, too.
// *
// ''');

//   printAnswer(DeltaLogVerifyAnswer(), 'Verify will fail.');
//   printAnswer(DeltaLogVerifyAnswer(1), 'Verify will succeed.');
// }

// void printAnswer(AnswerMixin obj, String description) {
//   print(obj);
//   print('- $description');
//   print('answer: ${obj.answer}');
//   print('');
// }

// /// [LoggingAnswerMixin] can only be used as a mixin when the superclass
// /// (or one of the mixins that comes before it in a "with" clause) implements
// /// [AnswerMixin].
// mixin LoggingAnswerMixin on AnswerMixin {
//   @override
//   int get answer {
//     var value = super.answer;
//     print('  LOG: `answer` property was accessed');
//     return value;
//   }
// }

// class LogAnswer with AnswerMixin, LoggingAnswerMixin {}

// mixin VerifyingAnswerMixin on AnswerMixin {
//   @override
//   int get answer {
//     var value = super.answer;
//     if (value == 42) {
//       print('  VERIFY: Invalid Result!');
//     } else {
//       print('  VERIFY: valid result');
//     }
//     return value;
//   }
// }

// class LogVerifyAnswer
//     with AnswerMixin, LoggingAnswerMixin, VerifyingAnswerMixin {}

// class VerifyLogAnswer
//     with AnswerMixin, VerifyingAnswerMixin, LoggingAnswerMixin {}

// abstract class DeltaAnswer with AnswerMixin {
//   final int delta;

//   DeltaAnswer(this.delta);

//   @override
//   int get answer => super.answer + delta;
// }

// class DeltaLogVerifyAnswer extends DeltaAnswer
//     with LoggingAnswerMixin, VerifyingAnswerMixin {
//   DeltaLogVerifyAnswer([int delta = 0]) : super(delta);
// }
