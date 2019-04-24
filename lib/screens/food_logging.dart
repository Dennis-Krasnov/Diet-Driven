import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repository_singleton.dart';
import 'package:diet_driven/widgets/completer.dart';
import 'package:diet_driven/widgets/food_record_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodLogging extends StatefulWidget {
  @override
  _FoodLoggingState createState() => _FoodLoggingState();
}

class _FoodLoggingState extends State<FoodLogging> with TickerProviderStateMixin {
  FoodLoggingBloc _foodLoggingBloc;
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);
    String userId = (_userDataBloc.currentState as UserDataLoaded).authentication.uid;
    int daysSinceEpoch = 124; // TODO: take from diary wrapper bloc

    _foodLoggingBloc = FoodLoggingBloc(
      userId: userId,
      daysSinceEpoch: daysSinceEpoch,
      meal: 0,
      startWithMultiSelect: false, // TODO: take from settings!
      diaryRepository: Repository().diary,
      foodRepository: Repository().food
    );

    _tabController = TabController(vsync: this, length: 3); // TODO: take tabs from settings!
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

        List<LoggingTab> tabs = [LoggingTab.recent, LoggingTab.popular, LoggingTab.favorite]; // TODO: take tabs from settings!

        String title = state.multiSelect
          ? (state.selectedFoodRecords.length > 0 ? "${state.selectedFoodRecords.length} selected" : "select foods")
          : "MEAL: ${state.meal}"; // access list of meal names from BlocProvider<FoodDiary> of context 's diet field!

        return Scaffold(
          appBar: AppBar(
            leading: state.multiSelect
              ? IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => _foodLoggingBloc.dispatch(CancelMultiSelect()),
                )
              : null,
            title: Text(title),
            bottom: TabBar(
              controller: _tabController,
              tabs: [
                for (var loggingTab in tabs) Tab(
                  icon: Icon(loggingTabToIcon(loggingTab))
                )
              ]
            ),
            actions: <Widget>[
              if (!state.multiSelect)
                IconButton(
                  icon: Icon(Icons.select_all),
                  onPressed: () => _foodLoggingBloc.dispatch(StartMultiSelect()),
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
              for (var loggingTab in tabs)
                // OPTIMIZE: store result of loggingTabToResults(loggingTab) so I don't call it twice in a row
                if (loggingTabToResults(loggingTab) == null)
                  LoadingAlsoFetches(
                    loggingTab: loggingTab,
                    callOnLoad: () => _foodLoggingBloc.dispatch(FetchFoodRecordsResults((b) => b
                      ..loggingTab = loggingTab
                      // Avoiding error state using completer FIXME: says it's not in a scaffold...
//                      ..completer = infoSnackBarCompleter(
//                        context,
//                        "loaded $loggingTab",
//                      )
                    )),
                  )
                else
                  ListView(
                    children: <Widget>[
                      for (var foodRecordResult in loggingTabToResults(loggingTab))
                        if (state.multiSelect)
                          CheckboxListTile( // TODO: normal list tile, trailing checkbox!
                            title: Text("$selectionType $loggingTab result $foodRecordResult"),
                            value: _foodLoggingBloc.currentState.selectedFoodRecords.contains(foodRecordResult),
  //                          onTap: details
                            onChanged: (bool value) {
                              if (value) {
                                _foodLoggingBloc.dispatch(AddToSelection((b) => b
                                  ..foodRecord = foodRecordResult.toBuilder()
                                ));
                              }
                              else {
                                _foodLoggingBloc.dispatch(RemoveFromSelection((b) => b
                                  ..foodRecord = foodRecordResult.toBuilder()
                                ));
                              }
                            },
                          )
                        else
                          ListTile(
                            title: Text("$selectionType $loggingTab result $foodRecordResult"),
                            onTap: null,
                            onLongPress: () {
                              _foodLoggingBloc.dispatch(StartMultiSelect());
                              _foodLoggingBloc.dispatch(AddToSelection((b) => b
                                ..foodRecord = foodRecordResult.toBuilder()
                              ));
                            }
                          )
                    ],
                  )
            ],
          ),
          floatingActionButton: _foodLoggingBloc.currentState.selectedFoodRecords.isNotEmpty
            ? FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () => _foodLoggingBloc.dispatch(SaveSelection((b) => b
                  ..completer = infoSnackBarCompleter(
                    context,
                    state.multiSelect ? "${state.selectedFoodRecords.length} food records saved" : "food record saved",
                    // Single select is completed from within food record info
                    popNTimes: state.multiSelect ? 1 : 0
                  )
                ))
              )
            : null,
        );
      },
    );
  }

  BuiltList<FoodRecord> loggingTabToResults(LoggingTab loggingTab) {
    switch (loggingTab) {
      // FIXME
      case LoggingTab.frequent:
      case LoggingTab.recipes:
      case LoggingTab.recent:
        return _foodLoggingBloc.currentState.recentResults;
        break;
      case LoggingTab.popular:
        return _foodLoggingBloc.currentState.popularResults;
        break;
      case LoggingTab.favorite:
        return _foodLoggingBloc.currentState.favoriteResults;
        break;
      default:
        throw Exception("no results was defiend for $loggingTab in loggingTabToResults");
    }
  }
}

void _onWidgetDidBuild(Function callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}

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

class LoadingAlsoFetches extends StatelessWidget {
  final LoggingTab loggingTab;
  final Function callOnLoad;

  const LoadingAlsoFetches({Key key, this.loggingTab, this.callOnLoad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: only load if it's null - at if (loggingTabToResults(loggingTab) == null)
    _onWidgetDidBuild(callOnLoad);
    return Center(child: CircularProgressIndicator());
  }
}
