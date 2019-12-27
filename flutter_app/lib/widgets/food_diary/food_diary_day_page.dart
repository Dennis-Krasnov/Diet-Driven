/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:bloc_logging/bloc_logging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/widgets/extensions/extensions.dart';
import 'package:diet_driven/widgets/food_diary/food_diary.dart';
import 'package:diet_driven/widgets/no_scroll_behaviour.dart';

/// Shows single diary day.
class FoodDiaryDayPage extends StatefulWidget {
  @override
  _FoodDiaryDayPageState createState() => _FoodDiaryDayPageState();
}

class _FoodDiaryDayPageState extends State<FoodDiaryDayPage> {
  /// Must be stateful widget to persist scroll controller state throughout builds.
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodDiaryDayBloc, FoodDiaryDayState>(
      builder: (BuildContext context, FoodDiaryDayState foodDiaryDayState) {
        BlocLogger().ui("Food diary day #${BlocProvider.of<FoodDiaryDayBloc>(context).date} rebuild");

        // White screen with skeleton food records
        if (foodDiaryDayState is FoodDiaryDayUninitialized) {
          // TODO: skeleton page
          return Container(child: Center(child: Text(BlocProvider.of<FoodDiaryDayBloc>(context).state.toString()),),);
        }

        // Food diary day is loaded from now on
        assert(foodDiaryDayState is FoodDiaryDayLoaded);
        final loadedState = foodDiaryDayState as FoodDiaryDayLoaded;

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            // Only scroll correct on end of scroll
            if (notification is ScrollEndNotification) {
              // Only scroll correct if pinned sticky header isn't fully visible and not currently correcting correcting
              if (FoodDiaryScrollBloc.scrollPercentage != 0 && !FoodDiaryScrollBloc.isScrolling) {
                FoodDiaryScrollBloc.isScrolling = true;

                final pinnedHeaderStillVisible = (1 - FoodDiaryScrollBloc.scrollPercentage) * 30;
                _controller.snapBy(pinnedHeaderStillVisible);
              }
              else if (FoodDiaryScrollBloc.isScrolling) {
                FoodDiaryScrollBloc.isScrolling = false;
              }
            }

            // Let other scroll notification listeners handle [notification]
            return false;
          },
          child: ScrollConfiguration(
            behavior: NoScrollBehaviour(),
            child: CustomScrollView(
              controller: _controller,
              slivers: <Widget>[
                DailyNutritionStatsSliver(),
                for (final mealInfoKV in loadedState.diet.meals.enumerate) ...[
                  FoodDiaryMealSliver(
                    mealIndex: mealInfoKV.key,
                    mealInfo: mealInfoKV.value,
                    // TODO: mealData: loadedState.foodDiaryDay?.meals?.[mealInfoKV.key],
                    mealData: loadedState.foodDiaryDay == null ? null : loadedState.foodDiaryDay.meals[mealInfoKV.key],
                  ),
                ]
              ],
            ),
          ),
        );
      }
    );
  }
}


// TODO: don't show swipeable page view until diary is loaded! - OR MAKE GOOD SKELETON PAGE!