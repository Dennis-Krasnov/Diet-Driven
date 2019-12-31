/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

import 'package:diet_driven/models/models.dart';

part 'search_result.g.dart';

/// ...
abstract class SearchResult implements Built<SearchResult, SearchResultBuilder> {
  static Serializer<SearchResult> get serializer => _$searchResultSerializer;

  /// ...
  BuiltList<FoodRecord> get foods;

  /// ...
  int get pagination;

  factory SearchResult([void Function(SearchResultBuilder) updates]) = _$SearchResult;
  SearchResult._();
}
