/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_collection/built_collection.dart';
import 'package:deep_link_navigation/deep_link_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/navigation/navigation.dart';
import 'package:diet_driven/widgets/completer.dart';
import 'package:diet_driven/widgets/food_diary/food_diary.dart';

/// ...
class FoodDiaryMealSliver extends StatelessWidget {
  final int mealIndex;
  final MealInfo mealInfo;
  final MealData mealData;

  const FoodDiaryMealSliver({Key key, this.mealIndex, this.mealInfo, this.mealData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartSliverStickyHeader(
      index: mealIndex,
      builder: (BuildContext context, bool isVisible) => NutritionHeader(
        mealName: mealInfo.mealName,
        nutrientsVisible: isVisible,
        nutrients: BlocProvider.of<UserDataBloc>(context).loadedState.settings.diary.macroOrder,
        onTap: () async {
          final searchResult = await DeepLinkNavigator.of(context).push<FoodRecord>(SearchDL("aaa"));

          if (searchResult != null) {
            BlocProvider.of<FoodDiaryDayBloc>(context).add(AddFoodRecords((b) => b
              ..mealIndex = mealIndex
              ..foodRecords = ListBuilder(<FoodRecord>[searchResult])
              ..completer = infoSnackBarCompleter(context, "Successfully added food")
            ));
          }
        }
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          for (final foodRecord in mealData?.foodRecords ?? <FoodRecord>[])
            FoodRecordTile(
              foodRecord: foodRecord,
              onTap: () => BlocProvider.of<FoodDiaryDayBloc>(context).add(ReplaceFoodRecord((b) => b
                ..foodRecord = foodRecord.rebuild((b) => b
                  ..totalNutrients = NutrientMap.random()
                ).toBuilder()
                ..completer = infoSnackBarCompleter(context, "Successfully updated ${foodRecord.foodName}")
              )),
            ),
          // Space between bottom of list and subsequent header
          const SizedBox(height: 32),
        ]),
        // TODO: dynamic from diary settings // TODO: 'headername' - shortform
      )
    );
  }
}