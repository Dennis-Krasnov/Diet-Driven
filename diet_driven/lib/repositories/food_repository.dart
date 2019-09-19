/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/providers.dart';

/// Data access object for food search and nutritional information.
class FoodRepository {
  final CloudFunctionsProvider _cloudFunctions;

  // Dependency injection
  FoodRepository({CloudFunctionsProvider cloudFunctions}) : _cloudFunctions = cloudFunctions ?? CloudFunctionsProvider();

  /// Fetches result of an arbitrary text query from a nutrition database.
  ///
  /// Throws [CloudFunctionsException] if cloud functions fails.
  /// Throws [Exception] is function couldn't be called.
  Future<SearchResult> searchFoodsByQuery(String query) async {
    assert(query != null && query.isNotEmpty);

    // TODO: memoize results using https://pub.dev/packages/memoize
    return _cloudFunctions.searchFoodsByQuery(query);
  }

  /// Fetches [BuiltList] of relevant food search suggestions based on [query].
  ///
  /// Throws [CloudFunctionsException] if cloud functions fails.
  /// Throws [Exception] is function couldn't be called.
  Future<BuiltList<String>> fetchAutocompleteSuggestions(String query) async {
    assert(query != null && query.isNotEmpty);

    // TODO: memoize suggestions using https://pub.dev/packages/memoize
    return _cloudFunctions.fetchAutocompleteSuggestions(query);
  }

  // TODO: natural language processing using edamam / fat secret

  // TODO: by UPC barcode ...

}
