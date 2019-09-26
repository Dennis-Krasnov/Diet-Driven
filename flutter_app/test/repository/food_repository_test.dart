/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';

import '../test_utils.dart';

void main() {
  FoodRepository sut;

  /// Mocks
  CloudFunctions cloudFunctions;

  /// Data
  final expectedSearchResult = SearchResult((b) => b
    ..foods = ListBuilder(<FoodRecord>[
      FoodRecord.random(),
      FoodRecord.random(),
      FoodRecord.random(),
    ])
    ..pagination = 2
  );

  /// Configuration
  setUp(() {
    BlocSupervisor.delegate = LoggingBlocDelegate();

    cloudFunctions = MockCloudFunctions();

    sut = FoodRepository(cloudFunctions: cloudFunctions);
  });

  /// Tests
  group("Search foods", () {
    test("Succesfully search", () async {
      final result = MockHttpsCallableResult();
      when<dynamic>(result.data).thenReturn(jsonSerializers.serialize(expectedSearchResult));

      final callable = MockHttpCallable();
      when(callable.call(any)).thenAnswer((_) => Future.value(result));

      when(cloudFunctions.getHttpsCallable(functionName: anyNamed("functionName"))).thenReturn(callable);

      expect(await sut.searchFoodsByQuery("apple"), expectedSearchResult); // TODO: specify page
      verify(cloudFunctions.getHttpsCallable(functionName: "searchFoodsByQuery")).called(1);
      verify(callable(<String, dynamic>{"query": "apple"})).called(1);
    });

    test("Fail on search error", () {
      final callable = MockHttpCallable();
      when(callable.call(any)).thenThrow(eventFailedException);

      when(cloudFunctions.getHttpsCallable(functionName: anyNamed("functionName"))).thenReturn(callable);

      expect(sut.searchFoodsByQuery("apple"), throwsException); // TODO: specify page
      verify(cloudFunctions.getHttpsCallable(functionName: "searchFoodsByQuery")).called(1);
      verify(callable(<String, dynamic>{"query": "apple"})).called(1);
    });
  });

  group("Fetch autocomplete suggestions", () {
    test("Succesfully suggest", () async {
      final result = MockHttpsCallableResult();
      when<dynamic>(result.data).thenReturn(["Apples", "Apple pie"]);

      final callable = MockHttpCallable();
      when(callable.call(any)).thenAnswer((_) => Future.value(result));

      when(cloudFunctions.getHttpsCallable(functionName: anyNamed("functionName"))).thenReturn(callable);

      expect(await sut.fetchAutocompleteSuggestions("appl"), BuiltList<String>(<String>["Apples", "Apple pie"]));
      verify(cloudFunctions.getHttpsCallable(functionName: "foodSuggestions")).called(1);
      verify(callable("appl")).called(1);
    });

    test("Fail on suggest error", () {
      final callable = MockHttpCallable();
      when(callable.call(any)).thenThrow(eventFailedException);

      when(cloudFunctions.getHttpsCallable(functionName: anyNamed("functionName"))).thenReturn(callable);

      expect(sut.fetchAutocompleteSuggestions("appl"), throwsException);
      verify(cloudFunctions.getHttpsCallable(functionName: "foodSuggestions")).called(1);
      verify(callable("appl")).called(1);
    });
  });
}
