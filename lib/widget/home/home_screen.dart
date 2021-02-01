import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/domain/user_account.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:dietdriven/repository/authentication/authentication_repository.dart';
import 'package:dietdriven/widget/home/settings/settings_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

/// Manages bottom nav, deep links.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeDeepLinkPage.diary,
      HomeDeepLinkPage.diet,
      HomeDeepLinkPage.settings,
    ];

    // Retrieve part of a state and react to changes only when the selected part changes
    final currentPage = context.select((NavigationCubit cubit) => cubit.state.currentDeepLink.homeDeepLink.currentPage);

    print("HomeScreen BLOC BUILDER");

    return Scaffold(
      body: IndexedStack(
        index: pages.indexOf(currentPage),
        children: [
          // Center(child: Container(width: 100, height: 100, color: Colors.red)),
          Center(child: Column(
            children: [
              StreamBuilder<UserAccount>(
                stream: Provider.of<AuthenticationRepository>(context, listen: false).authStateChanges(),
                builder: (context, user) {
                  return Text("WELCOME ${user.data?.email}");
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
        onPressed: () {
          // TODO: firebase dynamic link looks like this:
          // TODO: encapsulate login as a method on the cubit
          context.read<NavigationCubit>().platformRouteInformationProvider.didPushRoute("test1");
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pages.indexOf(currentPage),
        onTap: (int index) {
          print("tapped $index");
          context.read<NavigationCubit>().switchHomeScreenPages(pages[index]);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Diary"),
          BottomNavigationBarItem(icon: Icon(Icons.no_food), label: "Diet"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}