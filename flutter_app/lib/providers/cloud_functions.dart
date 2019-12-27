/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:cloud_functions/cloud_functions.dart';

import 'package:diet_driven/models/serializers.dart';

/// Firebase Cloud Functions provider using `cloud_functions` library.
///
/// Auth ID token is automatically included for authenticated users.
/// Callable functions use interface https://firebase.google.com/docs/functions/callable-reference

extension CloudFunctionsExtensions on CloudFunctions {
  /// Function curry for easy use of cloud functions.
  /// eg. final result = await _cloudFunction.name("functionName")({"arg": value});
  HttpsCallable name(String functionName, [int timeoutSeconds = 10]) => getHttpsCallable(functionName: functionName)
    ..timeout = Duration(seconds: timeoutSeconds);
}

extension CloudFunctionsResultExtensions on HttpsCallableResult {
  /// ...
  Object deserialize() => jsonSerializers.deserialize(data);
}