library diary_page;

import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/built_realtime/built_firestore.dart';
import 'package:diet_driven/containers/drawer_nav_button.dart';
import 'package:diet_driven/containers/page_factory.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/food_record.dart';
import 'package:diet_driven/models/page.dart';
import 'package:diet_driven/models/uncertainty.dart';
import 'package:flutter/material.dart' hide Builder;

import 'package:flutter_built_redux/flutter_built_redux.dart';

part 'diary_page.g.dart';

class DiaryPage extends StoreConnector<AppState, Actions, DiaryPageVM> {
  @override
  DiaryPageVM connect(AppState state) {
    return DiaryPageVM((b) => b
      ..diaryRecords = state.diaryRecords.toBuilder()
      ..userId = state.user.authUser.uid
    );
  }

  @override
  Widget build(BuildContext context, DiaryPageVM vm, Actions actions) {

//    var fsDiary = new FSCollection<FoodRecord>((b) => b
//      ..path = new DiaryRecordCollectionPath((b) => b
//        ..userId = vm.userId
//      )
//      ..listeners = ListBuilder([hashCode])
//    );

//    var recordDoc = new FoodRecordDocument((b) => b
    var diary = new FoodDiaryCollection((b) => b
        ..userId = vm.userId
//        ..foodRecordId = "GghXszkalMujOoccj5Hf"
    );
    // TODO: subscibe (call recordDoc.subscribe(hash) from middleware!!)

    return Connector(actions, diary, builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: DrawerNavButton(),
          title: Text(PageFactory.toText(Page.diary)),
        ),
        body: ListView(
          children: vm.diaryRecords.map((fr) =>
            ListTile(
              title: Text(fr.foodName),
              subtitle: Text(fr.grams.toString()),
              leading: null,
              trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => diary.delete(fr)
              ),
              // TODO: CREATE FSCOLLECTION<FOODRECORD>, WITH DIARY_RECORD_PATH (LISTEN TO ALL DAYS FOR NOW)
            )
          ).toList()
          ..add(ListTile(
            title: Text("DELETE ALL"),
            onTap: () => diary.clear(),
          ))//<Widget>[],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // TODO: actions.navigation.goTo(editPage) with an empty food
//            var fsDiaryRecord = new FSDocument<FoodRecord>((b) => b
//              ..path = new DiaryRecordPath((b) => b
//                ..userId = vm.userId
//                ..diaryRecordId = (new Random().nextInt(1000)).toString() // TODO: allow nullable ID, to be generated!!!
//              )
//              ..listeners = ListBuilder([5235])
//            );

            var foods = ["Grilled Pork Chops","Penne, Beef and Vegetable Casserole","Bang-Bang Shrimp","Slow Cooker Coq au Vin","Steak Sandwiches with Caramelized Peppers, Onions and Garlic","Slow-Cooker Cincinnati Chili","Instant Pot Turkey Chili","Skinnified Pork and Bean Burrito","Kale Pesto Avocado Grilled Cheese","Thai Peanut Chicken","Low Carb Peanut Butter Swirl Frozen Yogurt {No Sugar Added}","Chicken Salad with Grapes and Walnuts","Chef Race: Cornmeal-Crusted Catfish with Tomato-Zucchini Rice and Radish Slaw","Creamy Baked Risotto with Italian Sausage and Sun-Dried Tomatoes","Cook the Book: Shepherd's Pie","Grilled Chicken, Zucchini, and Quinoa Salad","Fruit Salad with Grilled Chicken and Citrus Poppy Seed Dressing","Chicken Fajita Casserole: One Pot, Many Flavors","Spinach Burrata Omelet with Avocado Salad","Roasted Garlic Macaroni and Cheese","Salmon Sandwiches with Fries","Grilled chicken with chilli & sesame seeds","Smoked Salmon Carbonara with Lemon and Dill","Calamari","Sweet Thai Shrimp Curry with Peanut Noodles","Beef Curry ??????","Pork Chops Romano in Lemon-Butter Sauce","Pork Tacos with Cilantro-Avocado Cream Sauce","Almond-Thyme-Crusted Mahi Mahi with Lemon Chardonnay Sauce","Stir-Fried Udon Noodles with Bok Choy","Creamy chicken & mango curry","Slow Cooker Chicken and Wild Rice Soup","Mexican Chicken Taco Skillet","Caprese Mac and Cheese","Homemade Creamy Chicken Noodle Soup","Seared Short Rib Wraps from 'Family Table","Chipotle Chicken Grilled Cheese Sandwich + Emmi USA’s “Gourmelt” Grilled Cheese Contest","Skirt Steak With Arugula Salad","Chicken Fajita Burgers","Contest-Winning Eggplant Parmesan","Roasted Summer Vegetable Mac + Cheese","Spinach and Artichoke Chicken","Caprese Zucchini Noodle Salad","Healthy Chicken Burgers with Spinach Basil Pesto & Mozzarella","Super Mom Stir Fry","Coconut & tamarind chicken curry","Guinea fowl tagine","Slow Cooker Chicken Tortellini Soup","Oven Baked Chicken Tacos – Our Newest Family Favorite","Coconut Pound Cake","Creamy Green Chile Chicken Enchiladas","Chicken Cacciatore","Bird's Nest Egg Salad","POTATOES WITH CHEESE SAUCE (PAPAS CHORREADAS)","Greek pasta salad","Mediterranean Crab and Couscous Stuffed Mushrooms","Snapper","Pan-Seared Cod in White Wine Tomato Basil Sauce","Cheesy Chicken and Broccoli Whole Wheat Pasta","Tofu Kabobs with Cherry Barbecue Sauce","Pan-seared Salmon with Asparagus for #WeekdaySupper","Grilled Watermelon Salad","Faggots with onion gravy","The TJ Hooker Pizza (Chipotle BBQ and Sweet Chili Pineapple + Jalapeño Pizza with Bacon)","Chicken and Corn Chowder","Dinner Tonight: Flattened Chicken with Tomato-Saffron Vinaigrette on Arugula","Slow Cooker Meatball Subs","Minty carrot, pistachio & feta salad","One Pot Garlic Butter Chicken, Green Beans & Potatoes","Avocado BLT","Seared Scallops with a Pomegranate Drizzle","Golden Beet & Beet Greens Pasta W/ Ricotta and Feta Cheese"];

            foods.shuffle();


            FoodRecord fr = new FoodRecord((b) => b
                ..foodName = foods[0]
                ..grams = new Random().nextInt(100).toDouble()
                ..uncertainty = Uncertainty.accurate
            );

            diary.add(fr);
//            fsDiaryRecord.save(fr);
          }
        ),
      );
    });

  }
}

