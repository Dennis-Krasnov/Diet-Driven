import 'dart:math';

import 'package:diet_driven/screens/food_record_search.dart';
import 'package:diet_driven/widgets/food_logging_tab.dart';
import 'package:diet_driven/widgets/food_record_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:built_collection/built_collection.dart';

import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repository_singleton.dart';


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
    loggingTabs = BuiltList(<LoggingTab>[LoggingTab.recent, LoggingTab.popular, LoggingTab.favorite]); // TODO: take tabs from settings!

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

    return BlocBuilder<FoodLoggingEvent, FoodLoggingState>(
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
                icon: const Icon(Icons.select_all), // TODO: single and multi select icons
                onPressed: () async {
                  if (state.multiSelect) {
                    // Confirmation if going to lose non-empty selection
                    if (state.selectedFoodRecords.isNotEmpty) {
                      final bool confirmed = await showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Switching to single selection will lose ${state.selectedFoodRecords.length} records"),
                            content: const Text("[list the records]"),
                            actions: <Widget>[
                              FlatButton(
                                child: const Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop<bool>(false);
                                },
                              ),
                              FlatButton(
                                child: const Text("Yes!"),
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
                icon: const Icon(Icons.search),
                onPressed: () async {
                  final FoodRecord searchFoodRecord = await Navigator.of(context).pushNamed<FoodRecord>(
                    "/food_search",
                    arguments: state
                  );

                  if (searchFoodRecord != null) {
                    if (state.multiSelect) {
                      _foodLoggingBloc.dispatch(AddToSelection((b) => b
                        ..foodRecord = searchFoodRecord.toBuilder()
                      ));
                    }
                    else {
                      Navigator.of(context).pop(BuiltList<FoodRecord>(<FoodRecord>[searchFoodRecord]));
                    }
                  }
                }
              )
            ],
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              for (var tab in loggingTabs)
                FoodLoggingTab(
                  foodLoggingBloc: _foodLoggingBloc,
                  loggingTab: tab,
                )
            ],
          ),
          floatingActionButton: state.multiSelect && state.selectedFoodRecords.isNotEmpty
            ? FloatingActionButton(
                child: const Icon(Icons.check),
                onPressed: () {
                  Navigator.of(context).pop(state.selectedFoodRecords.toBuiltList()); // OPTIMIZE: should diary also store in built sets?
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
