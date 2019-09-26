/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:math' as math;

import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/widgets/completer.dart';
import 'package:diet_driven/widgets/food_diary/food_diary.dart';

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({@required this.minHeight, @required this.maxHeight, @required this.child});

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
//    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

/// Shows single diary day.
class FoodDiaryDayPage extends StatelessWidget {
  // TODO: stateful widget???
  final GlobalKey<AnimatedCircularChartState> _chartKey = GlobalKey<AnimatedCircularChartState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<FoodDiaryDayBloc, FoodDiaryDayState>(
      listener: (BuildContext context, FoodDiaryDayState state) {
        if (state is FoodDiaryDayLoaded) {
          final NutrientMap totalNutrients = state.foodDiaryDay?.meals
              ?.expand<FoodRecord>((meal) => meal.foodRecords)
              ?.map<NutrientMap>((fr) => fr.totalNutrients)
              ?.reduce((curr, next) => curr + next);

          _chartKey?.currentState?.updateData(generatePieChart(totalNutrients, [Nutrient.protein, Nutrient.fat, Nutrient.carbs]));
        }
      },
      child: BlocBuilder<FoodDiaryDayBloc, FoodDiaryDayState>(
        builder: (BuildContext context, FoodDiaryDayState foodDiaryDayState) {
          LoggingBloc().verbose("Food diary day #${BlocProvider.of<FoodDiaryDayBloc>(context).date} rebuild");

          // White screen with skeleton food records
          if (foodDiaryDayState is FoodDiaryDayUninitialized) {
            // TODO: skeleton page
            return Container(child: Center(child: Text(BlocProvider.of<FoodDiaryDayBloc>(context).currentState.toString()),),);
          }

          // ????? failed TODOCUMENT - do I need a fail state??
//        if (foodDiaryDayState is FoodDiaryDayFailed) {}

          // Food diary day is loaded from now on
          assert(foodDiaryDayState is FoodDiaryDayLoaded);

          final loadedState = foodDiaryDayState as FoodDiaryDayLoaded;

          // TODO: bloc listener to update charts!!!
          final NutrientMap totalNutrients = loadedState.foodDiaryDay?.meals
            ?.expand<FoodRecord>((meal) => meal.foodRecords)
            ?.map<NutrientMap>((fr) => fr.totalNutrients)
            ?.reduce((curr, next) => curr + next);

          return CustomScrollView(
            slivers: <Widget>[
              // TODO: create custom sliver widget, all it does is stick to top like sliver app bar, and collapses when not scrolled to top
              SliverPersistentHeader(
                pinned: false,
                delegate: _SliverAppBarDelegate(
                  minHeight: 50, // size of nutrition header (40) plus padding (10)
                  maxHeight: 160,
                  // Must be ListView to stop overflow errors
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const NutritionHeader(
                        mealName: "Daily stats",
                        nutrients: [Nutrient.protein, Nutrient.fat, Nutrient.carbs], // TODO: dynamic from diary settings // TODO: 'headername' - shortform
                        stuckAmount: 0, // Always visible
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // ...
                          Expanded(
                            child: AnimatedCircularChart(
                              key: _chartKey,
                              size: const Size(110, 110),
//                              duration: const Duration(milliseconds: 0),
                              initialChartData: generatePieChart(totalNutrients ?? NutrientMap.random(), [Nutrient.protein, Nutrient.fat, Nutrient.carbs]),
                              chartType: CircularChartType.Pie,
                            ),
                          ),
                          for (var nutrient in [Nutrient.protein, Nutrient.fat, Nutrient.carbs])
                            SizedBox(
                              width: 60, // OPTIMIZE
                              child: Column(
                                children: <Widget>[
                                  const Text("23g"),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Divider(height: 8),
                                  ),
                                  const Text("23g"),
                                  const SizedBox(height: 8),
                                  AnimatedCircularChart(
                                    size: const Size(50, 50),
//                                    duration: const Duration(milliseconds: 0),
                                    initialChartData: generatePieChart(totalNutrients ?? NutrientMap.random(), [Nutrient.protein, Nutrient.fat, Nutrient.carbs]),
                                    chartType: CircularChartType.Pie,
                                  ),
                                ],
                              ),
                            ),
                          SizedBox(
                            width: 60, // OPTIMIZE
                            child: Column(
                              children: <Widget>[
                                const Text("232"),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Divider(height: 8),
                                ),
                                const Text("235"),
                                const SizedBox(height: 8),
                                AnimatedCircularChart(
                                  size: const Size(50, 50),
//                                  duration: const Duration(milliseconds: 0),
                                  initialChartData: generatePieChart(totalNutrients ?? NutrientMap.random(), [Nutrient.protein, Nutrient.fat, Nutrient.carbs]),
                                  chartType: CircularChartType.Pie,
                                ),
                              ],
                            )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                  return StickyHeaderBuilder(
                    builder: (BuildContext context, double stuckAmount) {
                      return NutritionHeader(
                        mealName: loadedState.diet.meals[index].mealName,
                        nutrients: const [Nutrient.protein, Nutrient.fat, Nutrient.carbs], // TODO: dynamic from diary settings // TODO: 'headername' - shortform
                        stuckAmount: stuckAmount,
                        onTap: () => BlocProvider.of<FoodDiaryDayBloc>(context).dispatch(AddFoodRecords((b) => b
                          ..mealIndex = index
                          ..foodRecords = ListBuilder(<FoodRecord>[
                            FoodRecord.random()
                          ])
                          ..completer = infoSnackBarCompleter(context, "successfully added food")
                        )),
                      );
                    },
                    content: Column(
                      children: <Widget>[
                        // No FoodDiaryDay found in database
                        if (loadedState.foodDiaryDay == null)
                          Container(
                            height: 72,
                            color: Colors.grey[2 * 100],
                          ),
                        // No food records in meal
                        if (loadedState.foodDiaryDay != null && loadedState.foodDiaryDay.meals[index].foodRecords.isEmpty)
                          Container(
                            height: 72,
                            color: Colors.grey[5 * 100],
                          ),
                        if (loadedState.foodDiaryDay != null)
                          // Show every food record in meal
                          for (var fr in loadedState.foodDiaryDay.meals[index].foodRecords)
                            FoodRecordTile(
                              foodRecord: fr,
                              onTap: () => BlocProvider.of<FoodDiaryDayBloc>(context).dispatch(ReplaceFoodRecord((b) => b
                                ..oldRecord = fr.toBuilder()
                                ..newRecord = fr.rebuild((b) => b
                                  ..totalNutrients = NutrientMap.random()
                                ).toBuilder()
      //                          ..completer = infoSnackBarCompleter(context, "successfully updated ${fr.foodName}")
                              )),
                              onLongPress: () => BlocProvider.of<FoodDiaryDayBloc>(context).dispatch(DeleteFoodRecords((b) => b
                                ..foodRecords = ListBuilder(<FoodRecord>[fr])
                                ..completer = infoSnackBarCompleter(context, "successfully deleted ${fr.foodName}")
                              )),
                            ),
                        // Space between bottom of list and header
                        const SizedBox(height: 32),
                      ],
                    )
                  );
                },
                childCount: loadedState.diet.meals.length,
                ),
              )
            ],
          );

          // ListView.builder() is more efficient than ListView()
          // TODO: sponsored meal/food records
          return ListView.builder(
            itemCount: loadedState.diet.meals.length,
            itemBuilder: (BuildContext context, int index) {
              return ;
            },
          );
        }
      ),
    );
  }
}
