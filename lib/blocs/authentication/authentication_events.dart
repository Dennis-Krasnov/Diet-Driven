import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;

part 'authentication_events.g.dart';

abstract class AuthenticationEvent {}

abstract class SignIn with AuthenticationEvent implements Built<SignIn, SignInBuilder> {
  FirebaseUser get user;

  SignIn._();
  factory SignIn([updates(SignInBuilder b)]) = _$SignIn;
}

abstract class SignOut with AuthenticationEvent implements Built<SignOut, SignOutBuilder> {
  SignOut._();
  factory SignOut([updates(SignOutBuilder b)]) = _$SignOut;

  @override
  String toString() => runtimeType.toString();
}

abstract class WipeAuthentication with AuthenticationEvent implements Built<WipeAuthentication, WipeAuthenticationBuilder> {
  WipeAuthentication._();
  factory WipeAuthentication([updates(WipeAuthenticationBuilder b)]) = _$WipeAuthentication;
}
