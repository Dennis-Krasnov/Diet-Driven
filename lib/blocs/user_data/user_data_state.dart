import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';

part 'user_data_state.g.dart';

abstract class UserDataState {}

/// Loading page.
abstract class UserDataUninitialized with UserDataState implements Built<UserDataUninitialized, UserDataUninitializedBuilder> {
  UserDataUninitialized._();
  factory UserDataUninitialized([updates(UserDataUninitializedBuilder b)]) = _$UserDataUninitialized;

  @override String toString() => runtimeType.toString();
}

/// Global error page.
abstract class UserDataFailed with UserDataState implements Built<UserDataFailed, UserDataFailedBuilder> {
  String get error;

  UserDataFailed._();
  factory UserDataFailed([updates(UserDataFailedBuilder b)]) = _$UserDataFailed;
}

/// Loading screen.
abstract class UserDataLoading with UserDataState implements Built<UserDataLoading, UserDataLoadingBuilder> {
  UserDataLoading._();
  factory UserDataLoading([updates(UserDataLoadingBuilder b)]) = _$UserDataLoading;

  @override String toString() => runtimeType.toString();
}

/// Unauthenticated user onboarding / sign in.
abstract class UserDataUnauthenticated with UserDataState implements Built<UserDataUnauthenticated, UserDataUnauthenticatedBuilder> {
  // TODO: create seperate onboarding bloc

  UserDataUnauthenticated._();
  factory UserDataUnauthenticated([updates(UserDataUnauthenticatedBuilder b)]) = _$UserDataUnauthenticated;

  @override String toString() => runtimeType.toString();
}

/// Stores current [UserData].
abstract class UserDataLoaded with UserDataState implements Built<UserDataLoaded, UserDataLoadedBuilder> {
  UserData get userData;

  UserDataLoaded._();
  factory UserDataLoaded([updates(UserDataLoadedBuilder b)]) = _$UserDataLoaded;
}
