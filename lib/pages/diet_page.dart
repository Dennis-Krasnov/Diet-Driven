library diet_page;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/data/food.dart';
import 'package:diet_driven/data/meals.dart';
import 'package:diet_driven/data/page.dart';
import 'package:diet_driven/pages/page_factory.dart';
import 'package:diet_driven/util/built_firestore.dart';
import 'package:diet_driven/wrappers/drawer_nav_button.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_built_redux/flutter_built_redux.dart';

part 'diet_page.g.dart';

class DietPage extends StoreConnector<AppState, Actions, DietPageVM> {

  @override
  DietPageVM connect(AppState state) {
    return DietPageVM((b) => b
      ..mealsSnapshots = state.mealsSnapshots.toBuilder()
      ..userId = state.user.authUser.uid
      ..daysSinceEpoch = state.currentDaysSinceEpoch
      ..date = state.currentDate()
      ..navState = state.navigation.toBuilder()
    );
  }

  @override
  Widget build(BuildContext context, DietPageVM vm, Actions actions) {
    return Scaffold(
      appBar: AppBar(
        leading: GlobalDrawerNavButton(),
        title: Text(PageFactory.toText(Page.diet)),
      ),
      body: Container(),
       // TODO: meal logic (modifying last snapshot, do duplicates in day)
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.save),
        label: Text("save navigation settings"),
        onPressed: () {
          var temp = FSTuple<NavigationState>(
            NavigationStateDocument((b) => b
              ..userId = vm.userId
            ),
            vm.navState
          );
          actions.firestore.updateNavigationState(temp);
        }
      ),
    );
  }
}

abstract class DietPageVM implements Built<DietPageVM, DietPageVMBuilder> {
  BuiltList<FoodRecord> get diaryRecords;
  BuiltList<MealsSnapshot> get mealsSnapshots;
  String get userId;
  int get daysSinceEpoch;
  DateTime get date;
  NavigationState get navState;

  DietPageVM._();
  factory DietPageVM([updates(DietPageVMBuilder b)]) = _$DietPageVM;
}