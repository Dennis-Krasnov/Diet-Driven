import 'package:built_collection/built_collection.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dio/dio.dart';

import 'package:diet_driven/models/models.dart';
import 'package:firebase_core/firebase_core.dart';

/// Edamam nutrition api.
/// https://www.edamam.com/
class EdamamProvider {
  // FIXME + document what I need to specify to get started - firebase.json and this + configure code magic
  String appKey = "88fbceb07e4fa287b47fefa3db2004f3";
  String appId = "1c25cea1";

  static BaseOptions options = new BaseOptions(
    baseUrl: "https://api.edamam.com/api",
    responseType: ResponseType.json,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  // TODO: call (token authenticated) cloud function directly
  // it stores the secret keys (specify which api to use), contacts edamam and everything else, returns nice response
  // TODO: protect against too many requests

  final Dio _dio = Dio(options);

  Future<BuiltList<String>> foodSuggestions(String search) async {

    final HttpsCallable foodSuggestionsFunction = CloudFunctions.instance.getHttpsCallable(functionName: 'foodSuggestions');
    foodSuggestionsFunction.timeout = Duration(seconds: 10);

//   Cloud function parameters CANNOT be defined as <String, dynamic>{}
    HttpsCallableResult result = await foodSuggestionsFunction({"query": search});

    print("result: $result");
    print("result data: ${result.data}");

    return BuiltList<String>.from(result.data);
  }

  // FIXME: move error catching to bloc!
  Future<BuiltList<FoodRecord>> searchForFood(String search) async {
    var encoded = Uri.encodeFull("/food-database/parser?ingr=$search&app_id=$appId&app_key=$appKey");
    Response response = await _dio.get(encoded);

    var json = Map<String, dynamic>.from(response.data);

    var parsed = json["parsed"];
    var hints = json["hints"];

    return BuiltList<FoodRecord>(
      (hints as List).map((json) {
        var foodRecord = json["food"];
        print(foodRecord);
        return FoodRecord((b) => b
//          ..foodName = foodRecord["foodId"] as String TODO: edamam id
          ..foodName = foodRecord["label"] as String
          ..grams = 100
          ..calories = foodRecord["nutrients"]["ENERC_KCAL"] as num
          ..protein = foodRecord["nutrients"]["PROCNT"] as num
          ..fat = foodRecord["nutrients"]["FAT"] as num
          ..carbs = foodRecord["nutrients"]["CHOCDF"] as num
//          ..quantity = foodRecord["source"] as String
//          ..quantity = foodRecord["_links"]["next"]["href"] as String
        // TODO: noteworthy custom measurements


//          ..foodName = foodRecord["image"] as String TODO: image (override with my own in repository)
        );
      })
    );
  }

  Future<FoodRecord> nutritionalInformation(String edamamFoodId) async {
    var encoded = Uri.encodeFull("/food-database/nutrients?app_id=$appId&app_key=$appKey");
    Response response = await _dio.post(
      encoded,
      data: {
        "quantity": 1,
        "measureURI": "http://www.edamam.com/ontologies/edamam.owl#Measure_unit",
        "foodId": edamamFoodId
      }
    );

    var json = Map<String, dynamic>.from(response.data);

    num foodYield = json["yield"];
//    num calories = json["calories"]; FIXME imprecise
    num totalWeight = json["totalWeight"];

    List<String> dietLabels = json["dietLabels"];
    List<String> healthLabels = json["healthLabels"];
    List<String> cautions = json["cautions"];

    // Per 100 g
    var nutrients = json["totalNutrients"];

    print(response.statusCode);
    print(response.data);

    return FoodRecord((b) => b
      ..foodName = "from edamam" // TODO: take from previous request, keep it's id, etc (pass food record, throw if it doesn't have edamam id)
      ..grams = 100
      ..calories = nutrients["ENERC_KCAL"]["quantity"] as num
      ..protein = nutrients["PROCNT"]["quantity"] as num
      ..fat = nutrients["FAT"]["quantity"] as num
      ..carbs = nutrients["CHOCDF"]["quantity"] as num


    );
  }
}

