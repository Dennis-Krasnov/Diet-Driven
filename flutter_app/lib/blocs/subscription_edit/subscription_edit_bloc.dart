/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

//import 'dart:async';
//
//import 'package:bloc/bloc.dart';
//import 'package:diet_driven/blocs/subscription_edit/subscription_edit.dart';
//
//import 'package:diet_driven/repositories/repositories.dart';
//import 'package:logger/logger.dart';
//import 'package:meta/meta.dart';
//
//class SubscriptionEditBloc extends Bloc<SubscriptionEditEvent, SubscriptionEditState> {
//  final logger = getLogger();
//  final UserRepository userRepository;
//
//  SubscriptionEditBloc({this.userRepository});
//
//  @override
//  SubscriptionEditState get initialState => SubscriptionLoaded();
//
//  @override
//  Stream<SubscriptionEditState> mapEventToState(SubscriptionEditEvent event) async* {
//    if (event is Subscribe) {
//      // TODO:
//      // subscription page bloc validates using subscription api, whether already has subscription, etc
//      // event to fetch official and up to date subscription (which updates global state) - when needed
//
//      try {
////        userRepository.updateDarkMode(userId, event.darkMode);
//        yield SubscriptionLoading();
//
//        await userRepository.subscribe(event.subscriptionType);
//        event.completer?.complete();
//        logger.i("subscribed to ${event.subscriptionType}");
//      } on Exception catch(e) {
//        event.completer?.completeError(e);
////        yield SubscriptionFailed();
//      } finally {
//        // FIXME: create error state instead
//        yield SubscriptionLoaded();
//      }
//    }
//    // TODO: switch subscriptions!
//    if (event is Unsubscribe) {
//      logger.i("unsubscribed");
//    }
//  }
//}
