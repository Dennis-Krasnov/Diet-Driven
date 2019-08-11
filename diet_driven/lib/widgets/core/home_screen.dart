import 'package:diet_driven/widgets/font_awesome.dart';
import 'package:diet_driven/widgets/loading/loading.dart';
import 'package:diet_driven/widgets/logging/logging_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/widgets/food_diary/food_diary.dart';
import 'package:diet_driven/widgets/message/message.dart';
import 'package:diet_driven/widgets/settings/settings.dart';

/// Manages bottom navigation and displays respective page.
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Must be stateful widget to persist navigation state throughout builds.
  Map<Page, GlobalKey<NavigatorState>> navigatorKeys = Map<Page, GlobalKey<NavigatorState>>.fromIterable(
    Page.values,
    key: (dynamic page) => page,
    value: (dynamic page) => GlobalKey<NavigatorState>(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(
      condition: (previous, current) {
        // Unconditional rebuild
        if (previous is! UserDataLoaded || current is! UserDataLoaded)
          return true;

        // Rebuild only if theme settings changed
        return (previous as UserDataLoaded).settings.navigationSettings != (current as UserDataLoaded).settings.navigationSettings;
      },
      builder: (BuildContext context, UserDataState userDataState) {
        final bottomNavPages = (userDataState as UserDataLoaded).settings.navigationSettings.bottomNavigationPages;

        return BlocBuilder<NavigationBloc, NavigationState>(
          builder: (BuildContext context, NavigationState navigationState) {
            // White screen with skeleton menu and app bar
            if (navigationState is NavigationUninitialized) {
              return const SplashPage();
            }

            // Index of currently selected page
            assert(bottomNavPages.contains(navigationState.page));
            final int tabIndex = bottomNavPages.indexWhere((page) => page == navigationState.page);

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
                // Shows one page at a time while persisting nested navigation
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
                      title: Text(page.name),//, style: TextStyle(fontWeight: FontWeight.w600,)),
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Icon(FaRegular(page.toFontAwesomeCode()),),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Icon(FaSolid(page.toFontAwesomeCode()),),
                      ),
                    )
                ],
                currentIndex: tabIndex,
                onTap: (index) {
                  final NavigationBloc navigationBloc = BlocProvider.of<NavigationBloc>(context);
                  navigationBloc.dispatch(navigationBloc.pageToEvent(bottomNavPages[index]));
                },
                elevation: 4,
                iconSize: 24,
                selectedItemColor: Theme.of(context).primaryColor,
                unselectedItemColor: Theme.of(context).unselectedWidgetColor,
                selectedFontSize: 15,
                unselectedFontSize: 14,
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
        return FoodDiaryPage(); // TODO: wrap with provider here?!
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
      case Page.logging:
        return LoggingPage();
        break;
      default:
        return Container(child: Center(child: Text("couldn't find your $page"))); // OPTIMIZE
    }
  }
}


