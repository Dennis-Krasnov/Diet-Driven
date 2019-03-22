import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/screens/diary_page.dart';
import 'package:diet_driven/screens/penguin_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

class HomePage extends StatefulWidget {
  final FoodRepository foodRepository;
  final SettingsRepository settingsRepository;

  HomePage({
    @required this.foodRepository,
    @required this.settingsRepository
  }) :
    assert(foodRepository != null),
    assert(settingsRepository != null);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FoodRepository get foodRepository => widget.foodRepository;
  SettingsRepository get settingsRepository => widget.settingsRepository;

  FoodDiaryBloc foodDiaryBloc;
  // TODO: tracking, profile, recipes, exercise blocs
  final NavigationBloc navigationBloc = NavigationBloc();

  @override
  void initState() {
    super.initState();
    foodDiaryBloc = FoodDiaryBloc(foodRepository: foodRepository);

    // Initialize blocs
    foodDiaryBloc.dispatch(LoadFoodRecordDays());
    navigationBloc.dispatch(NavigateToPage((b) => b..page = "track")); // TODO: default page via. settings bloc
  }

  @override
  void dispose() {
    foodDiaryBloc.dispose();
    navigationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<FoodDiaryBloc>(bloc: foodDiaryBloc),
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
}

Widget generatePage(String page) {
  if (page == "diary") {
    return DiaryPage();
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
              authenticationBloc.dispatch(LoggedOut());
            },
          )
        ),
      ),
    );
  }
}
