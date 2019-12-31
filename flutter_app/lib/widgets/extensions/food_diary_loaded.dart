/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';

// TODO: generalize this (upto infinite series!! - become very small, maximum stays the same!)
extension FoodDiaryDayLoadedExtensions on FoodDiaryDayLoaded {
  CircularSeries macronutrientRadialBarSeries(Nutrient macronutrient) {
    final int currentQuantity = foodDiaryDay.combinedNutrients.quantities[macronutrient];
    final int dietQuantity = diet.idealNutrients.quantities[macronutrient];
    final percentageAchieved = (currentQuantity / dietQuantity) * 100;

    return RadialBarSeries<int, String>(
      dataSource: <int>[
        if (percentageAchieved < 100)
          percentageAchieved.toInt()
        else
          if (percentageAchieved > 200) ...[
            100,
            100,
          ]
          else ...[
            100,
            percentageAchieved.toInt() % 100,
          ]
      ],
      maximumValue: 100,
//      trackColor: ,
      // useSeriesColour true?
//        pointColorMapper: (int data, _) => data < 100 ? Colors.lightGreen : Colors.green, // FIXME: method on nutrient that gives colour, use darken method or something
      pointColorMapper: (int data, _) => Colors.redAccent,
      // TODO: put colour as part of data point
      // Hundreds digit of percentile
      xValueMapper: (int data, _) => macronutrient.toString(),
      yValueMapper: (int data, _) => data,
      // FIXME: hope >100 works ok
//      radius: "100%",
      radius: "100%",
      // 80% default
      animationDuration: 250,
      // 250,
      // TODO: half width when < 100 !!!
      innerRadius: percentageAchieved < 100 ? "75%" : "50%",
      // 50% default
      gap: "20%", // 1%
      // FIXME: width differs a bit, not taking into account gap width
    );
  }
}