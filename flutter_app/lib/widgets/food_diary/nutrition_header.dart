/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:flutter/material.dart';

import 'package:diet_driven/models/models.dart' show Nutrient;

/// Shows optionally sticky nutrition header.
class NutritionHeader extends StatelessWidget {
  /// Meal name eg. Breakfast.
  final String mealName;

  /// List of nutrients to show in addition to calories.
  final List<Nutrient> nutrients;

  /// Determines visibility of nutrients.
  /// 0.0 <= value <= 1.0: about to be stuck
  ///        0.0 == value: at top
  /// 1.0 >= value >= 0.0: past stuck
  /// Nutrients always hidden if not defined.
  final double stuckAmount;

  /// Called when the user taps this nutrition header.
  final GestureTapCallback onTap;

  /// Called when the user long-presses on this nutrition header.
  final GestureLongPressCallback onLongPress;

  const NutritionHeader({
    Key key,
    this.stuckAmount = 0,
    @required this.mealName,
    @required this.nutrients,
    this.onTap,
    this.onLongPress
  }) : assert(mealName != null), assert(nutrients != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        // Opaque header container
//        height: 30,
        height: 40,
//        padding: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
//        margin: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.centerLeft,
//        color: Colors.white,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(
            width: 1,
            color: const Color.fromRGBO(0, 0, 0, 0.08),
          )),
        ),
        child: Row(
          // Align text to single baseline
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            // Meal name takes as much space as possible
            Expanded(
              child: Text(
                mealName.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: const Color.fromRGBO(0, 0, 0, 0.6),
                ),
              ),
            ),

            // Fixed sized nutrient headers are dynamically loaded
            for (var nutrient in nutrients)
              HiddenSticky(
                stuckAmount: stuckAmount,
                child: SizedBox(
                  width: 60, // OPTIMIZE
                  child: Text(
                    nutrient.toString().toUpperCase(), // TODO: capitalize!
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3,
                      color: nutrient == Nutrient.protein // TODO: dynamic, store in map
                        ? const Color(0xFF8B041B)
                        : nutrient == Nutrient.fat
                          ? const Color(0xFFC89C00)
                          : const Color(0xFF219653),
                    ),
                  ),
                ),
              ),

            // Fixed sized calorie header
            HiddenSticky(
              stuckAmount: stuckAmount,
              child: SizedBox(
                width: 60, // OPTIMIZE
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
        ),
      ),
    );
  }
}

/// Animates hiding sticky nutrition header elements.
class HiddenSticky extends StatelessWidget {
  /// Determines visibility of nutrients.
  /// 0.0 <= value <= 1.0: about to be stuck
  ///        0.0 == value: at top
  /// 1.0 >= value >= 0.0: past stuck
  final double stuckAmount;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  const HiddenSticky({Key key, @required this.stuckAmount, @required this.child})
      : assert(stuckAmount != null), assert(child != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    // Normalized stuck amount
    final clampedStuckAmount = stuckAmount.clamp(0.0, 1.0);

    // Completely removes child from widget tree
    // Doesn't hide headers above currently active header // OPTIMIZE
    return Visibility(
      visible: 1 - clampedStuckAmount > 0.0,
        // Opacity animations aren't efficient // OPTIMIZE: wrap all nutrients/calories into single HiddenSticky
        // FIXME: when quickly swiping pageview to see day to left, can see the headers for a split second!!!
        child: Opacity(
          opacity: 1 - clampedStuckAmount,
          child: child,
        )
    );
  }
}
