library diary_page;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
import 'package:diet_driven/built_realtime/connector.dart';
import 'package:diet_driven/containers/drawer_nav_button.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/food_record.dart';
import 'package:diet_driven/models/page.dart';
import 'package:diet_driven/models/uncertainty.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:intl/intl.dart';


import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'dart:math';


part 'diary_page.g.dart';

String randomFood() {
  var foods = ["Grilled Pork Chops","Penne, Beef and Vegetable Casserole","Bang-Bang Shrimp","Slow Cooker Coq au Vin","Steak Sandwiches with Caramelized Peppers, Onions and Garlic","Slow-Cooker Cincinnati Chili","Instant Pot Turkey Chili","Skinnified Pork and Bean Burrito","Kale Pesto Avocado Grilled Cheese","Thai Peanut Chicken","Low Carb Peanut Butter Swirl Frozen Yogurt {No Sugar Added}","Chicken Salad with Grapes and Walnuts","Chef Race: Cornmeal-Crusted Catfish with Tomato-Zucchini Rice and Radish Slaw","Creamy Baked Risotto with Italian Sausage and Sun-Dried Tomatoes","Cook the Book: Shepherd's Pie","Grilled Chicken, Zucchini, and Quinoa Salad","Fruit Salad with Grilled Chicken and Citrus Poppy Seed Dressing","Chicken Fajita Casserole: One Pot, Many Flavors","Spinach Burrata Omelet with Avocado Salad","Roasted Garlic Macaroni and Cheese","Salmon Sandwiches with Fries","Grilled chicken with chilli & sesame seeds","Smoked Salmon Carbonara with Lemon and Dill","Calamari","Sweet Thai Shrimp Curry with Peanut Noodles","Beef Curry ??????","Pork Chops Romano in Lemon-Butter Sauce","Pork Tacos with Cilantro-Avocado Cream Sauce","Almond-Thyme-Crusted Mahi Mahi with Lemon Chardonnay Sauce","Stir-Fried Udon Noodles with Bok Choy","Creamy chicken & mango curry","Slow Cooker Chicken and Wild Rice Soup","Mexican Chicken Taco Skillet","Caprese Mac and Cheese","Homemade Creamy Chicken Noodle Soup","Seared Short Rib Wraps from 'Family Table","Chipotle Chicken Grilled Cheese Sandwich + Emmi USA’s “Gourmelt” Grilled Cheese Contest","Skirt Steak With Arugula Salad","Chicken Fajita Burgers","Contest-Winning Eggplant Parmesan","Roasted Summer Vegetable Mac + Cheese","Spinach and Artichoke Chicken","Caprese Zucchini Noodle Salad","Healthy Chicken Burgers with Spinach Basil Pesto & Mozzarella","Super Mom Stir Fry","Coconut & tamarind chicken curry","Guinea fowl tagine","Slow Cooker Chicken Tortellini Soup","Oven Baked Chicken Tacos – Our Newest Family Favorite","Coconut Pound Cake","Creamy Green Chile Chicken Enchiladas","Chicken Cacciatore","Bird's Nest Egg Salad","POTATOES WITH CHEESE SAUCE (PAPAS CHORREADAS)","Greek pasta salad","Mediterranean Crab and Couscous Stuffed Mushrooms","Snapper","Pan-Seared Cod in White Wine Tomato Basil Sauce","Cheesy Chicken and Broccoli Whole Wheat Pasta","Tofu Kabobs with Cherry Barbecue Sauce","Pan-seared Salmon with Asparagus for #WeekdaySupper","Grilled Watermelon Salad","Faggots with onion gravy","The TJ Hooker Pizza (Chipotle BBQ and Sweet Chili Pineapple + Jalapeño Pizza with Bacon)","Chicken and Corn Chowder","Dinner Tonight: Flattened Chicken with Tomato-Saffron Vinaigrette on Arugula","Slow Cooker Meatball Subs","Minty carrot, pistachio & feta salad","One Pot Garlic Butter Chicken, Green Beans & Potatoes","Avocado BLT","Seared Scallops with a Pomegranate Drizzle","Golden Beet & Beet Greens Pasta W/ Ricotta and Feta Cheese"];
  foods.shuffle();
  return foods[0];
}

int daysSinceEpoch(DateTime dt) {
  return dt.difference(DateTime.fromMicrosecondsSinceEpoch(0)).inDays + 1;
}

class DiaryPage extends StoreConnector<AppState, Actions, DiaryPageVM> {

  @override
  DiaryPageVM connect(AppState state) {
    return DiaryPageVM((b) => b
      ..diaryRecords = state.diaryRecords.toBuilder()
      ..userId = state.user.authUser.uid
      ..date = state.currentDate
    );
  }

