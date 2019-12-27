/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:flutter/material.dart';

extension StringExtensions on String {
  // NULLABLE
  Color get colour => Color(num.tryParse(this));
}