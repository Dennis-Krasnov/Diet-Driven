import 'package:flutter/material.dart';

import 'package:diet_driven/models/models.dart';

class FoodRecordTile extends StatelessWidget {
  /// ...
  ///
  ///
  final FoodRecord foodRecord;

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

  FoodRecordTile(
    this.foodRecord, {
    Key key,
    this.enabled = true,
    this.onTap,
    this.onLongPress
  }) : assert(foodRecord != null),
       assert(enabled != null),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
//      key: key, key: Key(foodRecord.uuid)
      // TODO: FadeInImage
//      leading: Image.network(
//        'https://picsum.photos/200',
//        // FIXME: doesn't work without internet...
//      ),
      title: Text("${foodRecord.foodName} - ${foodRecord.grams} g"),
      subtitle: Row(
        children: <Widget>[
          // TODO: table
          Text("${foodRecord.protein} g"),
          Text("${foodRecord.fat} g"),
          Text("${foodRecord.carbs} g"),
          Text("${foodRecord.calories}",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      enabled: enabled,
      onTap: enabled ? onTap : null,
      onLongPress: enabled ? onLongPress : null,
    );
  }
}