  @override
  Widget build(BuildContext context, DiaryPageVM vm, Actions actions) {
    // TODO: store in store?
    PageController pc = new PageController(initialPage: daysSinceEpoch(DateTime.now()));

    var diary = new FoodDiaryCollection((b) => b
      ..userId = vm.userId
    );

    // TODO: subscribe (call recordDoc.subscribe(hash) from middleware!!)

    String dateText = DateFormat.yMMMd().format(vm.date);
    int daysDelta = vm.date.day - DateTime.now().day;
    if (daysDelta == -1) {
      dateText = "YESTERDAY";
    }
    else if (daysDelta == 0) {
      dateText = "TODAY";
    }
    else if (daysDelta == 1) {
      dateText = "TOMMOROW";
    }

    return Connector(actions, diary, builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: DrawerNavButton(),
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
                if (pc.page.round() != daysSinceEpoch) {
                  print("animating");
                  pc.animateToPage(daysSinceEpoch(DateTime.now()), duration: Duration(milliseconds: 200), curve: Curves.bounceIn); // TODO: as middleware - or do manually! (update state on onPageChanged)
                }
                // TODO: filter foods based on days since epoch instead of by datetime (allows past midnight snacks) - only allow when manually changing timestamp
              },
            ),

            IconButton(
              icon: Icon(Icons.info),
              onPressed: () => pc.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.bounceIn),
//              onPressed: () => pc.jumpToPage(1), // doesn't cause multiple index updates...
            )
          ],
        ),
        body: PageView.builder(
          controller: pc,
          itemBuilder: (BuildContext context, int index) {
            // Don't show anything more than 1 day off
            if ((daysSinceEpoch(vm.date) - index).abs() > 1) {
              return Container();
            }

            return Container(
              child: Column(
                children: [
                  Text("INDEX: $index"),
                  Text(
                    new DateFormat.yMMMd().format(vm.date),
                    style: TextStyle(
                        fontSize: 22
                    ),
                  ),
                  Text("${vm.diaryRecords.length} entries"),

                  ListView(
                    shrinkWrap: true,
//                  FIXME: (fr) => (daysSinceEpoch(fr.timestamp) - index).abs() <= 1
                    children: vm.diaryRecords.where((fr) => daysSinceEpoch(fr.timestamp) == index).map((fr) => // FIXME: slightly broken
                  // TODO: create component out of this, very customizable
                      ListTile(
                        title: Text(fr.foodName),
                        subtitle: Text(DateFormat.yMMMd().format(fr.timestamp)),
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.chevron_left),
                                onPressed: () {
                                  FoodRecordDocument((b) => b
                                    ..userId = vm.userId
                                    ..foodRecordId = fr.id
                                  ).update(fr.rebuild((b) => b..timestamp = b.timestamp.add(Duration(days: -1))));
                                }
                            ),
                            IconButton(
                              icon: Icon(Icons.chevron_right),
                              onPressed: () {
                                FoodRecordDocument((b) => b
                                  ..userId = vm.userId
                                  ..foodRecordId = fr.id
                                ).update(fr.rebuild((b) => b..timestamp = b.timestamp.add(Duration(days: 1))));
                              }
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
          //                onPressed: () => diary.delete(fr)
                          onPressed: () => FoodRecordDocument((b) => b..userId = vm.userId ..foodRecordId = fr.id).delete()
                        ),
                        onTap: () {
                          FoodRecordDocument((b) => b // TODO: pass doc to edit page
                            ..userId = vm.userId
                            ..foodRecordId = fr.id
                          ).update(fr.rebuild((b) => b..foodName = randomFood()));
                        },
                      )
                    ).toList()
                  ),
                  RaisedButton(
                    child: Text("DELETE ALL"),
                    onPressed: () => diary.clear(),
                  ),
                ]
              ),
            );
          },
          onPageChanged: (int index) {
            print("INDEX NOW: $index");
            actions.goToDate(DateTime.fromMillisecondsSinceEpoch(Duration(days: index).inMilliseconds));
            // TODO: absolutely set current day in store (to avoid jumps during midnight)
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
//          heroTag: "ANIMATE_FAB", // FIXME: only works for navigation events...
          onPressed: () {
            FoodRecord fr = new FoodRecord((b) => b
                ..foodName = randomFood()
                ..grams = new Random().nextInt(100).toDouble()
                ..uncertainty = Uncertainty.accurate
                ..timestamp = DateTime.now().toUtc()
            );

            diary.add(fr);
//            fsDiaryRecord.save(fr);
          }
        ),
      );
    });
  }
}

abstract class DiaryPageVM implements Built<DiaryPageVM, DiaryPageVMBuilder> {
  BuiltList<FoodRecord> get diaryRecords;
  String get userId;
  DateTime get date;

  DiaryPageVM._();
  factory DiaryPageVM([updates(DiaryPageVMBuilder b)]) = _$DiaryPageVM;
}
