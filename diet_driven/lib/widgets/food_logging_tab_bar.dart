import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/widgets/food_record_tile.dart';
import 'package:diet_driven/widgets/selection_food_record_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodLoggingTabBar extends StatefulWidget {
  final FoodLoggingBloc foodLoggingBloc;
  final FoodLoggingTab foodLoggingTab;

  const FoodLoggingTabBar({Key key, @required this.foodLoggingBloc, @required this.foodLoggingTab})
    : assert(foodLoggingBloc != null),
      assert(foodLoggingTab != null),
      super(key: key);

  @override
  _FoodLoggingTabBarState createState() => _FoodLoggingTabBarState();
}

class _FoodLoggingTabBarState extends State<FoodLoggingTabBar> with AutomaticKeepAliveClientMixin<FoodLoggingTabBar> {
  FoodLoggingTabBloc _tabBloc;

  String userId;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    userId = (BlocProvider.of<UserDataBloc>(context).currentState as UserDataLoaded).authentication.uid;

    _tabBloc = FoodLoggingTabBloc(
      foodLoggingTab: widget.foodLoggingTab,
      futureResultRecords: RepositoryProvider.of<FoodRepository>(context).futureFoodRecordResultsFor(widget.foodLoggingTab, userId), // OPTIMIZE: bloc should access repository itself, also pass userId
      foodLoggingBloc: widget.foodLoggingBloc
    );
  }

  @override
  void dispose() {
    _tabBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Required for keep-alive
    super.build(context);

    return BlocBuilder<FoodLoggingTabEvent, FoodLoggingTabState>(
      bloc: _tabBloc,
      builder: (BuildContext context, FoodLoggingTabState state) {
        if (state is FoodLoggingTabUninitialized) {
          return Center(child: const CircularProgressIndicator(),);
        }

        if (state is FoodLoggingTabFailed) {
          return Center(child: const Text("Couldn't load results sorry"));
        }

        if (state is FoodLoggingTabLoaded) {
          // TODO: stateful widget! - stores and loads appropriate tab bloc
          // TOTEST: use delay to test this
          return ListView(
            children: <Widget>[
              for (var foodRecordResult in state.results)
                if (widget.foodLoggingBloc.currentState.multiSelect)
                  SelectionFoodRecordTile(
                    foodRecordResult.foodRecord,
//                                value: state.selectedFoodRecords.contains(foodRecordResult),
                    // TODO: exists in diary in different colour, for now disabled!
                    value: foodRecordResult.existsInSelection,
                    onChanged: (bool value) {
                      if (value) {
                        widget.foodLoggingBloc.dispatch(AddToSelection((b) => b
                          ..foodRecord = foodRecordResult.foodRecord.toBuilder()
                        ));
                      }
                      else {
                        widget.foodLoggingBloc.dispatch(RemoveFromSelection((b) => b
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
                        widget.foodLoggingBloc.dispatch(ReplaceSelected((b) => b
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
                      final FoodRecord modified = await Navigator.of(context).pushNamed<FoodRecord>(
                        "/logging_food_record_edit",
                        arguments: foodRecordResult.foodRecord
                      );

                      // Adds modified result to diary
                      if (modified != null) {
                        Navigator.of(context).pop(BuiltList<FoodRecord>(<FoodRecord>[modified]));
                      }
                    },
                    onLongPress: () {
                      // Enters multiple selection mode with initial selection
                      widget.foodLoggingBloc.dispatch(StartMultiSelect());
                      widget.foodLoggingBloc.dispatch(AddToSelection((b) => b
                        ..foodRecord = foodRecordResult.foodRecord.toBuilder()
                      ));
                    }
                  )
            ],
          );
        }

        return Center(child: Text("Tab state isn't defined: $state. Please report this to the developer!"));
      }
    );
  }
}
