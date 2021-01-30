import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/navigation/deep_link/prelude.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("SettingsScreen build");
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(child: FlatButton(
        child: Text("go to profile"),
        onPressed: () {
          final curr = context.read<NavigationCubit>().state.currentDeepLink;
          final deepLink = curr.copyWith(
            homeDeepLink: curr.homeDeepLink.copyWith(
              settingsDeepLink: SettingsDeepLink(
                isOnProfile: true,
              ),
            ),
          );
          context.read<NavigationCubit>().push(deepLink);
        },
      )),
    );
  }
}
