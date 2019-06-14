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

  factory RemoteUserDataArrived([void Function(RemoteUserDataArrivedBuilder b)]) = _$RemoteUserDataArrived;
  RemoteUserDataArrived._();
}

/// Reactively shows loading screen for every authentication state change.
abstract class StartLoadingUserData with UserDataEvent implements Built<StartLoadingUserData, StartLoadingUserDataBuilder> {
  factory StartLoadingUserData([void Function(StartLoadingUserDataBuilder b)]) = _$StartLoadingUserData;
  StartLoadingUserData._();

  @override String toString() => runtimeType.toString();
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

/// Updates user's settings
abstract class UpdateSettings with UserDataEvent implements Built<UpdateSettings, UpdateSettingsBuilder> {
  bool get darkMode;

  factory UpdateSettings([void Function(UpdateSettingsBuilder b)]) = _$UpdateSettings;
  UpdateSettings._();
}