import 'package:deep_link_navigation/deep_link_navigation.dart';
import 'package:flutter/material.dart';

/// ...
mixin FullScreen on DeepLink {}

/// ...
//mixin Authenticated on DeepLink { // ALREADY HANDLED
//@override
//bool get allowAnonymous => true;


//  bool get allowAnonymous; // TODO: custom error and deep link
//
//  @override
//  void onDispatch(BuildContext context) {
////    // Get state from context or global/static variable
////    final isAuthenticated = Provider.of<AuthenticationService>(context, listen: false).authenticated;
////
////    // Throw custom exception
////    if (!isAuthenticated) {
////      throw Unauthenticated();
////    }
//  }
//}

// TODO: subscribed


// TODO: authorized