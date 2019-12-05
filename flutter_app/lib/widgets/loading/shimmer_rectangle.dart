/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerRectangle extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerRectangle({Key key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
        ),
      ),
      baseColor: Colors.grey[200],
      highlightColor: Colors.grey[100],
    );
  }
}
