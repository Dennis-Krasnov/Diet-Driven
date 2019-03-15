import 'package:built_value/built_value.dart';

part 'login_state.g.dart';

abstract class LoginState {}

/// initial state of the LoginForm
abstract class LoginInitial with LoginState implements Built<LoginInitial, LoginInitialBuilder> {
  LoginInitial._();
  factory LoginInitial([updates(LoginInitialBuilder b)]) = _$LoginInitial;
}

/// when we are validating credentials
abstract class LoginLoading with LoginState implements Built<LoginLoading, LoginLoadingBuilder> {
  LoginLoading._();
  factory LoginLoading([updates(LoginLoadingBuilder b)]) = _$LoginLoading;
}

/// login attempt has failed.
abstract class LoginFailure with LoginState implements Built<LoginFailure, LoginFailureBuilder> {
  String get error;

  LoginFailure._();
  factory LoginFailure([updates(LoginFailureBuilder b)]) = _$LoginFailure;
}