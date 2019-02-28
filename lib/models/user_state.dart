library user_state;

import 'package:built_value/built_value.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_state.g.dart';

abstract class UserState implements Built<UserState, UserStateBuilder> {
  @BuiltValueField(serialize: false)
  @nullable
  FirebaseUser get authUser;

  bool get isAdmin;

  UserState._();
  factory UserState([updates(UserStateBuilder b)]) = _$UserState;
}

abstract class UserStateBuilder implements Builder<UserState, UserStateBuilder> {
  @nullable
  FirebaseUser authUser;

  bool isAdmin = false;

  factory UserStateBuilder() = _$UserStateBuilder;
  UserStateBuilder._();
}
