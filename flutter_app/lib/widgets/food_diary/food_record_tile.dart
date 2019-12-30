/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:diet_driven/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:diet_driven/widgets/extensions/extensions.dart';
import 'package:diet_driven/models/models.dart';

class NutrientPair {
  final Nutrient nutrient;
  final int value;
  final Color color;

  NutrientPair(this.nutrient, this.value, [this.color]);
}

class FoodRecordTile extends StatelessWidget {
  /// ...
  static double height = 72;

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

  @override
  Widget build(BuildContext context) {
    final data = foodRecord.totalNutrients.quantities;
    final colours = BlocProvider.of<UserDataBloc>(context).loadedState.settings.theme.macroColours;

    final List<NutrientPair> chartData = [
      for (final macro in BlocProvider.of<UserDataBloc>(context).loadedState.settings.diary.macroOrder)
        NutrientPair(macro, data[macro], colours[macro].colour),
    ];

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
//                          highlightColor: Colors.blue,
      // Disable android ripple
      splashColor: Colors.transparent,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: <Widget>[
            SizedBox(
//              width: 24,
              width: 30,
              child: //Placeholder(),
              SfCircularChart(
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
//              child: AnimatedCircularChart(
//                size: const Size(30, 30),
//                duration: const Duration(milliseconds: 0),
//                initialChartData: generatePieChart(foodRecord.totalNutrients, [Nutrient.protein, Nutrient.fat, Nutrient.carbs]),
//                chartType: CircularChartType.Pie,
//              ),
            ),
//            const SizedBox(width: 16),
            const SizedBox(width: 12),
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
                          "1 slice (25g)", // TODO
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.body2
                        ),
                      ),
                      for (var nutrient in BlocProvider.of<UserDataBloc>(context).loadedState.settings.diary.macroOrder)
                        SizedBox(
                          width: 60, // OPTIMIZE
                          child: Text(
                            "${foodRecord.totalNutrients.quantities[nutrient].round() ?? 0} g",
//                            textAlign: TextAlign.right,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 11,
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
