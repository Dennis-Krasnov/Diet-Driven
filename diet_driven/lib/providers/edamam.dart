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

  static BaseOptions options = BaseOptions(
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

    final HttpsCallable foodSuggestionsFunction = CloudFunctions.instance.getHttpsCallable(
      functionName: 'foodSuggestions'
    )..timeout = Duration(seconds: 10);

//   Cloud function parameters CANNOT be defined as <String, dynamic>{}
    final HttpsCallableResult result = await foodSuggestionsFunction({"query": search});

    return BuiltList<String>.from(result.data);
  }

  // FIXME: move error catching to bloc!
//  TODO: use callable cloud function, use built value's json serializers for deserializion!
  Future<BuiltList<FoodRecord>> searchForFood(String search) async {
    final String encoded = Uri.encodeFull("/food-database/parser?ingr=$search&app_id=$appId&app_key=$appKey");
//    Response response = await _dio.get(encoded);
    final Response<Map<String, dynamic>> response = await _dio.get<Map<String, dynamic>>(encoded);

//    var json = Map<String, dynamic>.from(response.data);

    final Map<String, dynamic> parsed = response.data["parsed"];
    final List<dynamic> hints = response.data["hints"];

    return BuiltList<FoodRecord>(
      hints.map<FoodRecord>((dynamic hint) {
        final Map<String, dynamic> foodRecord = hint["food"];
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
    final encoded = Uri.encodeFull("/food-database/nutrients?app_id=$appId&app_key=$appKey");
    final Response<Map<String, dynamic>> response = await _dio.post<Map<String, dynamic>>(
      encoded,
      data: {
        "quantity": 1,
        "measureURI": "http://www.edamam.com/ontologies/edamam.owl#Measure_unit",
        "foodId": edamamFoodId
      }
    );

//    final json = Map<String, dynamic>.from(response.data);
//    final json = response.data;

    num foodYield = response.data["yield"];
//    num calories = json["calories"]; FIXME imprecise
    num totalWeight = response.data["totalWeight"];

    List<String> dietLabels = response.data["dietLabels"];
    List<String> healthLabels = response.data["healthLabels"];
    List<String> cautions = response.data["cautions"];

    // Per 100 g
    final Map<String, dynamic> nutrients = response.data["totalNutrients"];

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

