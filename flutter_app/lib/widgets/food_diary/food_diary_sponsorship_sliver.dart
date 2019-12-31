/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class DiarySponsorshipSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeaderBuilder(
      builder: (context, state) => Container(),
      sliver: SliverList(
        delegate: SliverChildListDelegate([]),
      ),
    );
  }
}