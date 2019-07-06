import 'package:diet_driven/log_printer.dart';
import 'package:dio/dio.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:logger/logger.dart';
import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/providers/providers.dart';

/// Data access object for food searching and nutritional information.
class FoodRepository {
//  final Logger log = new Logger("food repository");
  final logger = getLogger("food repository");
  final EdamamProvider _edamamProvider = EdamamProvider();
  final FirestoreProvider _firestoreProvider = FirestoreProvider();

  Future<BuiltList<String>> foodSuggestions(String search) async {
    // TODO: memoize suggestions using https://pub.dev/packages/memoize
    return _edamamProvider.foodSuggestions(search);
  }

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

  /// Returns food record results for [userId]'s [foodLoggingTab].
  /// Used to avoid passing down [foodRepository] and [userId] to every [FoodLoggingTabBloc].
  ///
  /// Throws ... TODOCUMENT
  Future<BuiltList<FoodRecord>> futureFoodRecordResultsFor(FoodLoggingTab foodLoggingTab, String userId) {
    switch(foodLoggingTab) {
      case FoodLoggingTab.recent:
        return recentFoodRecords(userId);
        break;

      case FoodLoggingTab.favorite:
        return recentFoodRecords(userId);
        break;

      case FoodLoggingTab.popular:
        return recentFoodRecords(userId);
        break;

      case FoodLoggingTab.frequent:
        return recentFoodRecords(userId);
        break;

      case FoodLoggingTab.recipes:
        return recentFoodRecords(userId);
        break;

      default:
        throw Exception("$foodLoggingTab isn't defined for futureFoodRecordResultsFor");
    }
  }

  /// Fetches [BuiltList] of [userId]'s most recent [FoodRecord]s from Firestore.
  /// 'recentFoodRecords(userId, daysSinceEpoch)` is called for every diary day from [DiaryBloc].
  ///
  /// Throws [PlatformException] if [userId] is empty.
  /// Returns [null] if Firestore document doesn't exist.
  /// Throws [DeserializationError] if Firestore data is corrupt.
  Future<BuiltList<FoodRecord>> recentFoodRecords(String userId) {
    assert(userId != null && userId.isNotEmpty);

    return _firestoreProvider.recentFoodRecords(userId);
  }
  // TODO: others!

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
