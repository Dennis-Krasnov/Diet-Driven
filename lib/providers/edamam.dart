import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';

import 'package:diet_driven/models/models.dart';

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

  final Dio _dio = Dio(options);

  Future<BuiltList<String>> foodSuggestions(String search) async {
    int limit = 10;
    var encoded = Uri.encodeFull("/auto-complete?q=$search&limit=$limit&app_id=$appId&app_key=$appKey");
//    Response response = await _dio.get(encoded);
    Response response = await _dio.get("https://api.edamam.com/auto-complete?q=$search&limit=10&app_id=1c25cea1&app_key=88fbceb07e4fa287b47fefa3db2004f3");

    var list = BuiltList<String>.from(response.data);

    print("LIST: $list");
    return list; // FIXME
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
//          ..foodName = foodRecord["foodId"] as String TODO: id
          ..foodName = foodRecord["label"] as String
          ..quantity = foodRecord["nutrients"]["ENERC_KCAL"] as num
          ..quantity = foodRecord["nutrients"]["PROCNT"] as num
          ..quantity = foodRecord["nutrients"]["FAT"] as num
          ..quantity = foodRecord["nutrients"]["CHOCDF"] as num
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
        "foodId": "food_bwemjc2ad6k4bhbumwlx5aanbanp"
      }
    );

    print(response.statusCode);
    print(response.data);

    return FoodRecord((b) => b
      ..foodName = "from edamam"
      ..quantity = 23
    );
  }
}

