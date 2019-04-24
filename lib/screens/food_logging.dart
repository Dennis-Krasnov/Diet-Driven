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
  final void Function(FoodRecord) addFoodRecord;

  const FoodLogging({Key key, @required this.addFoodRecord}) : super(key: key);

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
      diaryRepository: Repository().diary,
      foodRepository: Repository().food
    );

    _tabController = TabController(vsync: this, length: 3);
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
        bool multiSelect = state is FoodLoggingMultiSelect;
        String selectionType = multiSelect ? "multi-select" : "single-select";

        List<LoggingTab> tabs = [LoggingTab.recent, LoggingTab.popular, LoggingTab.favorite];

        String title;
        if (state is FoodLoggingMultiSelect) {
          int length = state.selectedFoodRecords.length;
          title = length > 0 ? "$length selected" : "select foods";
        }
        else {
          title = "MEAL: ${state.meal}"; // access list of meal names from BlocProvider<FoodDiary> of context 's diet field!
        }

        return Scaffold(
          appBar: AppBar(
            leading: multiSelect
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
              if (!multiSelect)
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
                ListView(
                  children: <Widget>[
                    for (var foodRecordResult in loggingTabToResults(loggingTab))
                      if (multiSelect)
                        CheckboxListTile( // TODO: normal list tile, trailing checkbox!
                          title: Text("$selectionType $loggingTab result $foodRecordResult"),
                          value: _foodLoggingBloc.currentState.getSelectedFoodRecords().contains(foodRecordResult),
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
          floatingActionButton: _foodLoggingBloc.currentState.getSelectedFoodRecords().isNotEmpty
            ? FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () => _foodLoggingBloc.dispatch(SaveSelection((b) => b
                  ..completer = infoSnackBarCompleter(
                    context,
                    "success",
                    shouldPop: true
                  )
                ))
              )
            : null,


//        Expanded(
//          child: SliverList(
//            delegate: SliverChildListDelegate([
////                    Icon(loggingTabToIcon(loggingTab)),
//              Container(color: Colors.red, height: 150.0),
//              Container(color: Colors.purple, height: 150.0),
//              Container(color: Colors.green, height: 150.0),
//            ]),
//          )
//        )
//          Center(
//            child: Column(
//              // TODO: create separate list tile, but for selection mode (boolean for selected!)
//              children: randomFoodRecords.map((foodRecord) => FoodRecordTile(
//                foodRecord,
//                deleteFoodRecord: null, // instead: field to specify before widget - can be button!
//                editFoodRecord: null, // rename on tap TODO: (mirror/extend listTile!)
//              )).toList(),
//            ),
//          ),
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
