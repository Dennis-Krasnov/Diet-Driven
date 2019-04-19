import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'user_data_events.g.dart';

abstract class UserDataEvent {}

///
abstract class RemoteUserDataArrived with UserDataEvent implements Built<RemoteUserDataArrived, RemoteUserDataArrivedBuilder> {
  UserData get userData;

  RemoteUserDataArrived._();
  factory RemoteUserDataArrived([updates(RemoteUserDataArrivedBuilder b)]) = _$RemoteUserDataArrived;
}

///
abstract class UserDataError with UserDataEvent implements Built<UserDataError, UserDataErrorBuilder> {
  String get error;

  UserDataError._();
  factory UserDataError([updates(UserDataErrorBuilder b)]) = _$UserDataError;
}

///
abstract class OnboardUser with UserDataEvent implements Built<OnboardUser, OnboardUserBuilder> {
  OnboardUser._();
  factory OnboardUser([updates(OnboardUserBuilder b)]) = _$OnboardUser;

  @override
  String toString() => runtimeType.toString();
}

///
abstract class LoadUserData with UserDataEvent implements Built<LoadUserData, LoadUserDataBuilder> {
  LoadUserData._();
  factory LoadUserData([updates(LoadUserDataBuilder b)]) = _$LoadUserData;

  @override
  String toString() => runtimeType.toString();
}
