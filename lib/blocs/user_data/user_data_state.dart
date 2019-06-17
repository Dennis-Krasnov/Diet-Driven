import 'package:built_value/built_value.dart';
import 'package:diet_driven/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseUser;

part 'user_data_state.g.dart';

abstract class UserDataState {}

/// Loading page.
abstract class UserDataUninitialized with UserDataState implements Built<UserDataUninitialized, UserDataUninitializedBuilder> {
  factory UserDataUninitialized([void Function(UserDataUninitializedBuilder b)]) = _$UserDataUninitialized;
  UserDataUninitialized._();

  @override String toString() => runtimeType.toString();
}

/// Global error page.
abstract class UserDataFailed with UserDataState implements Built<UserDataFailed, UserDataFailedBuilder> {
  String get error;

  @nullable
  String get trace;

  factory UserDataFailed([void Function(UserDataFailedBuilder b)]) = _$UserDataFailed;
  UserDataFailed._();
}

/// Loading screen.
abstract class UserDataLoading with UserDataState implements Built<UserDataLoading, UserDataLoadingBuilder> {
  factory UserDataLoading([void Function(UserDataLoadingBuilder b)]) = _$UserDataLoading;
  UserDataLoading._();

  @override String toString() => runtimeType.toString();
}

/// Unauthenticated user onboarding / sign in.
abstract class UserDataUnauthenticated with UserDataState implements Built<UserDataUnauthenticated, UserDataUnauthenticatedBuilder> {
  // TODO: create separate onboarding bloc

  factory UserDataUnauthenticated([void Function(UserDataUnauthenticatedBuilder b)]) = _$UserDataUnauthenticated;
  UserDataUnauthenticated._();

  @override String toString() => runtimeType.toString();
}

/// Application; stores current [FirebaseUser], [UserDocument], and [Settings].
abstract class UserDataLoaded with UserDataState implements Built<UserDataLoaded, UserDataLoadedBuilder> {
  FirebaseUser get authentication;

  UserDocument get userDocument;

  Settings get settings;

////  TODO: accepted terms (defaults to false), subscribedToEmails, etc!

  factory UserDataLoaded([void Function(UserDataLoadedBuilder b)]) = _$UserDataLoaded;
  UserDataLoaded._();
}
