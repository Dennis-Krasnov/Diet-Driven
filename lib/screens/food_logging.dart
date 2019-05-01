import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/repository_singleton.dart';
import 'package:diet_driven/widgets/food_record_tile.dart';
import 'package:diet_driven/widgets/selection_food_record_tile.dart';


class FoodLogging extends StatefulWidget {
  final FoodDiaryLoaded foodDiaryLoaded;

  const FoodLogging({Key key, @required this.foodDiaryLoaded}) : assert(foodDiaryLoaded != null), super(key: key);

  @override
  _FoodLoggingState createState() => _FoodLoggingState();
}

class _FoodLoggingState extends State<FoodLogging> with TickerProviderStateMixin {
  FoodLoggingBloc _foodLoggingBloc;
  BuiltList<FoodLoggingTabBloc> _tabBlocs;

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

    // TODO: create inside tab content stateful widget instead
    // TOTEST: ensure results aren't recreated when switching
    // TOTEST: selection works across tabs
    _tabBlocs = BuiltList(loggingTabs.map((tab) =>
      FoodLoggingTabBloc(
        loggingTab: tab,
        futureResultRecords: futureFoodRecordResultsFor(tab),
        diaryRecords: widget.foodDiaryLoaded.foodDiaryDay.foodRecords, // TODO: where foodRecord.meal == meal
        foodLoggingBloc: _foodLoggingBloc
      )
    ));

    _tabController = TabController(vsync: this, length: loggingTabs.length);
  }

  @override
  void dispose() {
    _foodLoggingBloc.dispose();
    _tabBlocs.forEach((bloc) => bloc.dispose());
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
              for (var tabBloc in _tabBlocs)
                BlocBuilder<FoodLoggingTabEvent, FoodLoggingTabState>(
                  bloc: tabBloc,
                  builder: (BuildContext context, FoodLoggingTabState tabState) {
                    if (tabState is FoodLoggingTabUninitialized) {
                      return Center(child: CircularProgressIndicator(),);
                    }

                    if (tabState is FoodLoggingTabFailed) {
                      return Center(child: Text("Couldn't load results sorry"));
                    }

                    if (tabState is FoodLoggingTabLoaded) {
                      return ListView(
                        children: <Widget>[
                          for (var foodRecordResult in tabState.results)
                            if (state.multiSelect)
                              SelectionFoodRecordTile(
                                foodRecordResult.foodRecord,
//                                value: state.selectedFoodRecords.contains(foodRecordResult),
                                // TODO: exists in diary in different colour, for now disabled!
                                value: foodRecordResult.existsInSelection,
                                onChanged: (bool value) {
                                  if (value) {
                                    _foodLoggingBloc.dispatch(AddToSelection((b) => b
                                      ..foodRecord = foodRecordResult.foodRecord.toBuilder()
                                    ));
                                  }
                                  else {
                                    _foodLoggingBloc.dispatch(RemoveFromSelection((b) => b
                                      ..foodRecord = foodRecordResult.foodRecord.toBuilder()
                                    ));
                                  }
                                },
                                onTap: () async {
                                  FoodRecord modified = await Navigator.of(context).pushNamed<FoodRecord>(
                                    "/logging_food_record_edit",
                                    arguments: foodRecordResult.foodRecord
                                  );

                                  // TOTEST: enter multiple selection, edit a result to something else, save it to selection,
                                    //  then remove it from selection and the old result quantity should reappear

                                  // Removes old food record from selection, adds modified result to selection
                                  if (modified != null) {
                                    _foodLoggingBloc.dispatch(ReplaceSelected((b) => b
                                      ..oldRecord = foodRecordResult.foodRecord.toBuilder()
                                      ..newRecord = modified.toBuilder()
                                    ));
                                  }
                                },
                              )
                            else
                              FoodRecordTile(
                                foodRecordResult.foodRecord,
                                onTap: () async {
                                  FoodRecord modified = await Navigator.of(context).pushNamed<FoodRecord>(
                                    "/logging_food_record_edit",
                                    arguments: foodRecordResult.foodRecord
                                  );

                                  // Adds modified result to diary
                                  if (modified != null) {
                                    Navigator.of(context).pop(BuiltList<FoodRecord>([modified]));
                                  }
                                },
                                onLongPress: () {
                                  // Enters multiple selection mode with initial selection
                                  _foodLoggingBloc.dispatch(StartMultiSelect());
                                  _foodLoggingBloc.dispatch(AddToSelection((b) => b
                                    ..foodRecord = foodRecordResult.foodRecord.toBuilder()
                                  ));
                                }
                              )
                        ],
                      );
                    }

                    return Center(child: Text("Tab state isn't defined: $tabState. Please report this to the developer!"));
                  }
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

  // TODO: move this to food repository
  /// Returns food record results for [userId]'s [loggingTab].
  /// Used to avoid passing down [foodRepository] and [userId] to every [FoodLoggingTabBloc].
  Future<BuiltList<FoodRecord>> futureFoodRecordResultsFor(LoggingTab loggingTab) {
    FoodRepository foodRepository = Repository().food;
    switch(loggingTab) {
      case LoggingTab.recent:
        return foodRepository.recentFoodRecords(userId);
        break;

      case LoggingTab.favorite:
        return foodRepository.recentFoodRecords(userId);
        break;

      case LoggingTab.popular:
        return foodRepository.recentFoodRecords(userId);
        break;

      case LoggingTab.frequent:
        return foodRepository.recentFoodRecords(userId);
        break;

      case LoggingTab.recipes:
        return foodRepository.recentFoodRecords(userId);
        break;

      default:
        throw Exception("$loggingTab isn't defined for futureFoodRecordResultsFor");
    }
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
