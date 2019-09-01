/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter/material.dart';

import 'package:diet_driven/models/models.dart';

class FoodRecordTile extends StatelessWidget {
  ///
  final FoodRecord foodRecord;

  ///
  final bool enabled;

  /// Called when the user taps this list tile.
  ///
  /// Inoperative if [enabled] is false.
  final GestureTapCallback onTap;

  /// Called when the user long-presses on this list tile.
  ///
  /// Inoperative if [enabled] is false.
  final GestureLongPressCallback onLongPress;

//  final List<charts.Series<MapEntry<Nutrient, num>, num>> chartData;
  // chartData = _createSampleData2(foodRecord)
  // FIXME: calculate only once!

  const FoodRecordTile({Key key, @required this.foodRecord, this.enabled = true, this.onTap, this.onLongPress})
    : assert(foodRecord != null), super(key: key);

  List<CircularStackEntry> generatePieChart(NutrientMap nutrientMap, List<Nutrient> macroNutrientOrder) {
    assert(nutrientMap != null);
    assert(macroNutrientOrder != null);

    return <CircularStackEntry>[
      CircularStackEntry(
        <CircularSegmentEntry>[
          // TODO: take list (macronutrient order) from settings
          for (final nutrient in macroNutrientOrder)
            CircularSegmentEntry(
              nutrientMap.quantities[nutrient],
                nutrient == Nutrient.protein // TODO: dynamic, store in map
                  ? const Color(0xFFA23648)
                  : nutrient == Nutrient.fat
                  ? const Color(0xFFD3AF32)
                  : const Color(0xFF4DAB75),
              rankKey: nutrient.name
            ),
        ],
        rankKey: 'Macronutrient distribution',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
//                          highlightColor: Colors.blue,
      // Disable android ripple
      splashColor: Colors.transparent,
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: <Widget>[
            SizedBox(
//              key: ValueKey(foodRecord.normalizedNutrients), // OPTIMIZE: I Don't know if this changes anything...
              width: 24,
              child: AnimatedCircularChart(
                size: const Size(30, 30),
                duration: const Duration(milliseconds: 0),
                initialChartData: generatePieChart(foodRecord.totalNutrients, [Nutrient.protein, Nutrient.fat, Nutrient.carbs]),
                chartType: CircularChartType.Pie,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    foodRecord.foodName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.body1,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    // Align text to single baseline
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "1 slice (25g)",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.body2
                        ),
                      ),
                      for (var nutrient in [Nutrient.protein, Nutrient.fat, Nutrient.carbs]) // TODO: dynamic from diary settings
                        SizedBox(
                          width: 60, // OPTIMIZE
                          child: Text(
                            "${foodRecord.totalNutrients.quantities[nutrient].round() ?? 0} g",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(0, 0, 0, 0.6)
                            ),
                          ),
                        ),
                      SizedBox(
                        width: 60, // OPTIMIZE
                        child: Text(
                          foodRecord.totalNutrients.calories.round().toString(), // FIXME
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(0, 0, 0, 0.87)
                          ),
                        ),
                      ),
                    ]
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// TODO: for selection version
/// Called when the value of the checkbox should change.
///
/// The checkbox passes the new value to the callback but does not actually
/// change state until the parent widget rebuilds the checkbox tile with the
/// new value.
///
/// If null, the checkbox will be displayed as disabled.
//final ValueChanged<bool> onChanged;
