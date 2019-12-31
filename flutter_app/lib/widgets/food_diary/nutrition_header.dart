/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/widgets/food_diary/food_diary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time/time.dart';
import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/widgets/extensions/extensions.dart';

/// Shows header with nutrition macronutrients.
class NutritionHeader extends StatelessWidget {
  /// Meal name eg. Breakfast.
  final String mealName;

  /// ...
  final bool nutrientsVisible;

  /// List of nutrients to show in addition to calories.
  final BuiltList<Nutrient> nutrients;

  /// Called when the user taps this nutrition header.
  final GestureTapCallback onTap;

  /// Called when the user long-presses on this nutrition header.
  final GestureLongPressCallback onLongPress;

  const NutritionHeader({
    Key key,
    @required this.mealName,
    this.nutrientsVisible = false,
    @required this.nutrients,
    this.onTap,
    this.onLongPress
  }) : assert(mealName != null), assert(nutrients != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Header(
      text: mealName,
      trailingWidgets: <Widget>[
        // Fixed sized nutrient headers are dynamically loaded
        for (var nutrient in nutrients)
          AnimatedOpacity(
            opacity: nutrientsVisible ? 1 : 0,
            duration: 200.milliseconds,
            curve: Curves.easeInOut, // linear
            child: SizedBox(
              width: 60,
              child: Text(
                nutrient.toString().toUpperCase(),
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                  color: BlocProvider.of<UserDataBloc>(context).loadedState.settings.theme.darkMacroColours[nutrient].colour
                ),
              ),
            ),
          ),
        // Fixed sized calorie header
        AnimatedOpacity(
          opacity: nutrientsVisible ? 1 : 0,
          duration: 200.milliseconds,
          curve: Curves.easeInOut, // linear
          child: SizedBox(
            width: 60,
            child: Text(
              "CALS",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
                color: const Color.fromRGBO(0, 0, 0, 0.9),
              ),
            ),
          ),
        ),
      ],
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}