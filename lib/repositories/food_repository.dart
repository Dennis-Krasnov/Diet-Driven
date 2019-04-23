import 'package:logging/logging.dart';
import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/providers.dart';

/// Data access object for food searching and nutritional information.
class FoodRepository {
  final Logger log = new Logger("food repository");
  final EdamamProvider _edamamProvider = EdamamProvider();
  final FirestoreProvider _firestoreProvider = FirestoreProvider();

  /// Fetches [BuiltList] of [FoodRecord] based on [search].
  /// TODO: where called from
  ///
  /// Throws [DioError] if unsuccessful.
  Future<BuiltList<FoodRecord>> searchForFood(String search) {
    // Parsed is matching result (give it a star or something - boolean flag)
    // manually create my own objects! create fromJSON methods in provider...
    // hints is all other result...

    // cache next page uri if called again... (hide details from bloc)
    return _edamamProvider.searchForFood(search);
  }

  /// Fetches more detailed version of [FoodRecord].
  /// TODO: where called from
  ///
  /// Throws [DioError] if unsuccessful.
  Future<FoodRecord> foodRecordInfo(FoodRecord foodRecord) {
    // Cached server, edamam, load food statistics, history, pictures, everything about it
//    final EdamamData = await _edamamProvider.info(foodRecord.edamamId); // if it exists...
    return Future.value(foodRecord);
  }
}

// TODO: create enum for each measure, make a method here that does a switch, converts to edamam url...
//  Name	URI
//  Ounce	http://www.edamam.com/ontologies/edamam.owl#Measure_ounce
//  Gram	http://www.edamam.com/ontologies/edamam.owl#Measure_gram
//  Pound	http://www.edamam.com/ontologies/edamam.owl#Measure_pound
