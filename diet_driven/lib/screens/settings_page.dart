import 'package:diet_driven/screens/settings/general_settings_page.dart';
import 'package:diet_driven/screens/settings/theme_settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/screens/main_settings_page.dart';
import 'package:diet_driven/repository_singleton.dart';
import 'package:diet_driven/screens/settings/subscription_settings_page.dart';

class SettingsPage extends StatelessWidget {
  // Persists navigation across tabs
  final GlobalKey<NavigatorState> navigationKey;

  const SettingsPage({Key key, @required this.navigationKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigationKey,
      initialRoute: 'settings',
      onGenerateRoute: (RouteSettings settings) => generateRoute(context, settings),
    );
  }

  /// Profile page's navigator routes.
  Route generateRoute(BuildContext context, RouteSettings settings) {
    final userId = (BlocProvider.of<UserDataBloc>(context).currentState as UserDataLoaded).authentication.uid;

    WidgetBuilder builder;
    switch (settings.name) {
      case 'settings':
        builder = (BuildContext _) => MainSettingsPage();
        break;
      case 'settings/general':
        builder = (BuildContext _) => GeneralSettingsPage();
        break;
      case 'settings/profile':
        builder = (BuildContext _) => GeneralSettingsPage();
        break;
      case 'settings/subscription':
        builder = (BuildContext _) => BlocProvider<SubscriptionEditBloc>(
          builder: (BuildContext context) => SubscriptionEditBloc(userRepository: Repository().user),
          dispose: (BuildContext context, SubscriptionEditBloc subscriptionEditBloc) => subscriptionEditBloc.dispose(),
          child: SubscriptionSettingsPage()
        );
        break;
      case 'settings/diary':
        builder = (BuildContext _) => GeneralSettingsPage();
        break;
        // ,,,
      case 'settings/theme':
        builder = (BuildContext _) => BlocProvider<SettingsEditBloc>(
          builder: (BuildContext context) => SettingsEditBloc(userId: userId, userRepository: Repository().user),
          dispose: (BuildContext context, SettingsEditBloc settingsEditBloc) => settingsEditBloc.dispose(),
          child: ThemeSettingsPage()
        );
        break;
        // ,,,
      default:
        throw Exception('Invalid deep link: ${settings.name}');
    }

    // TODO: make global navigator follow this builder pattern as well
    return MaterialPageRoute<void>(builder: builder, settings: settings);
  }
}
