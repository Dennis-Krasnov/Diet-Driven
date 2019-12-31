/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:intl/intl.dart';
import 'package:time/time.dart';

extension IntegerDateUtilsExtensions on int {
  /// ...
  DateTime get asDateTime => DateTime(1970).toLocal() + days;

  /// ...
  String get relativeString {
    final dt = asDateTime;
    final now = DateTime.now().toLocal();

    // Relative days
    if (this == (now - 1.days).asInt) {
      return "Yesterday";
    }
    if (this == now.asInt) {
      return "Today";
    }
    if (this == (now + 1.days).asInt) {
      return "Tommorrow";
    }

    // General case
    return DateFormat.yMMMd().format(dt);
  }
}

extension DateTimeDateUtils on DateTime {
  /// ...
  int get asInt => toLocal().difference(DateTime(1970).toLocal()).inDays;

  /// ...
  bool sameDayAs(DateTime other) => year == other.year && month == other.month && day == other.day;
}