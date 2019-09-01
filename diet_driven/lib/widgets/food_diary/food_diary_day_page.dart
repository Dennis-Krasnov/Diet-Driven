/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/widgets/completer.dart';
import 'package:diet_driven/widgets/food_diary/food_diary.dart';

/// Shows single diary day.
class FoodDiaryDayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodDiaryDayBloc, FoodDiaryDayState>(
      builder: (BuildContext context, FoodDiaryDayState foodDiaryDayState) {
        LoggingBloc().verbose("Food diary day #${BlocProvider.of<FoodDiaryDayBloc>(context).date} rebuild");

        // White screen with skeleton food records
        if (foodDiaryDayState is FoodDiaryDayUninitialized) {
          // TODO: skeleton page
          return Container(child: Center(child: Text(BlocProvider.of<FoodDiaryDayBloc>(context).currentState.toString()),),);
        }

        // ????? failed TODOCUMENT - do I need a fail state??
//        if (foodDiaryDayState is FoodDiaryDayFailed) {}

        // Food diary day is loaded from now on
        assert(foodDiaryDayState is FoodDiaryDayLoaded);

        final loadedState = foodDiaryDayState as FoodDiaryDayLoaded;

        // ListView.builder() is more efficient than ListView()
        // TODO: sponsored meal/food records
        return ListView.builder(
          itemCount: loadedState.diet.meals.length,
          itemBuilder: (BuildContext context, int index) {
            return StickyHeaderBuilder(
              builder: (BuildContext context, double stuckAmount) {
                return NutritionHeader(
                  mealName: loadedState.diet.meals[index].mealName,
                  nutrients: const [Nutrient.protein, Nutrient.fat, Nutrient.carbs], // TODO: dynamic from diary settings // TODO: 'headername' - shortform
                  stuckAmount: stuckAmount,
                  onTap: () => BlocProvider.of<FoodDiaryDayBloc>(context).dispatch(AddFoodRecords((b) => b
                    ..mealIndex = index
                    ..foodRecords = ListBuilder(<FoodRecord>[
                      FoodRecord.random()
                    ])
                    ..completer = infoSnackBarCompleter(context, "successfully added food")
                  )),
                );
              },
              content: Column(
                children: <Widget>[
                  // No FoodDiaryDay found in database
                  if (loadedState.foodDiaryDay == null)
                    Container(
                      height: 72,
                      color: Colors.grey[2 * 100],
                    ),
                  // No food records in meal
                  if (loadedState.foodDiaryDay != null && loadedState.foodDiaryDay.meals[index].foodRecords.isEmpty)
                    Container(
                      height: 72,
                      color: Colors.grey[5 * 100],
                    ),
                  if (loadedState.foodDiaryDay != null)
                    // Show every food record in meal
                    for (var fr in loadedState.foodDiaryDay.meals[index].foodRecords)
                      FoodRecordTile(
                        foodRecord: fr,
                        onTap: () => BlocProvider.of<FoodDiaryDayBloc>(context).dispatch(ReplaceFoodRecord((b) => b
                          ..oldRecord = fr.toBuilder()
                          ..newRecord = fr.rebuild((b) => b
                            ..totalNutrients = NutrientMap.random()
                          ).toBuilder()
//                          ..completer = infoSnackBarCompleter(context, "successfully updated ${fr.foodName}")
                        )),
                        onLongPress: () => BlocProvider.of<FoodDiaryDayBloc>(context).dispatch(DeleteFoodRecords((b) => b
                          ..foodRecords = ListBuilder(<FoodRecord>[fr])
                          ..completer = infoSnackBarCompleter(context, "successfully deleted ${fr.foodName}")
                        )),
                      ),
                  // Space between bottom of list and header
                  const SizedBox(height: 32),
                ],
              )
            );
          },
        );
      }
    );
  }
}
