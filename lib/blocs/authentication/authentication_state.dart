import 'package:built_value/built_value.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authentication_state.g.dart';

abstract class AuthenticationState {}

abstract class AuthUninitialized with AuthenticationState implements Built<AuthUninitialized, AuthUninitializedBuilder> {
  AuthUninitialized._();
  factory AuthUninitialized([updates(AuthUninitializedBuilder b)]) = _$AuthUninitialized;

  @override
  String toString() => runtimeType.toString();
}

abstract class AuthAuthenticated with AuthenticationState implements Built<AuthAuthenticated, AuthAuthenticatedBuilder> {
  FirebaseUser get user;

  AuthAuthenticated._();
  factory AuthAuthenticated([updates(AuthAuthenticatedBuilder b)]) = _$AuthAuthenticated;
}

abstract class AuthUnauthenticated with AuthenticationState implements Built<AuthUnauthenticated, AuthUnauthenticatedBuilder> {
  AuthUnauthenticated._();
  factory AuthUnauthenticated([updates(AuthUnauthenticatedBuilder b)]) = _$AuthUnauthenticated;

  @override
  String toString() => runtimeType.toString();
}
