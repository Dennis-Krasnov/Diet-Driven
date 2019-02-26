library diet_page;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/containers/drawer_nav_button.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/food_record.dart';
import 'package:diet_driven/models/meals.dart';
import 'package:diet_driven/models/page.dart';
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
    );
  }

  @override
  Widget build(BuildContext context, DietPageVM vm, Actions actions) {
    return Scaffold(
      appBar: AppBar(
        leading: DrawerNavButton(),
        title: Text(PageFactory.toText(Page.diet)),
      ),
      body: Container()
       //        meal logic (modifying last snapshot, do duplicates in day)
    );
  }
}

abstract class DietPageVM implements Built<DietPageVM, DietPageVMBuilder> {
  BuiltList<FoodRecord> get diaryRecords;
  BuiltList<MealsSnapshot> get mealsSnapshots;
  String get userId;
  int get daysSinceEpoch;
  DateTime get date;

  DietPageVM._();
  factory DietPageVM([updates(DietPageVMBuilder b)]) = _$DietPageVM;
}

//class DietPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        leading: DrawerNavButton(),
//        title: Text(PageFactory.toText(Page.diet)),
//      ),
//      body: Container()
//    );
//  }
//}
