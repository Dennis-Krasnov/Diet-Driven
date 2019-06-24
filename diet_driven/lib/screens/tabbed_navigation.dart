import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/screens/diary_page.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/screens/under_construction.dart';

// TODO: ensure scroll is also persisted
//  https://api.flutter.dev/flutter/widgets/PageStorageKey-class.html
//              https://medium.com/@boldijar.paul/flutter-keeping-list-view-index-while-changing-page-view-c260352f35f8
//              https://www.youtube.com/watch?v=ht76lDzPgUQ

// Must be stateful widget to persist navigator keys
class TabbedNavigation extends StatefulWidget {
  @override
  _TabbedNavigationState createState() => _TabbedNavigationState();
}

class _TabbedNavigationState extends State<TabbedNavigation> {
  // Storing navigator keys for every potential page to persist navigation state
  Map<Page, GlobalKey<NavigatorState>> navigatorKeys = Map<Page, GlobalKey<NavigatorState>>.fromIterable(Page.values,
    key: (dynamic page) => page,
    value: (dynamic page) => GlobalKey<NavigatorState>(),
  );

  @override
  Widget build(BuildContext context) {
    // User data builder
    return BlocBuilder<UserDataEvent, UserDataState>(
      bloc: BlocProvider.of<UserDataBloc>(context),
      condition: (previous, current) { // TODO: do >> everywhere
        // User data not loaded
        if (previous is! UserDataLoaded || current is! UserDataLoaded) {
          print("UNCONDITIONAL TABBED NAV USER DATA UPDATE");
          return true;
        }
        // Navigation settings changed
        return (previous as UserDataLoaded).settings.navigationSettings != (current as UserDataLoaded).settings.navigationSettings;
      },
      // Navigation builder
      builder: (BuildContext context, UserDataState userDataState) {
        // ...
        final BuiltList<Page> bottomNavPages = (userDataState as UserDataLoaded).settings.navigationSettings.bottomNavigationPages;
        print("BOTTOM NAV PAGES $bottomNavPages");

        return BlocBuilder<NavigationEvent, NavigationState>(
          bloc: BlocProvider.of<NavigationBloc>(context),
          condition: (previous, current) => true,
          builder: (BuildContext context, NavigationState navigationState) {
            // ...
            final int tabIndex = bottomNavPages.indexWhere((page) => page == navigationState.page);

            // White screen with skeleton menu and app bar
            if (navigationState is NavigationUninitialized) {
              return Scaffold(); // OPTIMIZE
            }

            return Scaffold(
              // Need to specify custom back button behaviour
              // Otherwise app is dismissed and we are back to the home screen
              body: WillPopScope( // FIXME: this broke...
                onWillPop: () async {
                  final Page currentPage = Page.values.toList()[tabIndex];
                  // Page doesn't have nested navigation
                  if (navigatorKeys[currentPage].currentState == null)
                    return true;
                  // ...
                  return !await navigatorKeys[currentPage].currentState.maybePop();
                },
                // Shows one page at a time while persisting navigation
                child: IndexedStack(
                  index: tabIndex,
                  children: <Widget>[
                    for (var page in bottomNavPages)
                      pageToWidget(page, navigatorKeys[page])
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  // Displaying current bottom navigation buttons, no duplicates allowed
                  for(var page in bottomNavPages)
                    BottomNavigationBarItem(
                      icon: pageToIcon(page),
                      title: Text(page.name),
                    )
                ],
                currentIndex: tabIndex,
                onTap: (index) {
                  final NavigationBloc navigationBloc = BlocProvider.of<NavigationBloc>(context);
                  navigationBloc.dispatch(navigationBloc.pageToEvent(bottomNavPages[index]));
                },
              ),
            );
          }
        );
      }
    );
  }

  /// Creates respective page widget based on page enum.
  Widget pageToWidget(Page page, GlobalKey<NavigatorState> navigationKey) {
    switch (page) {
      case Page.diary:
        return DiaryPage();
        break;
      case Page.track:
        return const UnderConstruction(page: "Tracking");
        break;
      case Page.reports:
        return const UnderConstruction(page: "Reports");
        break;
      case Page.settings:
        return SettingsPage(navigationKey: navigationKey);
        break;
      default:
        return Container(child: Center(child: Text("couldn't find your $page"))); // OPTIMIZE
    }
  }

  /// Creates respective icon widget based on page enum.
  Icon pageToIcon(Page page) {
    switch (page) {
      case Page.diary:
        return const Icon(Icons.fastfood);
        break;
      case Page.track:
        return const Icon(Icons.list);
        break;
      case Page.reports:
        return const Icon(Icons.trending_up);
        break;
      case Page.settings:
        return const Icon(Icons.settings);
        break;
      default:
        return const Icon(Icons.error_outline);
    }
  }
}
