/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:flutter/material.dart';

import 'package:diet_driven/models/models.dart';

// TODO: create food record base class (private)
// then extend it twice once with image, and once with selection!
class SelectionFoodRecordTile extends StatelessWidget {
  /// ...
  ///
  ///
  final FoodRecord foodRecord;

  /// Whether this checkbox is checked.
  ///
  /// This property must not be null.
  final bool value;

  /// Whether this list tile is interactive.
  ///
  /// If false, this list tile is styled with the disabled color from the
  /// current [Theme] and the [onTap] and [onLongPress] callbacks are
  /// inoperative.
  final bool enabled;

  /// Called when the user taps this list tile.
  ///
  /// Inoperative if [enabled] is false.
  final GestureTapCallback onTap;

  /// Called when the user long-presses on this list tile.
  ///
  /// Inoperative if [enabled] is false.
  final GestureLongPressCallback onLongPress;

  /// Called when the value of the checkbox should change.
  ///
  /// The checkbox passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the checkbox tile with the
  /// new value.
  ///
  /// If null, the checkbox will be displayed as disabled.
  final ValueChanged<bool> onChanged;

  SelectionFoodRecordTile(
    this.foodRecord, {
    Key key,
    this.value,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.onChanged
  }) : assert(value != null),
       assert(foodRecord != null),
       assert(enabled != null),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
//      key: key, key: Key(foodRecord.uuid)
      // TODO: FadeInImage
      leading: Checkbox(
        value: value,
        onChanged: onChanged
      ),
      title: Text("${foodRecord.foodName} - ${foodRecord.grams} g"),
      subtitle: Row(
        children: <Widget>[
          // TODO: table
//          Text("${foodRecord.protein} g"),
//          Text("${foodRecord.fat} g"),
//          Text("${foodRecord.carbs} g"),
//          Text("${foodRecord.calories}",
//            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      enabled: enabled,
      onTap: enabled ? onTap : null,
      onLongPress: enabled ? onLongPress : null,
    );
  }
}
