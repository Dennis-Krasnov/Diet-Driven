import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'user_data_events.g.dart';

abstract class UserDataEvent {}

/// Reactively updates current [UserData], shows application.
abstract class RemoteUserDataArrived with UserDataEvent implements Built<RemoteUserDataArrived, RemoteUserDataArrivedBuilder> {
  UserData get userData;

  RemoteUserDataArrived._();
  factory RemoteUserDataArrived([updates(RemoteUserDataArrivedBuilder b)]) = _$RemoteUserDataArrived;
}

/// Reactively shows loading screen for every authentication state change.
abstract class StartLoadingUserData with UserDataEvent implements Built<StartLoadingUserData, StartLoadingUserDataBuilder> {
  StartLoadingUserData._();
  factory StartLoadingUserData([updates(StartLoadingUserDataBuilder b)]) = _$StartLoadingUserData;

  @override String toString() => runtimeType.toString();
}

/// Shows global error page.
abstract class UserDataError with UserDataEvent implements Built<UserDataError, UserDataErrorBuilder> {
  String get error;

  UserDataError._();
  factory UserDataError([updates(UserDataErrorBuilder b)]) = _$UserDataError;
}

/// Shows unauthenticated user onboarding / sign in.
abstract class OnboardUser with UserDataEvent implements Built<OnboardUser, OnboardUserBuilder> {
  OnboardUser._();
  factory OnboardUser([updates(OnboardUserBuilder b)]) = _$OnboardUser;

  @override String toString() => runtimeType.toString();
}
