/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:math';
import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/widgets/completer.dart';
import 'package:diet_driven/widgets/core/app.dart';
import 'package:diet_driven/widgets/loading/loading.dart';
import 'package:diet_driven/widgets/message/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:charts_flutter/flutter.dart' as charts;


enum FoodDiaryPageOverflowActions { settings }

/// Manages page switcher and displays respective diary day.
class FoodDiaryPage extends StatefulWidget {
  @override
  _FoodDiaryPageState createState() => _FoodDiaryPageState();
}

class _FoodDiaryPageState extends State<FoodDiaryPage> {
  /// Must be stateful widget to persist page controller state throughout builds.
  /// Initializes default PageView day as today. FIXME: should go to day on a new today
  final controller = PageController(initialPage: currentDaysSinceEpoch());

  @override
  Widget build(BuildContext context) {
//    userId: BlocProvider.of<UserDataBloc>(context).userId // TODO: use this shortcut in many places!
    return BlocBuilder<FoodDiaryBloc, FoodDiaryState>(
      condition: (previous, current) {
        // Unconditional rebuild
        if (previous is! FoodDiaryLoaded || current is! FoodDiaryLoaded)
          return true;

        // Rebuild only if current date changed
        return (previous as FoodDiaryLoaded).currentDate != (current as FoodDiaryLoaded).currentDate;
      },
      builder: (BuildContext context, FoodDiaryState foodDiaryState) {
        // White screen with skeleton app bar
        if (foodDiaryState is FoodDiaryUninitialized) {
          return const SplashPage(); // FIXME: different splash page for diary, without bottom navigation
        }

        // Loading food diary days failed
        if (foodDiaryState is FoodDiaryFailed) {
          return ErrorPage(
              error: foodDiaryState.error.toString(),
              trace: foodDiaryState.stacktrace.toString()
          );
        }

        // Food diary is loaded from now on
        assert(foodDiaryState is FoodDiaryLoaded);

        final loadedState = foodDiaryState as FoodDiaryLoaded;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Diary"),
            actions: <Widget>[
              Text("current page: ${loadedState.currentDate}", style: TextStyle(color: Colors.black),)
            ],
          ),
          body: PageView.builder(
            controller: controller,
            onPageChanged: (int page) => BlocProvider.of<FoodDiaryBloc>(context).dispatch(UpdateCurrentDate((b) => b
              ..currentDate = page
            )),
            itemBuilder: (BuildContext context, int position) {
              return BlocProvider<FoodDiaryDayBloc>(
                key: ValueKey(position), // OPTIMIZE: is this necessary? // TODOCUMENT
                builder: (BuildContext context) => FoodDiaryDayBloc(
                  date: position,
                  foodDiaryBloc: BlocProvider.of<FoodDiaryBloc>(context),
                )..dispatch(InitFoodDiaryDay()),
                child: FoodDiaryDay(),
              );
            }
          )
        );
      }
    );
    // TODO: show dummy diary page while uninitialized

//    return Scaffold(
//      appBar: AppBar(
//        title: const Text("Diary"),
//        actions: <Widget>[
//          Text("page ???", style: TextStyle(color: Colors.black),),
//          IconButton(
//            icon: const Icon(Icons.calendar_today),
//            onPressed: () => null, //controller.animateToPage(124, duration: const Duration(seconds: 1), curve: const ElasticInCurve())
//          ),
//          PopupMenuButton<FoodDiaryPageOverflowActions>(
//            onSelected: (FoodDiaryPageOverflowActions result) {
//              switch(result) {
//                case FoodDiaryPageOverflowActions.settings:
//                  BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToSettings((b) => b
//                    ..deepLink = DiarySettingsDeepLink()
//                  ));
//                  break;
//              }
//            },
//            itemBuilder: (BuildContext context) => <PopupMenuEntry<FoodDiaryPageOverflowActions>>[
//              const PopupMenuItem<FoodDiaryPageOverflowActions>(
//                value: FoodDiaryPageOverflowActions.settings,
//                child: Text("Diary settings"),
//              ),
//            ]
//          )
//        ],
//      ),
//      body: PageView.builder(
//        controller: controller,
//        itemBuilder: (BuildContext context, int position) {
//          return const FlutterLogo();
////          return BlocProvider<FoodDiaryBloc>(
////            key: ValueKey(position),
////            builder: (BuildContext context) => FoodDiaryBloc(
////              daysSinceEpoch: position,
////              diaryRepository: Repository().diary,
////              userId: userId
////            ),
////            dispose: null, // (BuildContext context, FoodDiaryBloc foodDiaryBloc) => foodDiaryBloc.dispose(),
////            child: FoodDiaryDay(),
////          );
//        },
//        // TODO: call generic DaySwitcherBloc with debounce!
//        onPageChanged: (int date) => setState(() {
////          page = date; FIXME
//        }),
//      ),
//    );
  }
}


class FoodDiaryDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodDiaryDayBloc, FoodDiaryDayState>(
      builder: (BuildContext context, FoodDiaryDayState foodDiaryDayState) {
        // White screen with skeleton food records
        if (foodDiaryDayState is FoodDiaryDayUninitialized) {
//          return Container(child: Center(child: Text("bloc #: ${BlocProvider.of<FoodDiaryDayBloc>(context).date}"),),);
          return Container(child: Center(child: Text(BlocProvider.of<FoodDiaryDayBloc>(context).currentState.toString()),),);
//          return const FlutterLogo(); // TODO: skeleton pages
        }

        // ????? failed TODOCUMENT - do I need a fail state?
//        if (foodDiaryDayState is FoodDiaryDayFailed) {
//          return ErrorPage(error: "Invalid food diary state: $state} - ${state.error}"); // FIXME
//        }

        // Food diary day is loaded from now on
        assert(foodDiaryDayState is FoodDiaryDayLoaded);

        final loadedState = foodDiaryDayState as FoodDiaryDayLoaded;

        final tmpMealsFromDiet = [
          MealInfo((b) => b
            ..mealName = "Breakfast"
            ..startTime = 0
          ),
          MealInfo((b) => b
            ..mealName = "Lunch"
            ..startTime = 360
          ),
        ];

        return ListView(
          children: <Widget>[
            for (var meal in tmpMealsFromDiet) // TODO: use meal object!!! (rename to meals) loadedState.diet.mealNames
              StickyHeaderBuilder(
                builder: (BuildContext context, double stuckAmount) {
//                  print("$meal - $stuckAmount");
                  return NutritionHeader(
                    mealName: meal.mealName,
                    nutrientNames: const ["PROT", "FAT", "CARB"], // TODO: dynamic from diary settings
                    stuckAmount: stuckAmount,
                    onTap: () => BlocProvider.of<FoodDiaryDayBloc>(context).dispatch(AddFoodRecords((b) => b
                      ..mealIndex = tmpMealsFromDiet.indexOf(meal)
                      ..foodRecords = ListBuilder(<FoodRecord>[
                        FoodRecord.random()
                      ])
                      ..completer = infoSnackBarCompleter(context, "successfully added food")
                    )),
                  );
                },
                content: Column(
                  children: <Widget>[
                    if (loadedState.foodDiaryDay == null)
                      Container(
                        height: 72,
                        color: Colors.grey[2 * 100],
                      ),
                    if (loadedState.foodDiaryDay != null)
                      for (var fr in loadedState.foodDiaryDay.meals[tmpMealsFromDiet.indexOf(meal)].foodRecords)
                        InkWell(
                          onTap: () => BlocProvider.of<FoodDiaryDayBloc>(context).dispatch(ReplaceFoodRecord((b) => b
                            ..oldRecord = fr.toBuilder()
                            ..newRecord = fr.rebuild((b) => b
                              ..totalNutrients = b.totalNutrients.rebuild((b) => b
                                ..random()
                              )
                            ).toBuilder()
//                            ..newRecord = (fr.toBuilder()..fromMacros(Random().nextInt(90) + 10, Random().nextInt(90) + 10, Random().nextInt(90) + 10))
                            ..completer = infoSnackBarCompleter(context, "successfully updated ${fr.foodName}")
                          )),
                          onLongPress: () => BlocProvider.of<FoodDiaryDayBloc>(context).dispatch(DeleteFoodRecords((b) => b
                            ..foodRecords = ListBuilder(<FoodRecord>[fr])
                            ..completer = infoSnackBarCompleter(context, "successfully deleted ${fr.foodName}")
                          )),
//                          highlightColor: Colors.blue,
                          // Disable android ripple
                          splashColor: Colors.transparent,
                          child: Container(
                            height: 72,
//                          child: Text(fr.toString()),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
//                                  height: 50,
                                  width: 50,
                                  child: charts.PieChart<num>(_createSampleData2(fr.totalNutrients), animate: true), // TODO: disable animation (shouldn't ever change) !!!
                                ),
                                Text(fr.toString()),
                              ],
                            ),
                          ),
                        )


//                    for (var fr in loadedState.foodDiaryDay.meals[loadedState.diet.mealNames.indexOf(meal)].foodRecords)
//                      Text(fr.toString()),
//                    for (var i in List.generate(5, (e) => e))
//                      Container(
//                        height: 72,
//                        color: Colors.grey[(i + 1) * 100],
//                      ),
                  ],
                )
              )
          ],
        );
      }
    );
  }
}

