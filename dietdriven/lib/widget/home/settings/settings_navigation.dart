import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/widget/home/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve part of a state and react to changes only when the selected part changes
    final isOnProfile = context.select((NavigationCubit cubit) => cubit.state.currentDeepLink.homeDeepLink.settingsDeepLink?.isOnProfile ?? false); // FIXME: shouldn't be nullable
    print("SettingsNavigation BLOC BUILDER");

    return Navigator(
      pages: [
        SettingsPage(),
        if (isOnProfile)
          MaterialPage(child: Scaffold(
            appBar: AppBar(title: Text("profile")),
            body: Center(child: Container(width: 100, height: 100, color: Colors.blue)),
          )),
      ],
      onPopPage: (route, result) => false, // route.didPop(result), // FIXME also need to notify bloc!!
    );
  }
}
