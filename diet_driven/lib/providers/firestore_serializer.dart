import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/models/models.dart';

/// Generic Firestore document helper for serialization and deserialization.
class FirestoreSerializer<T> {
  /// Inserts Firestore document id into [doc] as `_id` field.
  ///
  /// Throws [NoSuchMethodError] if [doc] or [doc.data] is null.
  Map<String, dynamic> _dataWithId(DocumentSnapshot doc) => doc.data..putIfAbsent("_id", () => doc.documentID);

  /// Serializes a single [T] into Firestore document JSON.
  ///
  /// TODO: check possible errors with null, etc
  Object serializeDocument(T object) {
    assert(object != null);

    return jsonSerializers.serialize(object);
  }

  /// ...
  ///
  /// Throws [DeserializationError] if Firestore data is corrupt.
  T _deserializeDocument(DocumentSnapshot snapshot) => jsonSerializers.deserialize(_dataWithId(snapshot));

  /// Deserialization transform on Firestore document stream.
  ///
  /// Throws [DeserializationError] if Firestore data is corrupt.
  StreamTransformer<DocumentSnapshot, T> deserializeDocumentTransform() =>
    StreamTransformer<DocumentSnapshot, T>.fromHandlers(
      handleData: (DocumentSnapshot snapshot, EventSink<T> sink) {
        if (snapshot != null && snapshot.data != null) {
          sink.add(_deserializeDocument(snapshot));
        }
      }
      // TODO: log on handleError
    );

  /// Deserialization transform on Firestore collection stream.
  ///
  /// Throws [DeserializationError] if Firestore data is corrupt.
  StreamTransformer<QuerySnapshot, BuiltList<T>> deserializeCollectionTransform() =>
    StreamTransformer<QuerySnapshot, BuiltList<T>>.fromHandlers(
      handleData: (QuerySnapshot snapshot, EventSink<BuiltList<T>> sink) {
        if (snapshot != null && snapshot.documents.isNotEmpty) {
          // Deserialize each document
          sink.add(BuiltList<T>.from(snapshot.documents.map<Object>(_deserializeDocument)));
        }
      }
      // TODO: log on handleError
    );

  // TODOCUMENT update comments
  /// Removes `$` field specifying type from serialized data to ensure consistency.
  /// Serializing single built value adds `$` field specifying type - {$: FoodRecord, foodName: Apple}
  /// Built value also serializes sub fields without `$` - foodName: Apple}
  /// [serializedValue] stored internally as [_InternalLinkedHashMap].
  Map<String, dynamic> removeDollarSign(Object serializedValue) {
    // https://github.com/flutter/flutter/issues/16589#issuecomment-390343331
    return Map<String, dynamic>.from(serializedValue)..remove("\$");
  }
}
