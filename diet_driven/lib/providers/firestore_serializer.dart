/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';

/// Generic Firestore document/collection helpers for serialization and deserialization.
/// https://github.com/dart-lang/sdk/blob/master/pkg/dev_compiler/doc/GENERIC_METHODS.md

/// Serializes a single [T] into Firestore document JSON.
/// Can't use compute as it raises 'Concurrent modification during iteration' exception.
Object serializeDocument<T>(T object) {
  assert(object != null);

  return jsonSerializers.serialize(object);
}

/// Deserialization transform on Firestore document stream.
/// Optimized by creating own computation isolate using compute.
///
/// Throws [DeserializationError] if Firestore data is corrupt.
StreamTransformer<DocumentSnapshot, T> deserializeDocumentTransform<T>() =>
  StreamTransformer<DocumentSnapshot, T>.fromHandlers(
    handleData: (DocumentSnapshot snapshot, EventSink<T> sink) async {
      if (snapshot != null && snapshot.data != null) {
        sink.add(await compute(_computeDeserializeDocument, snapshot));
      }
    },
    handleError: (Object error, StackTrace stackTrace, EventSink<T> sink) {
      LoggingBloc().unexpectedError("Deserialization document transform failed", error, stackTrace);
    }
  );

/// Deserialization transform on Firestore collection stream.
/// Optimized by creating own computation isolate using compute.
///
/// Throws [DeserializationError] if Firestore data is corrupt.
StreamTransformer<QuerySnapshot, BuiltList<T>> deserializeCollectionTransform<T>() =>
  StreamTransformer<QuerySnapshot, BuiltList<T>>.fromHandlers(
    handleData: (QuerySnapshot snapshot, EventSink<BuiltList<T>> sink) async {
      if (snapshot != null && snapshot.documents.isNotEmpty) {
        // Deserialize each document
        sink.add(BuiltList<T>.from(await compute(_computeDeserializeCollection, snapshot)));
      }
    },
    handleError: (Object error, StackTrace stackTrace, EventSink<BuiltList<T>> sink) {
      LoggingBloc().unexpectedError("Deserialization collection transform failed", error, stackTrace);
    }
  );

/// Inserts Firestore document id into [doc] as `_id` field.
///
/// Throws [NoSuchMethodError] if [doc] or [doc.data] is null.
Map<String, dynamic> _dataWithId(DocumentSnapshot doc) => doc.data..putIfAbsent("_id", () => doc.documentID);

/// Must be top-level function for compute.
T _computeDeserializeDocument<T>(DocumentSnapshot snapshot) {
  return jsonSerializers.deserialize(_dataWithId(snapshot));
}

/// OPTIMIZE: create BuiltList from within compute!
/// Must be top-level function for compute.
List<T> _computeDeserializeCollection<T>(QuerySnapshot snapshot) {
  return snapshot.documents.map<T>((snap) => jsonSerializers.deserialize(_dataWithId(snap))).toList();
  // .toList() is necessary for List<T>
}
