import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';

part 'user_data_events.g.dart';

abstract class UserDataEvent {}

abstract class UserDataArrived with UserDataEvent implements Built<UserDataArrived, UserDataArrivedBuilder> {
  UserData get userData;

  UserDataArrived._();
  factory UserDataArrived([updates(UserDataArrivedBuilder b)]) = _$UserDataArrived;
}
