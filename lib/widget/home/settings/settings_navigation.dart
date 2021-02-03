import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/navigation/deep_link/home/home_deep_link_page.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:dietdriven/widget/build_logger.dart';
import 'package:dietdriven/widget/home/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// ...
class SettingsNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Rebuild only when the selected part of navigation state changes
    final isOnProfile = context.select((NavigationCubit cubit) {
      final deepLink = cubit.state.mostRecentWhere((dl) => dl?.homeDeepLink?.currentPage == HomeDeepLinkPage.settings);
      return deepLink?.homeDeepLink?.settingsDeepLink?.isOnProfile ?? false;
    });

    buildLog.v("SettingsNavigation - rebuild: isOnProfile=$isOnProfile");

    return Navigator(
      pages: [
        SettingsPage(),
        if (isOnProfile)
          MaterialPage(child: Scaffold(
            appBar: AppBar(title: Text("profile"), leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => context.read<NavigationCubit>().pop())),
            body: Center(child: Container(width: 100, height: 100, color: Colors.blue)),
          )),
      ],
      onPopPage: (route, result) => false, // Don't use Navigator's built-in state
    );
  }
}
