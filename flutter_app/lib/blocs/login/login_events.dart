/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:built_value/built_value.dart';

part 'login_events.g.dart';

abstract class LoginEvent {}

abstract class PressLoginButton with LoginEvent implements Built<PressLoginButton, PressLoginButtonBuilder> {
  String get username;
  String get password;

  factory PressLoginButton([void Function(PressLoginButtonBuilder b)]) = _$PressLoginButton;
  PressLoginButton._();
}
