/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'dart:async';

import 'package:built_value/built_value.dart';

import 'package:diet_driven/blocs/bloc_utils.dart';
import 'package:diet_driven/models/models.dart';

part 'user_data_events.g.dart';

abstract class UserDataEvent {}

/// Subscribes to data streams.
abstract class InitUserData implements UserDataEvent, Built<InitUserData, InitUserDataBuilder> {
  factory InitUserData([void Function(InitUserDataBuilder) updates]) = _$InitUserData;
  InitUserData._();
}

/// Reactively updates current [authentication], [userDocument], [settings], [subscription].
abstract class RemoteUserDataArrived implements UserDataEvent, Built<RemoteUserDataArrived, RemoteUserDataArrivedBuilder> {
  Authentication get authentication;

  UserDocument get userDocument;

  Settings get settings;

  Settings get userSettings;

  SubscriptionType get subscription;

  factory RemoteUserDataArrived([void Function(RemoteUserDataArrivedBuilder b)]) = _$RemoteUserDataArrived;
  RemoteUserDataArrived._();
}

/// Throws unrecoverable exception.
abstract class UserDataError implements BuiltError, UserDataEvent, Built<UserDataError, UserDataErrorBuilder> {
  factory UserDataError([void Function(UserDataErrorBuilder b)]) = _$UserDataError;
  UserDataError._();
}

/// Onboards unauthenticated users.
abstract class OnboardUser implements UserDataEvent, Built<OnboardUser, OnboardUserBuilder> {
  factory OnboardUser([void Function(OnboardUserBuilder b)]) = _$OnboardUser;
  OnboardUser._();
}

///    ######  ######## ######## ######## #### ##    ##  ######    ######
///   ##    ## ##          ##       ##     ##  ###   ## ##    ##  ##    ##
///   ##       ##          ##       ##     ##  ####  ## ##        ##
///    ######  ######      ##       ##     ##  ## ## ## ##   ####  ######
///         ## ##          ##       ##     ##  ##  #### ##    ##        ##
///   ##    ## ##          ##       ##     ##  ##   ### ##    ##  ##    ##
///    ######  ########    ##       ##    #### ##    ##  ######    ######

/// Updates dark mode setting.
abstract class UpdateDarkMode with Completable implements UserDataEvent, Built<UpdateDarkMode, UpdateDarkModeBuilder> {
  bool get darkMode;

  factory UpdateDarkMode([void Function(UpdateDarkModeBuilder) updates]) = _$UpdateDarkMode;
  UpdateDarkMode._();
}

/// Updates primary colour setting.
abstract class UpdatePrimaryColour with Completable implements UserDataEvent, Built<UpdatePrimaryColour, UpdatePrimaryColourBuilder> {
  int get colourValue;

  factory UpdatePrimaryColour([void Function(UpdatePrimaryColourBuilder) updates]) = _$UpdatePrimaryColour;
  UpdatePrimaryColour._();
}
