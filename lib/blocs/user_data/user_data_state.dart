import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;

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

  @nullable
  String get trace;

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
  // TODO: create separate onboarding bloc

  UserDataUnauthenticated._();
  factory UserDataUnauthenticated([updates(UserDataUnauthenticatedBuilder b)]) = _$UserDataUnauthenticated;

  @override String toString() => runtimeType.toString();
}

/// Application; stores current [FirebaseUser], [UserDocument], and [Settings].
abstract class UserDataLoaded with UserDataState implements Built<UserDataLoaded, UserDataLoadedBuilder> {
  FirebaseUser get authentication;

  UserDocument get userDocument;

  Settings get settings;

////  TODO: accepted terms (defaults to false), subscribedToEmails, etc!

  UserDataLoaded._();
  factory UserDataLoaded([updates(UserDataLoadedBuilder b)]) = _$UserDataLoaded;
}