// Use as a (generic) stateful HOC with subscription!!! (generic extends FS)
class Connector extends StatefulWidget {
  final Actions actions;
  final FS connection;
  final Widget Function(BuildContext context) builder;

  Connector(this.actions, this.connection, {@required this.builder});

  @override
  State<StatefulWidget> createState() => new ConnectorState();
}

class ConnectorState extends State<Connector> {

  @override
  void initState() {
    super.initState();
    widget.actions.firestore.subscribe(widget.connection);
  }

  @override
  void dispose() {
    widget.actions.firestore.unsubscribe(widget.connection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

}

abstract class DiaryPageVM implements Built<DiaryPageVM, DiaryPageVMBuilder> {
  BuiltList<FoodRecord> get diaryRecords;
  String get userId;

  DiaryPageVM._();
  factory DiaryPageVM([updates(DiaryPageVMBuilder b)]) = _$DiaryPageVM;
}


//class DiaryPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        leading: DrawerNavButton(),
//        title: Text(PageFactory.toText(Page.diary)),
//      ),
//      body: Container(
//        color: Colors.limeAccent,
//        child: _buildBody(context),
//      ),
//    );
//  }
//}

//Widget _buildBody(BuildContext context) {
//  return StreamBuilder<QuerySnapshot>(
//    stream: Firestore.instance.collection('users').snapshots(),
//    builder: (context, snapshot) {
//      if (!snapshot.hasData) return LinearProgressIndicator();
//
////      return _buildList(context, snapshot.data.documents);
//
//
//      List<Widget> children = snapshot.data.documents
//          .map((record) =>
////          assert(map['name'] != null)
//              SwitchListTile(
//                title: Text("Sex is male"),
//                subtitle: Text(record.reference.path),
//                value: record.data["sex"] == "m",
////                onChanged: (v) => doc.reference.updateData({'sex': v ? "m" : "f"}),
//                onChanged: (v) => Firestore.instance.runTransaction((tx) async {
//                  final freshSnapshot = await tx.get(record.reference);
////                  final fresh = Record.fromSnapshot(freshSnapshot);
//
//                  await tx.update(record.reference, {
//                    'sex': freshSnapshot.data["sex"] == "m" ? "f" : "m"
//                  });
//                }),
//              ))
//          .toList();
//
//      return ListView(
//        children: children,
//        padding: const EdgeInsets.only(top: 20.0),
//      );
//    },
//  );
//}

//final DocumentReference postRef = Firestore.instance.document('posts/123');
  //Firestore.instance.runTransaction((Transaction tx) async {
  //DocumentSnapshot postSnapshot = await tx.get(postRef);
  //if (postSnapshot.exists) {
    //await tx.update(postRef, <String, dynamic>{'likesCount': postSnapshot.data['likesCount'] + 1});
  //}
//});
