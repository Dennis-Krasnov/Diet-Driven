import 'package:built_value/built_value.dart';

part 'login_state.g.dart';

abstract class LoginState {}

/// initial state of the LoginForm
abstract class LoginInitial with LoginState implements Built<LoginInitial, LoginInitialBuilder> {
  factory LoginInitial([void Function(LoginInitialBuilder b)]) = _$LoginInitial;
  LoginInitial._();
}

/// when we are validating credentials
abstract class LoginLoading with LoginState implements Built<LoginLoading, LoginLoadingBuilder> {
  factory LoginLoading([void Function(LoginLoadingBuilder b)]) = _$LoginLoading;
  LoginLoading._();
}

/// login attempt has failed.
abstract class LoginFailure with LoginState implements Built<LoginFailure, LoginFailureBuilder> { // TODO: rename
  String get error;

  factory LoginFailure([void Function(LoginFailureBuilder b)]) = _$LoginFailure;
  LoginFailure._();
}
