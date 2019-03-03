import 'dart:async';

import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';


/// Higher order component ...
/*

 */
class RemoteConfigLoader extends StoreConnector<AppState, Actions, bool> {
  final Widget Function(BuildContext context) builder;

  RemoteConfigLoader({Key key, @required this.builder}) : super(key: key);

  @override
  bool connect(AppState state) => state.settingsLoaded;

  @override
  Widget build(BuildContext context, bool settingsLoaded, Actions actions) { // configure remoteConfig's listener actions higher up
    return FutureBuilder(
      // https://medium.com/saugo360/flutter-my-futurebuilder-keeps-firing-6e774830bc2
      future: Future.delayed(Duration(seconds: 3)),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        print("SNAPSHOT ${snapshot.connectionState}");
        print("SETTINGS LOADED $settingsLoaded");

        // Settings or remote config is loading
        if (!settingsLoaded || snapshot.connectionState == ConnectionState.none || snapshot.connectionState == ConnectionState.waiting) {
          // TODO: Flare animation
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Remote config: ${snapshot.connectionState}"),
                    Text("Settings loaded: $settingsLoaded")
                  ],
                )
              ),
            )
          );
        }

        // ...
        return builder(context);
      }
    );
  }
}

// TODO: decide where to put this
Future<RemoteConfig> setupRemoteConfig() async {
  final RemoteConfig remoteConfig = await RemoteConfig.instance;
  // Enable developer mode to relax fetch throttling
  await remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: true));

//  RemoteConfig.instance.
  try {
      // Using default duration to force fetching from remote server.
//      await remoteConfig.fetch(expiration: const Duration(seconds: 0));
//      await remoteConfig.activateFetched();

    await remoteConfig.fetch(expiration: Duration(minutes: 1)); // FIXME
    bool different = await remoteConfig.activateFetched();
  } on FetchThrottledException catch (exception) {
    // Fetch throttled.
    print(exception);
  } catch (exception) {
    print('Unable to fetch remote config. Cached or default values will be used');
  }


//  remoteConfig.addListener(listener);
//  remoteConfig.removeListener(listener);
//  remoteConfig.dispose();
//  remoteConfig.setDefaults(<String, dynamic>{
//    'welcome': 'default welcome',
//    'hello': 'default hello',
//  });
  return remoteConfig;
}