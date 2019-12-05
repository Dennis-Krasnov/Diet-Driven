/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
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

/// Reactively updates current [authentication], [userDocument], [settings], [userSettings], [subscription].
abstract class IngressUserDataArrived implements UserDataEvent, Built<IngressUserDataArrived, IngressUserDataArrivedBuilder> {
  Authentication get authentication;

  UserDocument get userDocument;

  Settings get settings;

  Settings get userSettings;

  SubscriptionType get subscription;

  factory IngressUserDataArrived([void Function(IngressUserDataArrivedBuilder b)]) = _$IngressUserDataArrived;
  IngressUserDataArrived._();
}

/// Throws unrecoverable exception.
abstract class UserDataError implements BuiltError, UserDataEvent, Built<UserDataError, UserDataErrorBuilder> {
  factory UserDataError([void Function(UserDataErrorBuilder b)]) = _$UserDataError;
  UserDataError._();
}

/// Redirects unauthenticated users to onboarding / sign in.
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
abstract class UpdateDarkMode implements Completable, UserDataEvent, Built<UpdateDarkMode, UpdateDarkModeBuilder> {
  bool get darkMode;

  factory UpdateDarkMode([void Function(UpdateDarkModeBuilder) updates]) = _$UpdateDarkMode;
  UpdateDarkMode._();
}

/// Updates primary colour setting.
abstract class UpdatePrimaryColour implements Completable, UserDataEvent, Built<UpdatePrimaryColour, UpdatePrimaryColourBuilder> {
  int get colourValue;

  factory UpdatePrimaryColour([void Function(UpdatePrimaryColourBuilder) updates]) = _$UpdatePrimaryColour;
  UpdatePrimaryColour._();
}
