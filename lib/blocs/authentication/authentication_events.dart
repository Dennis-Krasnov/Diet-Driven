import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;

part 'authentication_events.g.dart';

abstract class AuthenticationEvent {}

/// check if the user is currently authenticated or not.
abstract class AppStarted with AuthenticationEvent implements Built<AppStarted, AppStartedBuilder> {
  AppStarted._();
  factory AppStarted([updates(AppStartedBuilder b)]) = _$AppStarted;

  @override
  String toString() => runtimeType.toString();
}

/// user has successfully logged in.
abstract class LoggedIn with AuthenticationEvent implements Built<LoggedIn, LoggedInBuilder> {
  FirebaseUser get user;

  LoggedIn._();
  factory LoggedIn([updates(LoggedInBuilder b)]) = _$LoggedIn;
}

/// user has successfully logged out.
abstract class LoggedOut with AuthenticationEvent implements Built<LoggedOut, LoggedOutBuilder> {
  LoggedOut._();
  factory LoggedOut([updates(LoggedOutBuilder b)]) = _$LoggedOut;

  @override
  String toString() => runtimeType.toString();
}
