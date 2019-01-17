//library built_firestore;

import 'dart:async';
import 'dart:collection';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Connection<T> {
  String path;
  bool get isConnected;
// stream controller...

  void connect();
  void disconnect();

  Function(T data) onData;
  Function(dynamic error) onError;

  @override
  bool operator ==(other) {
    if (other is Connection) {
      return path == other.path;
    }
    return false;
  }

  @override
  int get hashCode {
    return path.hashCode;
  }


//   Function() onConnectionSuccess;
//   Function(dynamic error) onConnectionError;


}

// LOGIC WITH REFLECTION
class _DocConnection<T> extends Connection<T> {
//   String get path => "test document";
  bool get isConnected => true;

//  _DocConnection(String path) : this.path = path; // can't do this either (equivalent to below)
//  _DocConnection(this.path); // can't do this

  // must explicitly set parent's attributes
  _DocConnection(String path, Function(T data) onData, Function(dynamic error) onError) {
    this.path = path;
    this.onData = onData;
    this.onError = onError;
    print("document path is $path");
  }

  @override
  void connect() {
    // TODO: implement connect
  }

  @override
  void disconnect() {
    // TODO: implement disconnect
  }
}

class _CollectionConnection<T> extends Connection<T> {
//   String get path => "test collection";
  bool get isConnected => true;

  _CollectionConnection(String path) {
    this.path = path;
    this.onData = (data) => print("DATA RECEIVED");
    this.onError = (error) => print("FAILED TO RECEIVE DATA");
    print("collection path is $path");
  }

  @override
  void connect() {
    // TODO: implement connect
  }

  @override
  void disconnect() {
    // TODO: implement disconnect
  }
}

// LOGIC WITH FIRESTORE

class FSDocument<T> extends _DocConnection<T> {
  // only advantage of mixin is to combine multiple, otherwise can hardcode!

  FSDocument(String path) : super(path, (data) => print("DATA RECEIVED"), (error) => print("DATA ERROR"));



//   FSDocument(path) // make mixin have the constructor?
}

class FSCollection<T> extends _CollectionConnection<T> {
  FSCollection(String path) : super(path);
}

// OUTSIDE OF LIBRARY - CREATE CUSTOM LISTENERS - extend fsDocument, etc...

class UserInfoListener<int> extends FSDocument<int> {
  UserInfoListener(String path) : super(path);

  UserInfoListener.fromId(String id) : super("users/$id");
//   const UserInfoListener._() : super._();
}


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
