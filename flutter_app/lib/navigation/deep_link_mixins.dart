/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:bloc_logging/bloc_logger.dart';
import 'package:deep_link_navigation/deep_link_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/navigation/navigation.dart';


/// ...
mixin FullScreen on DeepLink {}

/// ...
mixin SubscriberOnly on DeepLink {
  @override
  void onDispatch(BuildContext context) {
    try {
      // Attempt to verify subscription status
      final subscription = BlocProvider.of<UserDataBloc>(context).loadedState.subscription;
      // TODO: normal enums (test serialization) with extension methods
      if (!SubscriptionType.hasDietDrivenAccess(subscription)) {
        throw SubscriptionRequired();
      }
    } on SubscriptionRequired catch(_) {
      // Throw SubscriptionRequired exception
      rethrow;
    } catch (error, stacktrace) {
      BlocLogger().unexpectedError("Subscription only deep link validation failed", error, stacktrace);
      throw SubscriptionRequired();
    }
  }
}

/// ...
//mixin AdminOnly on DeepLink {
//  @override
//  void onDispatch(BuildContext context) {
//
//  }
//}
//class AdminRequired implements Exception {}