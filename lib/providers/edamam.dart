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

  // FIXME: move error catching to bloc!
  Future<BuiltList<FoodRecord>> searchForFood(String search) async {
    try {
      var encoded = Uri.encodeFull(search);
      Response response = await _dio.get("/food-database/parser?ingr=$encoded&app_id=$appId&app_key=$appKey");
      print(response);
      print(response.data["hints"].length);
      return null;
//      return jsonSerializers.deserialize(response.data);
    } catch (error, stacktrace) {
      print("Couldn't retrieve food record: $error stackTrace: $stacktrace");
      print(_handleError(error));
      return null;
    }
  }

}

// TODO: move this handling to repository
String _handleError(Error error) {
  String errorDescription = "";
  if (error is DioError) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.DEFAULT:
        errorDescription =
        "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.SEND_TIMEOUT:
        errorDescription = "??????";
        break;
      case DioErrorType.RESPONSE:
        errorDescription =
        "Received invalid status code: ${error.response.statusCode}";
        break;
    }
  } else {
    errorDescription = "Unexpected error occured";
  }
  return errorDescription;
}
