import 'dart:math';

import 'package:diet_driven/widgets/food_logging_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repository_singleton.dart';


class FoodLogging extends StatefulWidget {
  final FoodDiaryLoaded foodDiaryLoaded;

  const FoodLogging({Key key, @required this.foodDiaryLoaded}) : assert(foodDiaryLoaded != null), super(key: key);

  @override
  _FoodLoggingState createState() => _FoodLoggingState();
}

class _FoodLoggingState extends State<FoodLogging> with TickerProviderStateMixin {
  FoodLoggingBloc _foodLoggingBloc;
  TabController _tabController;

  String userId;
  BuiltList<LoggingTab> loggingTabs;

  @override
  void initState() {
    super.initState();

    userId = (BlocProvider.of<UserDataBloc>(context).currentState as UserDataLoaded).authentication.uid;
    loggingTabs = BuiltList([LoggingTab.recent, LoggingTab.popular, LoggingTab.favorite]); // TODO: take tabs from settings!

    _foodLoggingBloc = FoodLoggingBloc(
      userId: userId,
      mealIndex: 0, // TODO: take as optional widget parameter!
      startWithMultiSelect: false, // TODO: take from settings!
      foodDiaryLoaded: widget.foodDiaryLoaded,
      foodRepository: Repository().food
    );

    _tabController = TabController(vsync: this, length: loggingTabs.length, initialIndex: 0); // TODO: initialIndex from settings
  }

  @override
  void dispose() {
    _foodLoggingBloc.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _foodLoggingBloc,
      builder: (BuildContext context, FoodLoggingState state) {
        String selectionType = state.multiSelect ? "multi-select" : "single-select";

        String title = state.multiSelect
          ? "Add (${state.selectedFoodRecords.length}) to #${state.mealIndex} (${widget.foodDiaryLoaded.foodDiaryDay.foodRecords.length})"
          : "Add to #${state.mealIndex} (${widget.foodDiaryLoaded.foodDiaryDay.foodRecords.length})"; // TODO: of that meal
        // access list of meal names from BlocProvider<FoodDiary> of context 's diet field!

        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            bottom: TabBar(
              controller: _tabController,
              tabs: [
                for (var loggingTab in loggingTabs) Tab(
                  icon: Icon(loggingTabToIcon(loggingTab))
                )
              ]
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.select_all), // TODO: single and multi select icons
                onPressed: () async {
                  if (state.multiSelect) {
                    // Confirmation if going to lose non-empty selection
                    if (state.selectedFoodRecords.isNotEmpty) {
                      bool confirmed = await showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: new Text("Switching to single selection will lose ${state.selectedFoodRecords.length} records"),
                            content: new Text("[list the records]"),
                            actions: <Widget>[
                              new FlatButton(
                                child: new Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop<bool>(false);
                                },
                              ),
                              new FlatButton(
                                child: new Text("Yes!"),
                                onPressed: () {
                                  Navigator.of(context).pop<bool>(true);
                                },
                              ),
                            ],
                          );
                        }
                      );
                      if (confirmed != null && confirmed) {
                        _foodLoggingBloc.dispatch(CancelMultiSelect());
                      }
                    }
                    else {
                      _foodLoggingBloc.dispatch(CancelMultiSelect());
                    }
                  }
                  else {
                    _foodLoggingBloc.dispatch(StartMultiSelect());
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () => showSearch(
                  context: context,
                  delegate: CustomSearchDelegate()
                )
              )
            ],
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              for (var tab in loggingTabs)
                FoodLoggingTab(
                  foodLoggingState: state,
                  foodLoggingBloc: _foodLoggingBloc,
                  loggingTab: tab,
                  diaryRecords: widget.foodDiaryLoaded.foodDiaryDay.foodRecords, // TODO: where = meal goes here or above in getter
                )
            ],
          ),
          floatingActionButton: state.multiSelect && state.selectedFoodRecords.isNotEmpty
            ? FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () {
                  Navigator.of(context).pop(state.selectedFoodRecords);
                }
              )
            : null,
        );
      },
    );
  }

}

//void _onWidgetDidBuild(Function callback) {
//  WidgetsBinding.instance.addPostFrameCallback((_) {
//    callback();
//  });
//}

IconData loggingTabToIcon(LoggingTab loggingTab) {
  switch (loggingTab) {
    case LoggingTab.recent:
      return Icons.timer;
      break;
    case LoggingTab.frequent:
      return Icons.repeat;
      break;
    case LoggingTab.popular:
      return Icons.whatshot;
      break;
    case LoggingTab.favorite:
      return Icons.favorite;
      break;
    case LoggingTab.recipes:
      return Icons.list;
      break;
    default:
      throw Exception("no icon was defiend for $loggingTab in loggingTabToIcon");
  }
}

//https://medium.com/flutterpub/implementing-search-in-flutter-17dc5aa72018
class CustomSearchDelegate extends SearchDelegate {

  // TODO: attach a bloc / at least use a repository

  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // can return T data
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<int> random = List<int>.generate(Random().nextInt(10), (index) => index * Random().nextInt(10));
    return ListView.builder(
      itemCount: random.length,
      itemBuilder: (context, index) {
        var result = random[index];
        return ListTile(
          title: Text(result.toString()),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }

}

//class LoadingAlsoFetches extends StatelessWidget { // TODO: name this something relevant
//  final LoggingTab loggingTab;
//  final Function callOnLoad;
//
//  const LoadingAlsoFetches({Key key, this.loggingTab, this.callOnLoad}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: only load if it's null - at if (loggingTabToResults(loggingTab) == null)
//    _onWidgetDidBuild(callOnLoad); // TODO: use stateful widget instead...
//    return Center(child: CircularProgressIndicator());
//  }
//}

//// Access context from food diary bloc provider instead of inheriting ancestor context.
//      child: Builder(builder: (BuildContext context) {
