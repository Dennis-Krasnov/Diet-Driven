import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/providers.dart';
import 'package:rxdart/rxdart.dart';

class FoodRepository {
  final EdamamProvider _edamamProvider = EdamamProvider();
  final FirestoreProvider _firestoreProvider = FirestoreProvider();
  final RemoteConfigProvider _remoteConfigProvider = RemoteConfigProvider();

  // An Observable that provides synchronous access to the last emitted item
  ValueObservable<BuiltList<FoodDiaryDay>> foodDiaryValue;

  ///
  Future<void> foodDiaryUpdate(String userId, int daysSinceEpoch, FoodDiaryDay foodDiaryDay) {
    print("uploading $foodDiaryDay");
    return _firestoreProvider.foodDiaryUpdate(userId, daysSinceEpoch, foodDiaryDay);
  }

  ///
  Future<void> foodDiaryDelete(String userId, int daysSinceEpoch) {
    return _firestoreProvider.foodDiaryDelete(userId, daysSinceEpoch);
  }

  // It will subscribe to the stream as soon as there is a single subscriber (it will only subscribe once)
  // and unsubscribe (and dispose the subject) when there are no more subscribers.
  ValueObservable<BuiltList<FoodDiaryDay>> foodDiaryList(String userId) {
//    return BehaviorSubject<BuiltList<FoodDiaryDay>>()..close(); // subscription ended error message
//    return BehaviorSubject<BuiltList<FoodDiaryDay>>()..add(null); // continuously waits


    // assign only if it's null
    foodDiaryValue ??= _firestoreProvider.foodDiaryList(userId).shareValue(); // delay(Duration(seconds: 3)).
//      ..listen((val) => print("Loaded ${val.length} days with ${val.fold(0, (prev, element) => prev + element.foodRecords.length)} records total"));
      /// do this: just keep a dummy listen (dispose of it alongside home screen), each bloc has a reference to this value observable, can clone, transform it in any way!
      // ie. TODO: create a subscription of fooddiarybloc init, close it on fooddiarybloc displose!!!!!!!!!!!!!

    // this way I have decoupled loading state and firestore data, can show 'skeleton screens' instead of real data...
    // https://www.sitepoint.com/how-to-speed-up-your-ux-with-skeleton-screens/ see facebook section!! - make loading state a blank screen!
//    https://medium.com/flutter-community/make-shimmer-effect-in-flutter-dbe7a1bfd980
    // loading state would only depend on everything but firestore (mission critical data like settings, whether allowed to see page at all)
    // this is ok, no need to create another state... people try to accomplish this intentionally!

    // try to use similar thing for displaying food information: show cached basic info, show skeleton loading for the micronutrients until loaded! (if possible)

    return foodDiaryValue;
  }

  Future<BuiltList<FoodDiaryDay>> foodDiaryListSingle(String userId) {
    return _firestoreProvider.foodDiaryListSingle(userId);
  }

  Future<BuiltList<FoodRecord>> searchForFood(String search) {
    // Parsed is matching result (give it a star or something - boolean flag)
    // manually create my own objects! create fromJSON methods in provider...
    // hints is all other result...

    // cache next page uri if called again... (hide from bloc details)
    return _edamamProvider.searchForFood(search);
  }

// TODO: create enum for each measure, make a method here that does a switch, converts to edamam url...
//  Name	URI
//  Ounce	http://www.edamam.com/ontologies/edamam.owl#Measure_ounce
//  Gram	http://www.edamam.com/ontologies/edamam.owl#Measure_gram
//  Pound	http://www.edamam.com/ontologies/edamam.owl#Measure_pound

//  Future<FoodRecordComplete> // just a bunch of nullable stats instead !!!
  Future<FoodRecord> foodRecordInfo(FoodRecord foodRecord) {
    // Cached server, edamam, load food statistics, history, pictures, everything about it
//    final EdamamData = await _edamamProvider.info(foodRecord.edamamId); // if it exists...
    return Future.value(foodRecord);
  }

//  Future<Data> getAllDataThatMeetsRequirements() async {
//    final RawDataA dataSetA = await dataProviderA.readData();
//    final RawDataB dataSetB = await dataProviderB.readData();
//
//    final Data filteredData = _filterData(dataSetA, dataSetB);
//    return filteredData;
//  }
}

// old rambling:
// printing (won't ever unsubscribe) TODO: remove print, multiple blocs listen to subscribe to this behaviour subject through repository!
// this would decouple blocs // TODO: place food diary bloc only around food diary page, compose only its subpages
// FIXME: if I remove print, and all unsubscribe, then this won't be null and will somehow need to re-initialize itself...
//    somehow, using BehaviorSubject().isClosed;

//{"text":"apple",
//  "parsed": [
//    {"food": {
//      "foodId":"food_bnbh4ycaqj9as0a9z7h9xb2wmgat",
//      "uri":"http://www.edamam.com/ontologies/edamam.owl#Food_09003",
//      "label":"Apples, raw, with skin",
//      "nutrients": {
//        "ENERC_KCAL":52.0,
//        "PROCNT":0.26,
//        "FAT":0.17,
//        "CHOCDF":13.81,
//        "FIBTG":2.4
//      },
//      "category": "Generic foods",
//      "categoryLabel":"food"
//    }}
//  ],
//  "hints": [
//    {"food":{
//      "foodId":"food_bnbh4ycaqj9as0a9z7h9xb2wmgat",
//      "uri":"http://www.edamam.com/ontologies/edamam.owl#Food_09003",
//      "label":"Apples, raw, with skin",
//      "nutrients":{"ENERC_KCAL":52.0,"PROCNT":0.26,"FAT":0.17,"CHOCDF":13.81,"FIBTG":2.4},
//      "category":"Generic foods","categoryLabel":"food"},
//      "measures":[
//        {
//          "uri":"http://www.edamam.com/ontologies/edamam.owl#Measure_unit",
//          "label": "Whole",
//          "qualified":[
//            [{"uri":"http://www.edamam.com/ontologies/edamam.owl#Qualifier_small","label":"small"}],
//            [{"uri":"http://www.edamam.com/ontologies/edamam.owl#Qualifier_medium","label":"medium"}],
//            [{"uri":"http://www.edamam.com/ontologies/edamam.owl#Qualifier_large","label":"large"}]
//          ]
//        },
//        {"uri":"http://www.edamam.com/ontologies/
