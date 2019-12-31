/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';

/// ...
class AuthenticationChangeNotifier extends StatefulWidget {
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// ...
  final Function(UserDataLoaded) onAuthenticated;

  /// ...
  final VoidCallback onUnauthenticated;

  /// ...
  final Function(Error) onException;

  const AuthenticationChangeNotifier({
    Key key,
    @required this.child,
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

    final configurationBloc = BlocProvider.of<ConfigurationBloc>(context);
    final userDataBloc = BlocProvider.of<UserDataBloc>(context);

    // Wait until configuration bloc emits a loaded state
    final configurationLoaded$ = configurationBloc
      .whereType<ConfigurationLoaded>()
      .take(1);

    // Then switch over to overlapping pairs of user data states
    // eg. [a, b], [b, c], [c, d], etc.
    final userDataStateChange$ = configurationLoaded$
      .switchMap((_) => userDataBloc)
      // Start with uninitialized state to immediately make a pair and dispatch an event
      .startWith(UserDataUninitialized())
      .bufferCount(2, 1)
      // Keep only significant changes
      .where((userDataStatePair) =>
        userDataStatePair[0] is UserDataUninitialized
        || _userUid(userDataStatePair[0]) != _userUid(userDataStatePair[1])
      )
      // Then return new user data state
      .map((userDataStatePair) => userDataStatePair[1]);

    _authenticationStatusSubscription ??= userDataStateChange$.listen((userDataState) {
      if (userDataState is UserDataUninitialized) {
        return;
      }
      if (userDataState is UserDataUnauthenticated) {
        return widget.onUnauthenticated();
      }
      if (userDataState is UserDataLoaded) {
        return widget.onAuthenticated(userDataState);
      }
      if (userDataState is UserDataFailed) {
        return widget.onException(userDataState.error);
      }
      widget.onException(UnimplementedError());
    });
  }

  /// ...
  /// Nullable.
  String _userUid(UserDataState userDataState) {
    if (userDataState is! UserDataLoaded) {
      return null;
    }
    return (userDataState as UserDataLoaded).authentication.uid;
  }

  @override
  void dispose() {
    _authenticationStatusSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}