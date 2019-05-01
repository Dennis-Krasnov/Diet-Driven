import 'package:built_collection/built_collection.dart';
import 'package:diet_driven/blocs/blocs.dart';
import 'package:diet_driven/models/models.dart';
import 'package:diet_driven/repository_singleton.dart';
import 'package:diet_driven/widgets/food_record_tile.dart';
import 'package:diet_driven/widgets/selection_food_record_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodLoggingTab extends StatefulWidget {
  final FoodLoggingState foodLoggingState;
  final FoodLoggingBloc foodLoggingBloc;
  final BuiltList<FoodRecord> diaryRecords; // TODO: place these into foodLogging bloc
  final LoggingTab loggingTab;

  const FoodLoggingTab({Key key, this.foodLoggingState, this.foodLoggingBloc, this.diaryRecords, this.loggingTab})
    : assert(foodLoggingState != null),
      assert(foodLoggingBloc != null),
      assert(diaryRecords != null),
      assert(loggingTab != null),
      super(key: key);

  @override
  _FoodLoggingTabState createState() => _FoodLoggingTabState();
}

class _FoodLoggingTabState extends State<FoodLoggingTab> with AutomaticKeepAliveClientMixin<FoodLoggingTab> {
  FoodLoggingTabBloc _tabBloc;

  String userId;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    userId = (BlocProvider.of<UserDataBloc>(context).currentState as UserDataLoaded).authentication.uid;

    _tabBloc = FoodLoggingTabBloc(
      loggingTab: widget.loggingTab,
      futureResultRecords: Repository().food.futureFoodRecordResultsFor(widget.loggingTab, userId), // OPTIMIZE: bloc should access repository itself, also pass userId
      diaryRecords: widget.diaryRecords, // TODO: where foodRecord.meal == meal
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
          return Center(child: CircularProgressIndicator(),);
        }

        if (state is FoodLoggingTabFailed) {
          return Center(child: Text("Couldn't load results sorry"));
        }

        if (state is FoodLoggingTabLoaded) {
          // TODO: stateful widget! - stores and loads appropriate tab bloc
          // TOTEST: use delay to test this
          return ListView(
            children: <Widget>[
              for (var foodRecordResult in state.results)
                if (widget.foodLoggingState.multiSelect)
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
