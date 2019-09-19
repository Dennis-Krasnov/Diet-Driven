/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:cloud_functions/cloud_functions.dart';

import 'package:diet_driven/models/models.dart';

/// Data access object for food search and nutritional information.
class FoodRepository {
  final CloudFunctions _cloudFunctions;

  // Dependency injection
  FoodRepository({CloudFunctions cloudFunctions}) : _cloudFunctions = cloudFunctions ?? CloudFunctions.instance;

  /// Fetches result of an arbitrary text query from a nutrition database.
  ///
  /// Throws [CloudFunctionsException] if cloud functions fails.
  /// Throws [Exception] is function couldn't be called.
  Future<SearchResult> searchFoodsByQuery(String query) async {
    assert(query != null && query.isNotEmpty);

    // TODO: memoize results using https://pub.dev/packages/memoize

    final result = await _cloudFunctionCurry("searchFoodsByQuery")({"query": query});
    return jsonSerializers.deserialize(result.data);
  }

  /// Fetches [BuiltList] of relevant food search suggestions based on [query].
  ///
  /// Throws [CloudFunctionsException] if cloud functions fails.
  /// Throws [Exception] is function couldn't be called.
  Future<BuiltList<String>> fetchAutocompleteSuggestions(String query) async {
    assert(query != null && query.isNotEmpty);

    // TODO: memoize suggestions using https://pub.dev/packages/memoize
    final result = await _cloudFunctionCurry("foodSuggestions")(query);
    return BuiltList<String>.from(result.data);
  }

  // TODO: natural language processing using edamam / fat secret

  // TODO: by UPC barcode ...

  /// Function curry for easy use of cloud functions.
  /// eg. final result = await _cloudFunction("functionName")({"arg": value});
  HttpsCallable _cloudFunctionCurry(String functionName, [int timeoutSeconds = 10]) =>
    _cloudFunctions.getHttpsCallable(functionName: functionName)
    ..timeout = Duration(seconds: timeoutSeconds);
}
