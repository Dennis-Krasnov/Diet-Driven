/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';

/// ...
class AuthenticationChangeNotifier extends StatefulWidget {
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// ...
  final ConfigurationBloc configurationBloc;

  /// ...
  final UserDataBloc userDataBloc;

  /// ...
  final Function(UserDataLoaded) onAuthenticated;

  /// ...
  final VoidCallback onUnauthenticated;

  /// ...
  final Function(Error) onException;

  const AuthenticationChangeNotifier({
    Key key,
    @required this.child,
    @required this.configurationBloc,
    @required this.userDataBloc,
    @required this.onAuthenticated,
    @required this.onUnauthenticated,
    @required this.onException,
  }) : super(key: key);

  @override
  _AuthenticationChangeNotifierState createState() => _AuthenticationChangeNotifierState();
}

class _AuthenticationChangeNotifierState extends State<AuthenticationChangeNotifier> {
  StreamSubscription<UserDataState> _authenticationStatusSubscription;

  @override
  void initState() {
    super.initState();
    _authenticationStatusSubscription ??= Observable<UserDataState>(CombineLatestStream.combine2(
      // Only take loaded configurations
      widget.configurationBloc.where((configurationState) => configurationState is ConfigurationLoaded),
      // Initially starts with null authentication status
      widget.userDataBloc.skip(1),
        (ConfigurationState configurationState, UserDataState userDataState) => userDataState,
    ))
    // ...
      .doOnError(widget.onException) // TODO: gracefully handle this!
      .listen((userDataState) {
      if (userDataState is UserDataUnauthenticated) {
        return widget.onUnauthenticated();
      }
      if (userDataState is UserDataLoaded) {
        return widget.onAuthenticated(userDataState);
      }
      if (userDataState is UserDataFailed) {
        return widget.onException(userDataState.error);
      }
      return widget.onException(UnimplementedError());
    });
  }

  @override
  void dispose() {
    _authenticationStatusSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}