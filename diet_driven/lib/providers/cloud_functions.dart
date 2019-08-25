/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

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

    final result = await _cloudFunction("foodSuggestions")(query);
    return BuiltList<String>.from(result.data);
  }

  /// Fetches [BuiltList] of authenticated user's recent food records.
  ///
  /// Throws [CloudFunctionsException] if cloud functions fails.
  /// Throws [Exception] is function couldn't be called.
  Future<BuiltList<FoodRecord>> fetchRecentFoodRecords() async {
    final result = await _cloudFunction("foodSuggestions")("apple");
    // TODO: implement real cloud function
    return BuiltList<FoodRecord>.from(
      (result.data as List<String>).map<FoodRecord>((name) => FoodRecord.random()
        .rebuild((b) => b
          ..foodName = name
        )
      )
    );
  }

  ///
  HttpsCallable _cloudFunction(String functionName, [int timeoutSeconds = 10]) =>
    CloudFunctions.instance.getHttpsCallable(functionName: functionName)
    ..timeout = Duration(seconds: timeoutSeconds);
}
