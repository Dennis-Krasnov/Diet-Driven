/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/models/nutrient.dart';
import 'package:diet_driven/widgets/food_diary/food_record_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/widgets/extensions/extensions.dart';
import 'package:diet_driven/widgets/food_diary/nutrition_header.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DailyNutritionStatsSliver extends StatelessWidget {
  /// Nutrition stats starts before 0-indexed meals.
  static int mealIndex = -1;

  @override
  Widget build(BuildContext context) {
//    final data = BlocProvider.of<FoodDiaryDayBloc>(context).loadedState?.foodDiaryDay?.combinedNutrients?.quantities;
    final nutrientMap = BlocProvider.of<FoodDiaryDayBloc>(context).loadedState?.foodDiaryDay?.combinedNutrients ?? NutrientMap.random();
    final diet = BlocProvider.of<FoodDiaryDayBloc>(context).loadedState.diet;
    final colours = BlocProvider.of<UserDataBloc>(context).loadedState.settings.theme.macroColours;

    final List<NutrientPair> chartData = [
      for (final macro in BlocProvider.of<UserDataBloc>(context).loadedState.settings.diary.macroOrder)
        NutrientPair(macro, nutrientMap.quantities[macro], colours[macro].colour),
    ];

    return SliverStickyHeaderBuilder(
      builder: (context, state) {
        // Only update state if this is the current header
        if (state.isPinned) {
          FoodDiaryScrollBloc.scrollPercentage = state.scrollPercentage;
          // If header is being pushed out, set next header as active
          BlocProvider.of<FoodDiaryScrollBloc>(context).add(state.scrollPercentage == 0 ? mealIndex : mealIndex + 1);
        }

        return BlocBuilder<FoodDiaryScrollBloc, int>(
          builder: (BuildContext context, int currentMealIndex) => NutritionHeader(
            mealName: "Daily stats",
            nutrientsVisible: mealIndex == currentMealIndex,
            nutrients: BlocProvider.of<UserDataBloc>(context).loadedState.settings.diary.macroOrder,
            onTap: () => print("nutrition pressed"),
          )
        );
      },
      sliver: SliverToBoxAdapter(
        child: Padding(
          // Space between bottom of graphs and subsequent header (16 instead of 32)
          padding: const EdgeInsets.symmetric(horizontal: 16).add(const EdgeInsets.only(bottom: 16)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: SizedBox(
                    height: 84,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: SfCircularChart(
                          series: <CircularSeries>[
                            PieSeries<NutrientPair, String>(
                              dataSource: chartData,
                              pointColorMapper: (NutrientPair data, _) => data.color,
                              xValueMapper: (NutrientPair data, _) => data.nutrient.toString(),
                              yValueMapper: (NutrientPair data, _) => data.value,
                              radius: "100%", // Default is 80%
                              animationDuration: 0,
                            )
                          ],
                          margin: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              for (final nutrient in BlocProvider.of<UserDataBloc>(context).loadedState.settings.diary.macroOrder)
                SizedBox(
                  width: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: 6),
                      Text(
                        "${nutrientMap.quantities[nutrient]} g",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(0, 0, 0, 0.6)
                        ),
                      ),
                      Text(
                        "/ ${diet.idealNutrients.quantities[nutrient]} g",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(0, 0, 0, 0.6)
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: NutrientChart(
                            percentage: nutrientMap.quantities[nutrient] / diet.idealNutrients.quantities[nutrient],
                            colour: BlocProvider.of<UserDataBloc>(context).loadedState.settings.theme.macroColours[nutrient].colour,
                            overAteColour: BlocProvider.of<UserDataBloc>(context).loadedState.settings.theme.darkMacroColours[nutrient].colour,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(
                width: 60, // OPTIMIZE
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      nutrientMap.calories.toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(0, 0, 0, 0.87)
                      ),
                    ),
                    Text(
                      "/ ${diet.idealNutrients.calories}",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(0, 0, 0, 0.87)
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: NutrientChart(
                          percentage: nutrientMap.calories / diet.idealNutrients.calories,
                          colour: "0xFFB8B8B8".colour,
                          overAteColour: "0xFF777777".colour,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NutrientChart extends StatelessWidget {
  final num percentage;
  final Color colour;
  final Color overAteColour;

  const NutrientChart({Key key, this.percentage, this.colour, this.overAteColour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = percentage * 100;
    final over300Colour = Colors.black;
    const invisibleColour = Color.fromRGBO(240, 240, 240, 1);

    final List<ChartData> chartData = [
      if (p >= 300)
        ChartData(100, over300Colour),
      if (300 > p && p >= 200) ...[
        ChartData(p - 200, over300Colour),
        ChartData(300 - p, overAteColour),
      ],
      if (200 > p && p >= 100) ...[
        ChartData(p - 100, overAteColour),
        ChartData(200 - p, colour),
      ],
      if (100 > p) ...[
        ChartData(p, colour),
        ChartData(100 - p, invisibleColour),
      ],
    ];

    return SfCircularChart(
      series: <CircularSeries>[
        DoughnutSeries<ChartData, String>(
          dataSource: chartData,
          pointColorMapper:(ChartData data, _) => data.colour,
          xValueMapper: (ChartData data, _) => data.colour.toString(),
          yValueMapper: (ChartData data, _) => data.size,
          radius: "100%", // Default is 80%
          animationDuration: 0,
        )
      ],
      margin: EdgeInsets.zero,
    );
  }
}

class ChartData {
  final num size;
  final Color colour;

  ChartData(this.size, this.colour);

  @override
  String toString() => "size: $size, colour $colour";
}