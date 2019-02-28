import 'package:diet_driven/actions/actions.dart';
import 'package:diet_driven/models/app_state.dart';
import 'package:diet_driven/models/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

/// DrawerNavButton displays either hamburger menu or back arrow depending on navigator state.
/// Note that it operates on global navigator only
/*
  Scaffold(
    appBar: AppBar(
      leading: DrawerNavButton(),
    ),
  );
 */
class GlobalDrawerNavButton extends StoreConnector<AppState, Actions, Page> {
  @override
  Page connect(AppState state) => state.navigation.bottomNavigationPage;

  @override
  Widget build(BuildContext context, Page bottomNavigationPage, Actions actions) =>
    IconButton(
      // Menu button normally, back arrow if nested
      icon: Icon(Navigator.canPop(context) ? Icons.arrow_back : Icons.menu),
      onPressed: () {
        if (Navigator.canPop(context)) {
          actions.navigation.goTo(bottomNavigationPage);
        } else {
          // Home page's scaffold
          Scaffold.of(Scaffold.of(context).context).openDrawer();
        }
    });
}