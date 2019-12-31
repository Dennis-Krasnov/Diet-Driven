/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';

extension ListExtensions on List {
  /// ...
  Iterable<MapEntry<int, dynamic>> get enumerate => asMap().entries;
}

extension BuiltListExtensions on BuiltList {
  /// ...
  Iterable<MapEntry<int, dynamic>> get enumerate => asMap().entries;
}

extension BuiltMapExtensions<K, V> on Map<K, V> {
  BuiltMap<K, V> toBuiltMap() => BuiltMap<K, V>(this);

  MapBuilder<K, V> toMapBuilder() => MapBuilder<K, V>(this);
}

extension BuiltCollectionExtensions<T> on Iterable<T> {
//  BuiltList<T> toBuiltList() => BuiltList<T>(this);
//  BuiltSet<T> toBuiltSet() => BuiltSet<T>(this);
//
//  ListBuilder<T> toListBuilder() => ListBuilder<T>(this);
//  SetBuilder<T> toSetBuilder() => SetBuilder<T>(this);
}