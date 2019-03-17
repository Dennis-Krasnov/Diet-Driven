import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/screens/diary_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

class HomePage extends StatefulWidget {
  final FoodRepository foodRepository;
  HomePage({@required this.foodRepository});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FoodRepository get foodRepository => widget.foodRepository;

  FoodDiaryBloc foodDiaryBloc;
  // TODO: move up to main if needed ??? (can access navigation through key?)
  final NavigationBloc navigationBloc = NavigationBloc();


  @override
  void initState() {
    super.initState();
    foodDiaryBloc = FoodDiaryBloc(foodRepository: foodRepository);
    // Start to load firestore stream
    foodDiaryBloc.dispatch(LoadFoodRecordDays());
    // FIXME: loading state isn't so useful when only waiting for firestore... (it returns a stream anyway)
  }

  @override
  void dispose() {
    foodDiaryBloc.dispose();
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
    return TestPage(page);
  }
  return TestPage("FAILURE");
//  if (page == "recipes")
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


//class HomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final AuthenticationBloc authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
//
//
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Home'),
//      ),
//      body: Container(
//        child: Center(
//          child: RaisedButton(
//            child: Text('logout'),
//            onPressed: () {
//              authenticationBloc.dispatch(LoggedOut());
//            },
//          )
//        ),
//      ),
//    );
//  }
//}