// TODO: put as method under NutritionMap data class eg. [nutrition.toSeries]
List<charts.Series<MapEntry<Nutrient, num>, num>> _createSampleData2(NutrientMap nutrients) {
  return [
    charts.Series<MapEntry<Nutrient, num>, num>(
      id: 'Sales',
      domainFn: (MapEntry<Nutrient, num> nutrientQuantity, _) => nutrientQuantity.key.hashCode,
      measureFn: (MapEntry<Nutrient, num> nutrientQuantity, _) => nutrientQuantity.value,
      colorFn: (MapEntry<Nutrient, num> nutrientQuantity, _) => nutrientQuantity.key == Nutrient.protein
          ? charts.MaterialPalette.red.shadeDefault
          : nutrientQuantity.key == Nutrient.fat
          ? charts.MaterialPalette.yellow.shadeDefault.darker
          : charts.MaterialPalette.green.shadeDefault,
      data: nutrients.quantities.entries.where((nutrientQuantity) => nutrientQuantity.key.type == NutrientType.macronutrient).toList(), // TODO: macros only!
    )
  ];
}

List<charts.Series<LinearSales, int>> _createSampleData() {
  final data = [
    LinearSales(0, Random().nextInt(100)),
    LinearSales(1, Random().nextInt(100)),
    LinearSales(2, Random().nextInt(100)),
  ];

  return [
    charts.Series<LinearSales, int>(
      id: 'Sales',
      domainFn: (LinearSales sales, _) => sales.year,
      measureFn: (LinearSales sales, _) => sales.sales,
      colorFn: (LinearSales sales, _) => sales.year == 0
        ? charts.MaterialPalette.yellow.shadeDefault.darker
        : sales.year == 1
          ? charts.MaterialPalette.red.shadeDefault
          : charts.MaterialPalette.green.shadeDefault,
      data: data,
    )
  ];
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class NutritionHeader extends StatelessWidget {
  ///
  final String mealName;

  ///
  final List<String> nutrientNames;

  ///
  final double stuckAmount;

  /// Called when the user taps this nutrition header.
  final GestureTapCallback onTap;

  /// Called when the user long-presses on this nutrition header.
  final GestureLongPressCallback onLongPress;

  // TOTEST: stuckAmount 0 or 1 by default?
  const NutritionHeader({
    Key key,
    this.stuckAmount = 1,
    @required this.mealName,
    @required this.nutrientNames,
    this.onTap,
    this.onLongPress
  }) : assert(mealName != null), assert(nutrientNames != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        // Opaque header container
        height: 50,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerLeft,
        child: Row(
          // Align text to single baseline
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            // Meal name takes maximum space
            Expanded(
              child: Text(
                mealName,
                style: Theme.of(context).textTheme.body2,
              ),
            ),
            // Statically sized nutrients
            for (var nutrient in nutrientNames)
              HiddenSticky(
                stuckAmount: stuckAmount,
                child: SizedBox(
                  width: 60,
                  child: Text(
                    nutrient,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
              ),
            HiddenSticky(
              stuckAmount: stuckAmount,
              child: SizedBox(
                width: 60,
                child: Text(
                  "CALS",
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class HiddenSticky extends StatelessWidget {
  final double stuckAmount;
  final Widget child;

  const HiddenSticky({Key key, @required this.stuckAmount, @required this.child})
    : assert(stuckAmount != null), assert(child != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    final clampedStuckAmount = stuckAmount.clamp(0.0, 1.0);
    // OPTIMIZE: technically don't need offstage if all go opacity 0
    return Offstage(
      offstage: 1 - clampedStuckAmount <= 0.0,
      child: Opacity(
        opacity: 1 - clampedStuckAmount,
        child: child,
      )
    );
  }
}


// Garbage header and data
//return ListView(
//  children: <Widget>[
//    for (var meal in loadedState.diet.mealNames)
//      StickyHeaderBuilder(
//        builder: (BuildContext context, double stuckAmount) {
//          print("$meal - $stuckAmount");
//          stuckAmount = stuckAmount.clamp(0.0, 1.0);
//          return Container(
//            height: 100.0 - (50 * (1 - stuckAmount)),
//            color: Color.lerp(Colors.blue, Colors.red, stuckAmount),
//            padding: const EdgeInsets.symmetric(horizontal: 16.0),
//            alignment: Alignment.centerLeft,
//            child: Text(
//              meal,
//              style: TextStyle(color: Colors.white),
//            ),
//          );
//        },
//        content: Column(
//          children: <Widget>[
//            for (var i in List.generate(5, (e) => e))
//              Container(
//                height: 72,
//                color: Colors.grey[(i + 1) * 100],
//              ),
//          ],
//        )
//      )
//  ],
//);
