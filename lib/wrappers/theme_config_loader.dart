library theme_config_loader;

import 'package:built_value/built_value.dart';
import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_built_redux/flutter_built_redux.dart';

part 'theme_config_loader.g.dart';

/// Higher order component ...
/*

 */
class ThemeConfigLoader extends StoreConnector<AppState, Actions, ThemeConfigLoaderVM> {
  final Widget Function(BuildContext context, String theme) builder;

  ThemeConfigLoader({Key key, @required this.builder}) : super(key: key);

  @override
  ThemeConfigLoaderVM connect(AppState state) => new ThemeConfigLoaderVM((b) => b
    ..settingsLoaded = state.settingsLoaded
    ..remoteConfigLoaded = state.remoteConfigLoaded
    ..authUser = state.user.authUser
    ..theme = "FiraSans"
  );

  @override
  Widget build(BuildContext context, ThemeConfigLoaderVM vm, Actions actions) {

    // Settings or remote config is still loading
    if (!vm.settingsLoaded || !vm.remoteConfigLoaded) {
      // TODO: Flare animation
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Text("Auth user: ${vm.authUser}"),
                Text("Settings loaded: ${vm.settingsLoaded}"),
                Text("Remote config: ${vm.remoteConfigLoaded}"),
                Text("Theme: ${vm.theme}"),
              ],
            )
          ),
        )
      );
    }

    // ...
    return builder(context, vm.theme);
  }
}

abstract class ThemeConfigLoaderVM implements Built<ThemeConfigLoaderVM, ThemeConfigLoaderVMBuilder> {
  //
  @nullable
  FirebaseUser get authUser;

  //
  bool get settingsLoaded;

  //
  bool get remoteConfigLoaded;

  // TODO: define entire ThemeData
  String get theme;

  ThemeConfigLoaderVM._();
  factory ThemeConfigLoaderVM([updates(ThemeConfigLoaderVMBuilder b)]) = _$ThemeConfigLoaderVM;
}