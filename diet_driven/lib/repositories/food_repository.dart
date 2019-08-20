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
  final _cloudFunctionsProvider = CloudFunctionsProvider();

  /// Fetches [BuiltList] of relevant food search suggestions based on current [query].
  ///
  /// Throws [CloudFunctionsException] if cloud functions fails.
  /// Throws [Exception] is function couldn't be called.
  Future<BuiltList<String>> fetchFoodSearchSuggestions(String query) async {
    assert(query != null && query.isNotEmpty);

    // TODO: memoize suggestions using https://pub.dev/packages/memoize
    return _cloudFunctionsProvider.fetchFoodSearchSuggestions(query);
  }

  /// Fetches [BuiltList] of authenticated user's recent food records.
  ///
  /// Throws [CloudFunctionsException] if cloud functions fails.
  /// Throws [Exception] is function couldn't be called.
  Future<BuiltList<FoodRecord>> fetchRecentFoodRecords() async {
    return _cloudFunctionsProvider.fetchRecentFoodRecords();
  }
}
