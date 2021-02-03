import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/domain/user_account.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:dietdriven/repository/authentication/authentication_repository.dart';
import 'package:dietdriven/widget/build_logger.dart';
import 'package:dietdriven/widget/home/settings/settings_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger_flutter/logger_flutter.dart';
import 'package:provider/provider.dart';

/// Manages bottom nav, deep links.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  static final pages = [
    HomeDeepLinkPage.diary,
    HomeDeepLinkPage.diet,
    HomeDeepLinkPage.settings,
  ];

  @override
  Widget build(BuildContext context) {
    // Rebuild only when the selected part of navigation state changes
    final currentPage = context.select((NavigationCubit cubit) =>
      cubit.state.mostRecentWhere((dl) => dl.currentPage == DeepLinkPage.home)?.homeDeepLink?.currentPage
    );

    buildLog.v("HomeScreen - rebuild: currentPage=$currentPage");

    // Handle race condition between the navigator removing this page and the navigation state updating
    if (currentPage == null) {
      return Container();
    }

    return Scaffold(
      body: IndexedStack(
        index: pages.indexOf(currentPage),
        children: [
          // Center(child: Container(width: 100, height: 100, color: Colors.red)),
          Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<UserAccount>(
                stream: Provider.of<AuthenticationRepository>(context, listen: false).authStateChanges(),
                builder: (context, user) {
                  return Text("WELCOME ${user.data}");
                }
              ),
              RaisedButton(
                onPressed: () async {
                  await Provider.of<AuthenticationRepository>(context, listen: false).signOut();
                },
                child: Text("log out"),
              ),
            ],
          )),
          Center(child: Container(width: 100, height: 100, color: Colors.orange)),
          SettingsNavigation(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => LogConsole.open(context),
        child: Icon(Icons.help),
        // {
          // TODO: firebase dynamic link looks like this:
          // TODO: encapsulate login as a method on the cubit
        //   context.read<NavigationCubit>().platformRouteInformationProvider.didPushRoute("test1");
        // },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pages.indexOf(currentPage),
        onTap: (int index) => context.read<NavigationCubit>().switchHomeScreenPages(pages[index]),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Diary"),
          BottomNavigationBarItem(icon: Icon(Icons.no_food), label: "Diet"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}