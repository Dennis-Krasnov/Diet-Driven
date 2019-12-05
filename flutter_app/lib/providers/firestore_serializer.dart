/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc_logging/bloc_logging.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:diet_driven/models/models.dart';

/// Generic Firestore document/collection extensions for serialization and deserialization.
/// https://github.com/dart-lang/sdk/blob/master/pkg/dev_compiler/doc/GENERIC_METHODS.md

extension FirestoreDocumentSnapshotDeserializationExtensions on Stream<DocumentSnapshot> {
  /// Deserialization on Firestore document stream.
  /// Optimized by creating own computation isolate using compute.
  ///
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<T> deserialize<T>() => transform(StreamTransformer<DocumentSnapshot, T>.fromHandlers(
    handleData: (DocumentSnapshot snapshot, EventSink<T> sink) async {
      if (snapshot != null && snapshot.data != null) {
        sink.add(await compute<DocumentSnapshot, T>(_computeDeserializeDocument, snapshot));
      }
    },
    handleError: (Object error, StackTrace stackTrace, EventSink<T> sink) {
      BlocLogger().unexpectedError("Deserialization document transform failed", error, stackTrace);
    }
  ));
}

extension FirestoreQuerySnapshotDeserializationExtensions on Stream<QuerySnapshot> {
  /// Deserialization on Firestore collection stream.
  /// Optimized by creating own computation isolate using compute.
  ///
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Stream<BuiltList<T>> deserialize<T>() => transform(StreamTransformer<QuerySnapshot, BuiltList<T>>.fromHandlers(
    handleData: (QuerySnapshot snapshot, EventSink<BuiltList<T>> sink) async {
      if (snapshot != null && snapshot.documents.isNotEmpty) {
        // Deserialize each document
        sink.add(BuiltList<T>.from(await compute(_computeDeserializeCollection, snapshot)));
      }
    },
    handleError: (Object error, StackTrace stackTrace, EventSink<BuiltList<T>> sink) {
      BlocLogger().unexpectedError("Deserialization collection transform failed", error, stackTrace);
    }
  ));
}


extension FirestoreDocumentExtensions on DocumentReference {
  /// ...
  Stream<T> deserialize<T>() => snapshots().deserialize<T>();

//  / Serializes a single [T] into Firestore document JSON.
//  / Can't use compute as it raises 'Concurrent modification during iteration' exception.
  /// ...
  Future<void> setSerialized(Object object, {bool merge = false}) => setData(
    jsonSerializers.serialize(object),
    merge: merge
  );
}

extension FirestoreCollectionExtensions on Query {
  /// ...
  Stream<BuiltList<T>> deserialize<T>() => snapshots().deserialize<T>();
}

/// Inserts Firestore document id into [doc] as `_id` field.
Map<String, dynamic> _dataWithId(DocumentSnapshot doc) => doc.data..putIfAbsent("_id", () => doc.documentID);

/// Must be top-level function for compute.
T _computeDeserializeDocument<T>(DocumentSnapshot snapshot) {
  return jsonSerializers.deserialize(_dataWithId(snapshot));
}

/// Must be top-level function for compute, isolates only work with primitive lists.
List<T> _computeDeserializeCollection<T>(QuerySnapshot snapshot) {
  return snapshot.documents.map<T>((snap) => jsonSerializers.deserialize(_dataWithId(snap))).toList();
}
