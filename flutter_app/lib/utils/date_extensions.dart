/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

extension IntegerDateUtilsExtensions on int {
  /// ...
  DateTime get asDateTime => DateTime(1970).toLocal().add(Duration(days: this));

/// doesn't work...
//  static int today() => null;
}

extension DateTimeDateUtils on DateTime {
  /// ...
  DateTime get today => null;

  /// ...
  int get asInt => toLocal().difference(DateTime(1970).toLocal()).inDays;
}