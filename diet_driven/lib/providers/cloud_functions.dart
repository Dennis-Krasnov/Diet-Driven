import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_functions/cloud_functions.dart';

import 'package:diet_driven/models/models.dart';

/// Firebase Cloud Functions provider using `cloud_functions` library.
///
/// Auth ID token is automatically included for authenticated users.
/// Callable functions use interface https://firebase.google.com/docs/functions/callable-reference
class CloudFunctionsProvider {

  ///   ########  #######   #######  ########        ##        #######   ######    ######   #### ##    ##  ######
  ///   ##       ##     ## ##     ## ##     ##       ##       ##     ## ##    ##  ##    ##   ##  ###   ## ##    ##
  ///   ##       ##     ## ##     ## ##     ##       ##       ##     ## ##        ##         ##  ####  ## ##
  ///   ######   ##     ## ##     ## ##     ##       ##       ##     ## ##   #### ##   ####  ##  ## ## ## ##   ####
  ///   ##       ##     ## ##     ## ##     ##       ##       ##     ## ##    ##  ##    ##   ##  ##  #### ##    ##
  ///   ##       ##     ## ##     ## ##     ##       ##       ##     ## ##    ##  ##    ##   ##  ##   ### ##    ##
  ///   ##        #######   #######  ########        ########  #######   ######    ######   #### ##    ##  ######

  /// Fetches [BuiltList] of relevant food search suggestions based on current [query].
  ///
  /// Throws [CloudFunctionsException] if cloud functions fails.
  /// Throws [Exception] is function couldn't be called.
  Future<BuiltList<String>> fetchFoodSearchSuggestions(String query) async {
    assert(query != null && query.isNotEmpty);

    final cloudFunction = CloudFunctions.instance.getHttpsCallable(functionName: "foodSuggestions")..timeout = Duration(seconds: 10);
    final result = await cloudFunction(query);
    return BuiltList<String>.from(result.data);
  }

  /// Fetches [BuiltList] of authenticated user's recent food records.
  ///
  /// Throws [CloudFunctionsException] if cloud functions fails.
  /// Throws [Exception] is function couldn't be called.
  Future<BuiltList<FoodRecord>> fetchRecentFoodRecords() async {
    // TODO: implement real cloud function
    final cloudFunction = CloudFunctions.instance.getHttpsCallable(functionName: "foodSuggestions")..timeout = Duration(seconds: 10);
    final result = await cloudFunction("apple");
    return BuiltList<FoodRecord>.from(
      (result.data as List<String>).map<FoodRecord>((name) => FoodRecord((b) => b
        ..foodName = name
        ..grams = Random().nextInt(100)
        ..calories = Random().nextInt(1000)
        ..protein = Random().nextInt(100)
        ..fat = Random().nextInt(100)
        ..carbs = Random().nextInt(100)
      ))
    );
  }
}
