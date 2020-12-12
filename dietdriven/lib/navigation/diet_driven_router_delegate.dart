import 'package:dietdriven/bloc/navigation/navigation_cubit.dart';
import 'package:dietdriven/bloc/navigation/navigation_state.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum TempDeepLink {
  diary,
  diet,
}

class DietDrivenRouterDelegate extends RouterDelegate<DeepLinkPayload> with ChangeNotifier {
  final NavigationCubit navigationCubit;

  DietDrivenRouterDelegate({this.navigationCubit});

  // DeepLinkPayload _deepLinkPayload;

  @override
  Future<void> setInitialRoutePath(DeepLinkPayload configuration) async {
    navigationCubit.replace(configuration);
  }

  @override
  Future<void> setNewRoutePath(DeepLinkPayload configuration) async {
    navigationCubit.push(configuration);
  }

  @override
  Future<bool> popRoute() async {
    print("POPPED (I'VE NEVER SEEN THIS)...");
    // my best guess, is that this only works with navigator pops...
    // navigationCubit.pop();
    return true;
  }

  DeepLinkPayload get currentConfiguration {
    final authorized = navigationCubit.state as Authorized;
    return authorized.history.last;
  }

  @override
  Widget build(BuildContext context) {
    print("trying to build, config is $currentConfiguration");
    return BlocListener<NavigationCubit, NavigationState>(
      listener: (context, state) {
        print("bloc listener!");
        notifyListeners();
      },
      child: Scaffold(
        body: Center(
          child: Text(currentConfiguration.toString()),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentConfiguration.id,
          onTap: (index) => navigationCubit.goto(index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "one"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "two"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "three"),
          ],
        ),
      ),
    );
  }
}

// return Navigator(
//   key: navigatorKey,
//   transitionDelegate: NoAnimationTransitionDelegate2(),
//   pages: [
//     MaterialPage(
//       key: ValueKey('BooksListPage'),
//       child: BooksListScreen2(
//         books: books,
//         onTapped: _handleBookTapped,
//       ),
//     ),
//     if (_selectedBook != null) BookDetailsPage2(book: _selectedBook)
//   ],
//   onPopPage: (route, result) {
//     if (!route.didPop(result)) {
//       return false;
//     }
//
//     // Update the list of pages by setting _selectedBook to null
//     _selectedBook = null;
//     notifyListeners();
//
//     return true;
//   },
// );

// class DietDrivenRouterDelegate with ChangeNotifier implements RouterDelegate<TempDeepLink> {
//   @override
//   Widget build(BuildContext context) {
//     print("DietDrivenRouterDelegate build");
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(currentConfiguration.toString()),
//       ),
//     );
//   }
//
//   @override
//   TempDeepLink get currentConfiguration => TempDeepLink.diary; // TODO
//
//   @override
//   Future<bool> popRoute() {
//     // True = handles pop event, don't escalate
//     print("DietDrivenRouterDelegate pop route");
//     return SynchronousFuture(true);
//     // return Future.sync(() => true);
//   }
//
//   @override
//   Future<void> setInitialRoutePath(TempDeepLink configuration) {
//     print("DietDrivenRouterDelegate setInitialRoutePath");
//     // TODO: update configuration variable
//
//     // // TODO: implement setInitialRoutePath
//     // throw UnimplementedError();
//     return SynchronousFuture(null);
//     // return null;
//   }
//
//   @override
//   Future<void> setNewRoutePath(TempDeepLink configuration) {
//     print("DietDrivenRouterDelegate setNewRoutePath");
//     return SynchronousFuture(null);
//     // return null;
//     // // TODO: implement setNewRoutePath
//     // throw UnimplementedError();
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   DietDrivenRouterDelegate _dietDrivenRouterDelegate = DietDrivenRouterDelegate();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<NavigationCubit, NavigationState>(
//       listener: (context, state) {
//         assert(state is Authorized);
//         final authorized = state as Authorized;
//         print("listener weep weep wop wop ${authorized.history.last}");
//         _dietDrivenRouterDelegate.updateValue(authorized.history.last);
//       },
//       child: ,
//     );
//   }
// }