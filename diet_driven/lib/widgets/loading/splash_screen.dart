/*
 * Copyright (c) 2019. Dennis Krasnov. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found
 * in the LICENSE file.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/widgets/loading/loading.dart';

// TODO: separate into multiple widgets (one for each field of scaffold)
class SplashPage extends StatelessWidget {
  final bool pulsating;
  final int bottomNavPages;

  const SplashPage({Key key, this.pulsating = false, this.bottomNavPages = 4}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);
    final ConfigurationBloc _configurationBloc = BlocProvider.of<ConfigurationBloc>(context);

    return StreamBuilder<int>(
      stream: Observable<int>.periodic(Duration(milliseconds: 500), (i) => i),
        builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const ShimmerRectangle(width: 160, height: 22),
            actions: const <Widget>[
              IconButton(icon: ShimmerCircle(radius: 28), onPressed: null),
              IconButton(icon: ShimmerCircle(radius: 28), onPressed: null),
            ],
          ),
          body: snapshot.hasData ? SafeArea( // TODO: in other scaffolds as well
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (snapshot.data > 5 * 2)
                    const Text('This is taking longer than usual...'),
                  if (snapshot.data > 10 * 2)
                    const Text('check your internet connection...'),
                  Text('User data ${_userDataBloc.currentState?.runtimeType ?? "is loading"}'),
                  Text('Configuration: ${_configurationBloc.currentState?.runtimeType ?? "is loading"}'),
                ],
              )
            ),
          ) : null,
          floatingActionButton: const ShimmerCircle(radius: 56),
          // Disable BottomNavigationBarItem's ink wells
          bottomNavigationBar: IgnorePointer(
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                for (var _ in List.generate(bottomNavPages, (_) => null))
                  const BottomNavigationBarItem(
                    title: ShimmerRectangle(width: 48, height: 12),
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: ShimmerRectangle(width: 24, height: 24),
                    ),
                  )
              ],
              // currentIndex makes respective title slightly bigger for shifting animation
              currentIndex: pulsating && snapshot.hasData ? snapshot.data % bottomNavPages : 0,
              elevation: 4,
            ),
          ),
        );
      }
    );
  }
}


