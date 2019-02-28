library diary_page;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
import 'package:diet_driven/built_realtime/connector.dart';
import 'package:diet_driven/containers/drawer_nav_button.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/data/food_record.dart';
import 'package:diet_driven/data/meals.dart';
import 'package:diet_driven/data/page.dart';
import 'package:diet_driven/data/uncertainty.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:intl/intl.dart';


import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'dart:math';


part 'diary_page.g.dart';

// TODO: move to helper library (duplicate)
int daysSinceEpoch(DateTime dt) {
  return dt.difference(DateTime.fromMicrosecondsSinceEpoch(0, isUtc: false)).inDays + 1;
}

DateTime dateSinceEpoch(int daysSinceEpoch) {
  return DateTime.fromMillisecondsSinceEpoch(0, isUtc: false).add(Duration(days: daysSinceEpoch));
}

class DiaryPage extends StoreConnector<AppState, Actions, DiaryPageVM> {

  @override
  DiaryPageVM connect(AppState state) {
    return DiaryPageVM((b) => b
      ..diaryRecords = state.diaryRecords.toBuilder()
      ..mealsSnapshots = state.mealsSnapshots.toBuilder()
      ..userId = state.user.authUser.uid
      ..daysSinceEpoch = state.currentDaysSinceEpoch
      ..date = state.currentDate()
      ..pc = new PageController(initialPage: state.currentDaysSinceEpoch)
    );
  }

  @override
  Widget build(BuildContext context, DiaryPageVM vm, Actions actions) {

    var diary = new FoodDiaryCollection((b) => b
      ..userId = vm.userId
    );

    // TODO: subscribe to list of FS instead!!!
    var meals = new MealSnapshotCollection((b) => b
      ..userId = vm.userId
    );

    // TODO: subscribe (call recordDoc.subscribe(hash) from middleware!!)

    String dateText = DateFormat.yMMMd().format(vm.date);
    int daysDelta = vm.daysSinceEpoch - daysSinceEpoch(DateTime.now());
    if (daysDelta == -1) {
      dateText = "YESTERDAY";
    }
    else if (daysDelta == 0) {
      dateText = "TODAY";
    }
    else if (daysDelta == 1) {
      dateText = "TOMMOROW";
    }

    // FIXME: somehow created multiple instances of diary_page/subscribers: USE KEYS TO AVOID DUPLICATES
    return Subscriber(hashCode, [diarySubscription], builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: GlobalDrawerNavButton(),
          title: Text(
            PageFactory.toText(Page.diary),
            style: TextStyle(fontFamily: "SourceSansPro"),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                dateText,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "SourceSansPro",
                  letterSpacing: 1.2
                ),
              ),
              onPressed: () {
//                actions.goToDate(DateTime.now());
                int currentDaySinceEpoch = daysSinceEpoch(DateTime.now());
                if (vm.pc.page.round() != currentDaySinceEpoch) {
                  print("animating");
                  vm.pc.animateToPage(currentDaySinceEpoch, duration: Duration(milliseconds: 200), curve: Curves.bounceIn); // TODO: as middleware - or do manually! (update state on onPageChanged)
                }
                // TODO: filter foods based on days since epoch instead of by datetime (allows past midnight snacks) - only allow when manually changing timestamp
              },
            ),

            IconButton(
              icon: Icon(Icons.info),
              onPressed: () => vm.pc.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.bounceIn),
//              onPressed: () => pc.jumpToPage(1), // doesn't cause multiple index updates...
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => diary.clear(),
            )
          ],
        ),
        // TODO: OrientationBuilder(builder: (context, orientation) {
        body: PageView.builder(
          controller: vm.pc,
          itemBuilder: (BuildContext context, int index) {
            // Don't show anything more than 1 day off FIXME
//            if ((daysSinceEpoch(vm.date) - index).abs() > 1) {
//              return Container();
//            }

//            MealSnapshot mealSnapshot = vm.mealSnapshots.where((ms) => index <= ms.effectiveAsOf).first;
            MealsSnapshot mealSnapshot = vm.mealsSnapshots.last;
            BuiltList<FoodRecord> todaysFoodRecords = BuiltList.from(vm.diaryRecords.where((fr) => fr.daysSinceEpoch == index));

            return Container(
              child: ListView(
                children: [
                  Text(
                    "INDEX: $index | meals: ${mealSnapshot.meals.length}",
                    style: TextStyle(
                      fontFamily: "SourceSansPro",
                    ),
                  ),
                  Text(
                    new DateFormat.yMMMd().format(vm.date),
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "SourceSansPro",
                    ),
                  ),
                  Text(
                    "${todaysFoodRecords.length} entries",
                    style: TextStyle(
                      fontFamily: "SourceSansPro",
                    ),
                  ),
                  Column(
                    children: mealSnapshot.meals.map((meal) {
                      BuiltList<FoodRecord> mealDiaryRecords = BuiltList.from(
                        todaysFoodRecords.where((fr) => fr.mealIndex == meal.mealIndex).toList()
                      );

                      return Meal(meal, mealDiaryRecords, actions);
                    }).toList()
                  ),
                ]
              ),
            );
          },
          onPageChanged: (int index) {
            log.fine("index now $index");
            actions.goToDaysSinceEpoch(index);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
//          heroTag: "ANIMATE_FAB", // FIXME: only works for navigation events...
          onPressed: () {
            FoodRecord fr = new FoodRecord((b) => b
              ..daysSinceEpoch = vm.daysSinceEpoch
              ..mealIndex = 2
              ..foodName = randomFood()
              ..grams = new Random().nextInt(100).toDouble()
              ..uncertainty = Uncertainty.accurate
              ..timestamp = DateTime.now().toUtc()
            );

            actions.firestore.saveFoodRecord(FSDynamicTuple(FoodDiaryCollection(), fr));
          }
        ),
      );
    });
  }
}

abstract class DiaryPageVM implements Built<DiaryPageVM, DiaryPageVMBuilder> {
  BuiltList<FoodRecord> get diaryRecords;
  BuiltList<MealsSnapshot> get mealsSnapshots;
  String get userId;
  int get daysSinceEpoch;
  DateTime get date;

  PageController get pc;

  DiaryPageVM._();
  factory DiaryPageVM([updates(DiaryPageVMBuilder b)]) = _$DiaryPageVM;
}
