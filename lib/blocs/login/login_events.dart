import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'login_events.g.dart';

abstract class LoginEvent {}

abstract class PressLoginButton with LoginEvent implements Built<PressLoginButton, PressLoginButtonBuilder> {
  String get username;
  String get password;

  PressLoginButton._();
  factory PressLoginButton([updates(PressLoginButtonBuilder b)]) = _$PressLoginButton;
}
