import 'package:built_collection/built_collection.dart';
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
abstract class WipeUserData with UserDataEvent implements Built<WipeUserData, WipeUserDataBuilder> {
  WipeUserData._();
  factory WipeUserData([updates(WipeUserDataBuilder b)]) = _$WipeUserData;
}
