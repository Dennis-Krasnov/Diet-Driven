import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/data/food_record.dart';
import 'package:diet_driven/data/meals.dart';
import 'package:diet_driven/util/built_firestore.dart';
import 'package:diet_driven/widgets/food_record_list_tile.dart';
import 'package:flutter/material.dart';

class Meal extends StatelessWidget {
  final MealInfo mealInfo;
  final BuiltList<FoodRecord> foodRecords;
  final Actions actions;
  // TODO: predefined actions for meal-specific things (similar to how passing functions to food record)

  Meal(this.mealInfo, this.foodRecords, this.actions);

  // Must define as functions otherwise they're called in-place

  void update(FoodRecord updated) {
    actions.firestore.updateFoodRecord(
      FSTuple(
        FoodRecordDocument((b) => b..foodRecordId = updated.id),
        updated
      )
    );
  }

  void delete(FoodRecord toDelete) {
    actions.firestore.deleteFoodRecord(
        FoodRecordDocument((b) => b..foodRecordId = toDelete.id)
    );
  }

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
          children: foodRecords.map((fr) => FoodRecordListTile(fr, update, delete)).toList(),
        )
      ],
    );
  }
}