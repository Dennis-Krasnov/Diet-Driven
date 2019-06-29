import 'package:built_value/built_value.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;

import 'package:diet_driven/models/models.dart';

part 'user_data_events.g.dart';

abstract class UserDataEvent {}

/// Reactively updates current [FirebaseUser], [UserDocument], [Settings]; shows application.
abstract class RemoteUserDataArrived with UserDataEvent implements Built<RemoteUserDataArrived, RemoteUserDataArrivedBuilder> {
  FirebaseUser get authentication;

  UserDocument get userDocument;

  Settings get settings;

  SubscriptionType get subscription;

  factory RemoteUserDataArrived([void Function(RemoteUserDataArrivedBuilder b)]) = _$RemoteUserDataArrived;
  RemoteUserDataArrived._();
}

/// Shows global error page.
abstract class UserDataError with UserDataEvent implements Built<UserDataError, UserDataErrorBuilder> {
  String get error;

  @nullable
  String get trace;

  factory UserDataError([void Function(UserDataErrorBuilder b)]) = _$UserDataError;
  UserDataError._();
}

/// Shows unauthenticated user onboarding / sign in.
abstract class OnboardUser with UserDataEvent implements Built<OnboardUser, OnboardUserBuilder> {
  factory OnboardUser([void Function(OnboardUserBuilder b)]) = _$OnboardUser;
  OnboardUser._();

  @override String toString() => runtimeType.toString();
}
