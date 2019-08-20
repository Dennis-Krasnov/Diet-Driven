/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_value/built_value.dart';

part 'authentication.g.dart';

abstract class Authentication implements Built<Authentication, AuthenticationBuilder> {
  /// User's unique identification.
  String get uid;

  /// User's first name.
  @nullable
  String get displayName;

  /// User hasn't yet created a login.
  bool get isAnonymous;

  /// User's email address.
  @nullable
  String get email;

  /// User's email is verified.
  bool get isEmailVerified;

  factory Authentication([void Function(AuthenticationBuilder) updates]) = _$Authentication;
  Authentication._();
}
