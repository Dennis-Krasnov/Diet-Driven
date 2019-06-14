import 'package:diet_driven/screens/profile_page.dart';
import 'package:diet_driven/screens/under_construction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repository_singleton.dart';
import 'package:diet_driven/screens/diary_page.dart';
import 'package:diet_driven/screens/error_screen.dart';
import 'package:diet_driven/blocs/blocs.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);

    return BlocProviderTree(
      blocProviders: [
        BlocProvider<NavigationBloc>(
          builder: (BuildContext context) => NavigationBloc(analyticsRepository: Repository().analytics, userDataBloc: _userDataBloc),
          dispose: (BuildContext context, NavigationBloc navigationBloc) => navigationBloc.dispose(),
        ),
        // Blocs that fetch their own dta must be instantiated before navigation BlocBuilder
        // Otherwise they're recreated every time the user switches page
        BlocProvider<FoodDiaryBloc>(
          builder: (BuildContext context) => FoodDiaryBloc(diaryRepository: Repository().diary, userId: "Z1TAAZu1jDMn0VbSAyKXUO1qc5z2", daysSinceEpoch: 124),
          dispose: (BuildContext context, FoodDiaryBloc tempFoodDiaryBloc) => tempFoodDiaryBloc.dispose(),
        ),
      ],
      child: Builder(builder: (BuildContext context) { // FIXME separate into widgets to avoid using builder
        return BlocBuilder<NavigationEvent, NavigationState>(
          bloc: BlocProvider.of<NavigationBloc>(context),
          builder: (BuildContext context, NavigationState state) {
            return BlocBuilder<UserDataEvent, UserDataState>(
              bloc: _userDataBloc,
              builder: (BuildContext context, UserDataState userDataState) {
                // White screen with skeleton menu and app bar TODO
                if (state is NavigationUninitialized) {
                  return const ErrorPage(error: "navigation is uninitialized!");
                }

                assert(state is NavigationLoaded);
                if (state is NavigationLoaded && userDataState is UserDataLoaded) {
                  return Scaffold(
                    body: Stack(
                      children: userDataState.settings.navigationSettings.bottomNavigationPages.map((page) =>
                        Offstage(
                          offstage: state.currentPage != page,
                          child: generatePage(context, page)
                        )
                      ).toList(),
                    ),
                    bottomNavigationBar: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      items: userDataState.settings.navigationSettings.bottomNavigationPages.map((page) =>
                        BottomNavigationBarItem(
                          icon: const Icon(Icons.add),
                          title: Text(page.name),
                        )
                      ).toList(),
                      currentIndex: userDataState.settings.navigationSettings.bottomNavigationPages.indexOf(state.currentPage),
                      onTap: (index) {
                        BlocProvider.of<NavigationBloc>(context).dispatch(NavigateToPage((b) => b..page = userDataState.settings.navigationSettings.bottomNavigationPages[index]));
                      },
                    ),
                  );
                }
              }
            );
          }
        );
        })
    );
  }

  Widget generatePage(BuildContext context, Page page) {
    switch (page) {
      case Page.diary:
        // FIXME: diary page wrapper that creates foodDiaryBloc, manages current date, listens to userData bloc for updates!
        return DiaryPage(foodDiaryBloc: BlocProvider.of<FoodDiaryBloc>(context),);
        break;
      case Page.track:
        return const UnderConstruction(page: "Tracking");
        break;
      case Page.diet:
        return const UnderConstruction(page: "Diet");
        break;
      case Page.profile:
        return ProfilePage();
        break;
      case Page.recipes:
        return const UnderConstruction(page: "Recipes");
        break;
      default:
        return const ErrorPage(error: "FAILURE");
    }
  }
}