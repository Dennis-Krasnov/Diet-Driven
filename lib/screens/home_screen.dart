import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repository_singleton.dart';
import 'package:diet_driven/screens/diary_page.dart';
import 'package:diet_driven/screens/error_screen.dart';
import 'package:diet_driven/blocs/blocs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NavigationBloc navigationBloc;

  FoodDiaryBloc tempFoodDiaryBloc;


  @override
  void initState() {
    super.initState();

    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);
    assert(_userDataBloc.currentState is UserDataLoaded);
    navigationBloc = NavigationBloc(analyticsRepository: Repository().analytics, userDataBloc: _userDataBloc);

    // Blocs that fetch their own dta must be instantiated before navigation BlocBuilder
    // Otherwise they're recreated every time the user switches page
    tempFoodDiaryBloc = FoodDiaryBloc(diaryRepository: Repository().diary, userId: "Z1TAAZu1jDMn0VbSAyKXUO1qc5z2", daysSinceEpoch: 124);
  }

  @override
  void dispose() {
    navigationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);

    return BlocProviderTree(
      blocProviders: [
        BlocProvider<NavigationBloc>(bloc: navigationBloc),
      ],
      child: BlocBuilder(
        bloc: navigationBloc,
        builder: (BuildContext context, NavigationState state) {
          return BlocBuilder<UserDataEvent, UserDataState>(
            bloc: _userDataBloc,
            builder: (BuildContext context, UserDataState userDataState) {
              // White screen with skeleton menu and app bar TODO
              if (state is NavigationUninitialized) {
                return ErrorPage(error: "navigation is uninitialized!");
              }

              assert(state is NavigationLoaded);
              if (state is NavigationLoaded && userDataState is UserDataLoaded) {
                return Scaffold(
                  body: Stack(
                    children: userDataState.settings.navigationSettings.bottomNavigationPages.map((page) =>
                      Offstage(
                        offstage: state.currentPage != page,
                        child: generatePage(page)
                      )
                    ).toList(),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    items: userDataState.settings.navigationSettings.bottomNavigationPages.map((page) =>
                      BottomNavigationBarItem(
                        icon: Icon(Icons.add),
                        title: Text(page.name),
                      )
                    ).toList(),
                    currentIndex: userDataState.settings.navigationSettings.bottomNavigationPages.indexOf(state.currentPage),
                    onTap: (index) {
                      navigationBloc.dispatch(NavigateToPage((b) => b..page = userDataState.settings.navigationSettings.bottomNavigationPages[index]));
                    },
                  ),
                );
              }
            }
          );
        }
      )
    );
  }

  Widget generatePage(Page page) {
    switch (page) {
      case Page.diary:
        // FIXME: diary page wrapper that creates foodDiaryBloc, manages current date, listens to userData bloc for updates!
        return DiaryPage(foodDiaryBloc: tempFoodDiaryBloc,);
        break;
      case Page.track:
        return TestPage(page);
        break;
      case Page.diet:
        return TestPage(page);
        break;
      case Page.profile:
        // TODO: checks hasDietDrivenAccess in its bloc (nest subscription bloc)
        // also check authentication bloc to display correct content
        return TestPage(page);
        break;
      case Page.recipes:
        return ErrorPage(error: "Recipes aren't ready yet",);
        break;
      default:
        return ErrorPage(error: "FAILURE");
    }
  }
}


class TestPage extends StatelessWidget {
  final Page title;
  TestPage(this.title);

  @override
  Widget build(BuildContext context) {
//    final AuthenticationBloc authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title.name),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('logout'),
            onPressed: () {
              Repository().user.signOut();
              // TODO: completer + through bloc
//              authenticationBloc.dispatch(SignsOut()); // FIXME: call auth repository's sign out instead!!!
            },
          )
        ),
      ),
    );
  }
}
