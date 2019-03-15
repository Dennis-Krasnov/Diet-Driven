import 'package:built_value/built_value.dart';

part 'authentication_state.g.dart';

abstract class AuthenticationState {}

abstract class AuthUninitialized with AuthenticationState implements Built<AuthUninitialized, AuthUninitializedBuilder> {
  AuthUninitialized._();
  factory AuthUninitialized([updates(AuthUninitializedBuilder b)]) = _$AuthUninitialized;
}

abstract class AuthAuthenticated with AuthenticationState implements Built<AuthAuthenticated, AuthAuthenticatedBuilder> {
  AuthAuthenticated._();
  factory AuthAuthenticated([updates(AuthAuthenticatedBuilder b)]) = _$AuthAuthenticated;
}

abstract class AuthUnauthenticated with AuthenticationState implements Built<AuthUnauthenticated, AuthUnauthenticatedBuilder> {
  AuthUnauthenticated._();
  factory AuthUnauthenticated([updates(AuthUnauthenticatedBuilder b)]) = _$AuthUnauthenticated;
}

abstract class AuthLoading with AuthenticationState implements Built<AuthLoading, AuthLoadingBuilder> {
  AuthLoading._();
  factory AuthLoading([updates(AuthLoadingBuilder b)]) = _$AuthLoading;
}