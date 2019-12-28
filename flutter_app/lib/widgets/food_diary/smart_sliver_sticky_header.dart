/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:diet_driven/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

/// ...
class SmartSliverStickyHeader extends StatelessWidget {
  /// The index of the sticky sliver header.
  final int index;

  /// Called to build the [SliverSticky]'s header.
  ///
  /// This function is called when the [SliverStickyHeader]'s header scroll percentage changes.
  final Widget Function(BuildContext context, bool isVisible) builder;

  /// The sliver to display after the header.
  final Widget sliver;

  const SmartSliverStickyHeader({Key key, this.index, this.builder, this.sliver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeaderBuilder(
      builder: (context, state) {
        // ...
        if (state.isPinned) {
          // ...
          BlocProvider.of<FoodDiaryScrollBloc>(context).add(state.scrollPercentage > 0 ? index + 1 : index);
          // TODO: part of state/event!
          FoodDiaryScrollBloc.scrollPercentage = state.scrollPercentage;
        }

        return BlocBuilder<FoodDiaryScrollBloc, int>(
          builder: (BuildContext context, int currentMealIndex) => builder(context, index == currentMealIndex),
        );
      },
      sliver: sliver,
    );
  }
}
