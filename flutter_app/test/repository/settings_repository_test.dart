/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../test_utils.dart';

void main() {
//  SettingsRepository sut;
//
//  /// Mocks
//  Firestore firestore;
//
//  /// Data
//  final expectedSettings = Settings((b) => b
//
//  );
//
//  /// Configuration
//  setUp(() {
//    BlocSupervisor.delegate = LoggingBlocDelegate();
//
//    firestore = MockFirestore();
//
//    sut = SettingsRepository(firestore: firestore);
//  });
//
//  /// Tests
//  group("Stream default settings", () {
//    test("Succesfully ???", () async {
//      // FIXME: needs to be primitive to be accepted in compute.
//      final docRef = MockDocumentReference();
//      when(docRef.snapshots()).thenAnswer((_) => Stream.fromIterable([
////        docSnap1,
//        DocSnap("default_settings", jsonSerializers.serialize(expectedSettings))
//      ]));
//
//      when(firestore.document("config/default_settings")).thenReturn(docRef);
//
//      // FIXME
////      expectLater(
////        sut.defaultSettings$(),
////        emitsInOrder(<Settings>[
////          expectedSettings
////        ])
////      );
//
//      sut.defaultSettings$().listen(print);
////      expect(await sut.defaultSettings$().first, expectedSettings);
//
//
////      final result = MockHttpsCallableResult();
////      when<dynamic>(result.data).thenReturn(jsonSerializers.serialize(expectedSearchResult));
////
////      final callable = MockHttpCallable();
////      when(callable.call(any)).thenAnswer((_) => Future.value(result));
////
////      when(cloudFunctions.getHttpsCallable(functionName: anyNamed("functionName"))).thenReturn(callable);
////
////      expect(await sut.searchFoodsByQuery("apple"), expectedSearchResult); // TODO: specify page
////      verify(cloudFunctions.getHttpsCallable(functionName: "searchFoodsByQuery")).called(1);
////      verify(callable(<String, dynamic>{"query": "apple"})).called(1);
//    });
//
//    test("Fail on ??? error", () {
//
//    });
//  });
}

// TODO: create fake, https://pub.dev/packages/mockito
//class DocSnap implements DocumentSnapshot {
//  final String id;
//  final Map<String, dynamic> d;
//
//  DocSnap(this.id, this.d);
//
//  @override
//  dynamic operator [](String key) {
//    return null;
//  }
//
//  @override
//  Map<String, dynamic> get data => d;
//
//  @override
//  String get documentID => id;
//
//  @override
//  bool get exists => null;
//
//  @override
//  SnapshotMetadata get metadata => null;
//
//  @override
//  DocumentReference get reference => null;
//}
