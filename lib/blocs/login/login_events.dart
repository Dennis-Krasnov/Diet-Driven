import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'login_events.g.dart';

abstract class LoginEvent {}

abstract class LoginButtonPressed with LoginEvent implements Built<LoginButtonPressed, LoginButtonPressedBuilder> {
  String get username;
  String get password;

  LoginButtonPressed._();
  factory LoginButtonPressed([updates(LoginButtonPressedBuilder b)]) = _$LoginButtonPressed;
}