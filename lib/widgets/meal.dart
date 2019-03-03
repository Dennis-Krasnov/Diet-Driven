import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/data/food.dart';
import 'package:diet_driven/data/meals.dart';
import 'package:diet_driven/widgets/food_record_list_tile.dart';
import 'package:flutter/material.dart';

class Meal extends StatelessWidget {
  final int daysSinceEpoch;
  final MealInfo mealInfo;
  final BuiltList<FoodRecord> foodRecords;

  final Function foodRecordUpdate;
  final Function foodRecordDelete;
  // TODO: predefined actions for meal-specific things (similar to how passing functions to food record)

  Meal(this.daysSinceEpoch, this.mealInfo, this.foodRecords, this.foodRecordUpdate, this.foodRecordDelete);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "#${mealInfo.mealIndex} - ${mealInfo.name}", //- starts at ${mealInfo.startsAt.inHours}:00
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        Column(
          children: foodRecords.map((fr) => FoodRecordListTile(fr, foodRecordUpdate, foodRecordDelete)).toList(),
        )
      ],
    );
  }
}