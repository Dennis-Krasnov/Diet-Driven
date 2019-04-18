import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/providers.dart';
import 'package:rxdart/rxdart.dart';

class FoodRepository {
  final EdamamProvider _edamamProvider = EdamamProvider();
  final FirestoreProvider _firestoreProvider = FirestoreProvider();

  // Provides synchronous access to the last emitted item
  // Subscribes to stream only once upon first subscriber, disposes subject when there are no more subscribers
//  ValueObservable<BuiltList<FoodDiaryDay>> foodDiaryValue;

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
}
