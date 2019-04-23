import 'package:built_value/built_value.dart';

part 'login_events.g.dart';

abstract class LoginEvent {}

abstract class PressLoginButton with LoginEvent implements Built<PressLoginButton, PressLoginButtonBuilder> {
  String get username;
  String get password;

  PressLoginButton._();
  factory PressLoginButton([updates(PressLoginButtonBuilder b)]) = _$PressLoginButton;
}
