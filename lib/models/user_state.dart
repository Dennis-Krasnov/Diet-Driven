library user_state;

import 'package:built_value/built_value.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_state.g.dart';

abstract class UserState implements Built<UserState, UserStateBuilder> {
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

///
//abstract class UserState implements Built<UserState, UserStateBuilder> {
//  //
//  @nullable
//  FirebaseUser get authUser;
//
//  //
//  bool get isAdmin;
//
//  UserState._();
////  factory UserState([updates(UserStateBuilder b)]) = _$UserState;
//  factory UserState([updates(UserStateBuilder b)]) => _$UserState((b) => b
//    ..isAdmin = false
//    ..update(updates)
//  );
//}

/// If you won't usually use the generated builder -- for example, for a
/// class with one field -- you can write a simpler factory.
//factory VerySimpleValue(int value) => new _$VerySimpleValue._(value: value);

/// Additional custom validation goes in the constructor.
//ValidatedValue._() {
//if (anInt == 7) throw new StateError('anInt may not be 7');
//}

// CUSTOM BUILDER IS HOW TO DO DEFAULT VALUES!!!!
// better for deserialization

/// Builder fields must be marked "@virtual". This is a language feature that
/// allows them to be overriden.