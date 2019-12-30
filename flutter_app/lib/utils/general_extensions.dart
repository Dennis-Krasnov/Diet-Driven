/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

extension RangeExtensions on int {
  /// ... [0, end)
  /// eg. for (final i in 10.range)
  List<int> get range => List<int>.generate(this, (i) => i);

  /// ... [start, end)
  /// eg. for (final i in 10.rangeFrom(5))
  List<int> rangeFrom(int start) => List<int>.generate(this - start, (i) => i + start);
}

extension HexCodeExtensions on int {
  /// ...
  String get asHexNumber => "0x${toRadixString(16).padLeft(8, '0')}";
}