import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'user_data_state.g.dart';

abstract class UserDataState {}

abstract class UserDataUninitialized with UserDataState implements Built<UserDataUninitialized, UserDataUninitializedBuilder> {
  UserDataUninitialized._();
  factory UserDataUninitialized([updates(UserDataUninitializedBuilder b)]) = _$UserDataUninitialized;

  @override
  String toString() => runtimeType.toString();
}

// TODO: loading

abstract class UserDataLoaded with UserDataState implements Built<UserDataLoaded, UserDataLoadedBuilder> {
  UserData get userData;

  UserDataLoaded._();
  factory UserDataLoaded([updates(UserDataLoadedBuilder b)]) = _$UserDataLoaded;
}
