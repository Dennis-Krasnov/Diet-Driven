import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/screens/diary_page.dart';
import 'package:diet_driven/screens/penguin_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

// TODO: rename userData to UserState, should aggregate all data needed
// main should build only based on userState
// TODO: trace through logs! - draw on paper!

class HomePage extends StatefulWidget {
  final DiaryRepository diaryRepository;
  final FoodRepository foodRepository;
  final SettingsRepository settingsRepository;
  final AnalyticsRepository analyticsRepository;

  HomePage({
    @required this.diaryRepository,
    @required this.foodRepository,
    @required this.settingsRepository,
    @required this.analyticsRepository
  }) :
    assert(diaryRepository != null),
    assert(foodRepository != null),
    assert(settingsRepository != null),
    assert(analyticsRepository != null);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DiaryRepository get diaryRepository => widget.diaryRepository;
  FoodRepository get foodRepository => widget.foodRepository;
  SettingsRepository get settingsRepository => widget.settingsRepository;
  AnalyticsRepository get analyticsRepository => widget.analyticsRepository;

  // TODO: tracking, profile, recipes, exercise blocs
  NavigationBloc navigationBloc;

  @override
  void initState() {
    super.initState();

    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);

//    foodDiaryBloc = FoodDiaryBloc(userDataBloc: _userDataBloc, foodRepository: foodRepository);
//    foodDiaryBloc = FoodDiaryBloc(diaryRepository: diaryRepository, userId: "Z1TAAZu1jDMn0VbSAyKXUO1qc5z2", daysSinceEpoch: 124); // FIXME: wrapper should switchmap on user data
    navigationBloc = NavigationBloc(analyticsRepository: analyticsRepository);

    // Initialize blocs
//    foodDiaryBloc.dispatch(LoadFoodRecordDays());
    navigationBloc.dispatch(NavigateToPage((b) => b..page = "track")); // TODO: default page via. settings bloc
  }

  @override
  void dispose() {
//    foodDiaryBloc.dispose();
    navigationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
//        BlocProvider<FoodDiaryBloc>(bloc: foodDiaryBloc),
        BlocProvider<NavigationBloc>(bloc: navigationBloc),
      ],
      child: BlocBuilder(
        bloc: navigationBloc,
        builder: (BuildContext context, NavigationState state) {
          return Scaffold(
            body: Stack(
              children: state.bottomNavigationPages.map((page) =>
                Offstage(
                  offstage: state.currentPage != page,
                  child: generatePage(page)
                )
              ).toList(),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: state.bottomNavigationPages.map((page) =>
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  title: Text(page),
                )
              ).toList(),
              currentIndex: state.bottomNavigationPages.indexOf(state.currentPage),
              onTap: (index) {
                navigationBloc.dispatch(NavigateToPage((b) => b..page = state.bottomNavigationPages[index]));
              },
            ),
          );
        }
      )
    );
  }

  Widget generatePage(String page) {
    if (page == "diary") {
      // FIXME: diary page wrapper that manages current date, listens to userData bloc for updates!
      return DiaryPage(foodDiaryBloc: FoodDiaryBloc(diaryRepository: diaryRepository, userId: "Z1TAAZu1jDMn0VbSAyKXUO1qc5z2", daysSinceEpoch: 124),);
    }
    if (page == "track") {
      return TestPage(page);
    }
    if (page == "diet") {
      return TestPage(page);
    }
    if (page == "profile") {
      // TODO: checks hasDietDrivenAccess in its bloc (nest subscription bloc)
      // also check autentication bloc to display correct content
      return TestPage(page);
    }
    // TODO: if (page == "recipes")
    return TestPage("FAILURE");
  }
}


class TestPage extends StatelessWidget {
  final String title;
  TestPage(this.title);

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('logout'),
            onPressed: () {
//              authenticationBloc.dispatch(SignsOut()); // FIXME: call auth repository's sign out instead!!!
            },
          )
        ),
      ),
    );
  }
}
