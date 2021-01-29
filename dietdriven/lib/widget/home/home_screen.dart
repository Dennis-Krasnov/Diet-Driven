import 'package:dietdriven/bloc/navigation/prelude.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

/// Manages bottom nav, deep links.
class HomeScreen extends StatelessWidget {
  final HomeDeepLink deepLink;

  const HomeScreen({Key key, this.deepLink}) : super(key: key);

  Color calculateColour(HomeDeepLinkPage homeDeepLinkPage) {
    switch (deepLink.currentPage) {
      case HomeDeepLinkPage.diary:
        return Colors.red;
        break;
      case HomeDeepLinkPage.diet:
        return Colors.blue;
        break;
      case HomeDeepLinkPage.settings:
        return Colors.orange;
        break;
    }
    throw UnimplementedError("Unknown $homeDeepLinkPage");
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeDeepLinkPage.diary,
      HomeDeepLinkPage.diet,
      HomeDeepLinkPage.settings,
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("HOME SCREEN: ${deepLink.diaryDeepLink.date}"),
      // ),
      body: IndexedStack(
        index: pages.indexOf(deepLink.currentPage),
        children: [
          for (final page in pages)
            Center(child: Container(width: 100, height: 100, color: calculateColour(page))),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pages.indexOf(deepLink.currentPage),
        onTap: (int index) {
          print("tapped $index");
          context.read<NavigationCubit>().switchHomeScreenPages(pages[index]);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Diary"),
          // TODO: search?
          // TODO: body
          BottomNavigationBarItem(icon: Icon(Icons.no_food), label: "Diet"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
    // final navigationCubit = Provider.of<NavigationCubit>(context, listen: false);
    // return Router(
    //   // routerDelegate: DietDrivenRouterDelegate(navigationCubit: context.watch<NavigationCubit>()),
    //   routerDelegate: DietDrivenRouterDelegate(navigationCubit: navigationCubit),
    //   // routeInformationProvider: DietDrivenRouteInformationProvider(),
    //   routeInformationProvider: PlatformRouteInformationProvider(initialRouteInformation: RouteInformation(location: "/"))..routerReportsNewRouteInformation(RouteInformation(location: "/deep-link/2")),
    //   routeInformationParser: DietDrivenRouteInformationParser(),
    //   backButtonDispatcher: DietDrivenBackButtonDispatcher(navigationCubit: navigationCubit),
    // );
  }
}