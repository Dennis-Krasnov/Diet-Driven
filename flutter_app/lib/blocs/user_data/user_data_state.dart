/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:built_value/built_value.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/utils/utils.dart';

part 'user_data_state.g.dart';

abstract class UserDataState {}

/// Global splash page.
abstract class UserDataUninitialized implements UserDataState, Built<UserDataUninitialized, UserDataUninitializedBuilder> {
  factory UserDataUninitialized([void Function(UserDataUninitializedBuilder b)]) = _$UserDataUninitialized;
  UserDataUninitialized._();
}

/// Global error page.
abstract class UserDataFailed implements BuiltError, UserDataState, Built<UserDataFailed, UserDataFailedBuilder> {
  factory UserDataFailed([void Function(UserDataFailedBuilder b)]) = _$UserDataFailed;
  UserDataFailed._();
}

/// Redirection to onboarding / sign in.
abstract class UserDataUnauthenticated implements UserDataState, Built<UserDataUnauthenticated, UserDataUnauthenticatedBuilder> {
  factory UserDataUnauthenticated([void Function(UserDataUnauthenticatedBuilder b)]) = _$UserDataUnauthenticated;
  UserDataUnauthenticated._();
}

/// Application.
abstract class UserDataLoaded implements UserDataState, Built<UserDataLoaded, UserDataLoadedBuilder> {
  /// Firebase authentication user.
  Authentication get authentication;

  /// Read-only user metadata.
  UserDocument get userDocument;

  /// Synchronized application settings.
  Settings get settings;

  /// Unmerged user setting overrides.
  Settings get userSettings;

  /// Paid subscription status.
  SubscriptionType get subscription;

  factory UserDataLoaded([void Function(UserDataLoadedBuilder b)]) = _$UserDataLoaded;
  UserDataLoaded._();
}
