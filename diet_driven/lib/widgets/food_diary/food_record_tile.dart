/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:charts_flutter/flutter.dart' as charts;
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

  const FoodRecordTile({Key key, @required this.foodRecord, this.enabled = true, this.onTap, this.onLongPress})
    : assert(foodRecord != null), super(key: key);

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
//                                    height: 50,
              width: 24,
              child: charts.PieChart<num>(
                _createSampleData2(foodRecord.totalNutrients),
                animate: false,
                layoutConfig: charts.LayoutConfig(
                  topMarginSpec: charts.MarginSpec.fixedPixel(0),
                  rightMarginSpec: charts.MarginSpec.fixedPixel(0),
                  bottomMarginSpec: charts.MarginSpec.fixedPixel(0),
                  leftMarginSpec: charts.MarginSpec.fixedPixel(0),
                ),
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


// TODO: put as method under NutritionMap data class eg. [nutrition.toSeries]
List<charts.Series<MapEntry<Nutrient, num>, num>> _createSampleData2(NutrientMap nutrients) {
  return [
    charts.Series<MapEntry<Nutrient, num>, num>(
      id: 'Sales',
      domainFn: (MapEntry<Nutrient, num> nutrientQuantity, _) => nutrientQuantity.key.hashCode,
      measureFn: (MapEntry<Nutrient, num> nutrientQuantity, _) => nutrientQuantity.value,
      colorFn: (MapEntry<Nutrient, num> nutrientQuantity, _) => nutrientQuantity.key == Nutrient.protein
          ? charts.MaterialPalette.red.shadeDefault
          : nutrientQuantity.key == Nutrient.fat
          ? charts.MaterialPalette.yellow.shadeDefault.darker
          : charts.MaterialPalette.green.shadeDefault,
      data: nutrients.quantities.entries.where((nutrientQuantity) => nutrientQuantity.key.type == NutrientType.macronutrient).toList(), // TODO: macros only!
    )
  ];
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
