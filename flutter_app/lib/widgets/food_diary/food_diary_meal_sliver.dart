/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:diet_driven/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/widgets/food_diary/food_diary.dart';

/// ...
class FoodDiaryMealSliver extends StatelessWidget {
  final int mealIndex;
  final MealInfo mealInfo;
  final MealData mealData;

  const FoodDiaryMealSliver({Key key, this.mealIndex, this.mealInfo, this.mealData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeaderBuilder(
      builder: (context, state) {
        // Only update state if this is the current header
        if (state.isPinned) {
          FoodDiaryScrollBloc.scrollPercentage = state.scrollPercentage;
          // If header is being pushed out, set next header as active
          BlocProvider.of<FoodDiaryScrollBloc>(context).add(state.scrollPercentage == 0
            ? mealIndex
            : mealIndex + 1
          );
        }

        return BlocBuilder<FoodDiaryScrollBloc, int>(
          builder: (BuildContext context, int currentMealIndex) => NutritionHeader(
            mealName: mealInfo.mealName,
//          nutrientsVisible: state.isPinned,
            nutrientsVisible: mealIndex == currentMealIndex,
            nutrients: const [Nutrient.protein, Nutrient.fat, Nutrient.carbs],
            onTap: () => print("please work"),
//        onTap: () => BlocProvider.of<FoodDiaryDayBloc>(context).dispatch(AddFoodRecords((b) => b
//          ..mealIndex = 0 // FIXME
//          ..foodRecords = ListBuilder(<FoodRecord>[
//            FoodRecord.random()
//          ])
//          ..completer = infoSnackBarCompleter(context, "successfully added food")
//        ))
          ),
        );
      },
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          for (final foodRecord in mealData?.foodRecords ?? <FoodRecord>[])
            FoodRecordTile(
              foodRecord: foodRecord,
              onTap: () => print("please work 2"),
//              onTap: () => BlocProvider.of<FoodDiaryDayBloc>(context).dispatch(ReplaceFoodRecord((b) => b
//                ..oldRecord = foodRecord.toBuilder()
//                ..newRecord = foodRecord.rebuild((b) => b
//                  ..totalNutrients = NutrientMap.random()
//                ).toBuilder()
//                ..completer = infoSnackBarCompleter(context, "successfully updated ${foodRecord.foodName}")
//              )),
            ),
          // Space between bottom of list and subsequent header
          const SizedBox(height: 32),
        ]),
        // TODO: dynamic from diary settings // TODO: 'headername' - shortform
      ),
    );
  }
}